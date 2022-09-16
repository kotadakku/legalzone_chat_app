import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:legal_chat/src/controller/controller.dart';
import 'package:legal_chat/src/data/model/message_data.dart';
import 'package:legal_chat/src/data/model/model.dart';
import 'package:legal_chat/src/data/repositories/chat_repo.dart';
import 'package:legal_chat/src/service/service.dart';
import 'package:legal_chat/src/data/provider/provider.dart';

class ChatController extends GetxController{
  final StompService _stompService = Get.find();
  final TextEditingController textMsgController = TextEditingController();
  final ChatRoomController _chatRoomController = Get.find();
  final UserController _userController = Get.find();
  Rx<User> user = User().obs;
  final index = (-1).obs;


  @override
  void onInit() {

    user.value = Get.arguments['user'];
    index.value = _chatRoomController.chatRooms.indexWhere((element) =>
      element.user?.id == user.value.id
    );
    _stompService.stompClient.send(
      destination: '/pub/chat/message',
      headers: {
        'Authorization': 'Bearer ${Get.put(AuthService()).token}'
      },
      body: json.encode({
        "receiver": user.value.id,
        "content": "hello",
        "message_type": "ENTER"
      },),
    );
    getMessages();
  }

  void sendMsg() {
    if(index.value >-1) {
      _chatRoomController.chatRooms[index.value].messages.insert(0,
          MessageData(
            content: textMsgController.text,
            isMe: true,
            createAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
            isRead: false,
          )
      );
    }
    _stompService.stompClient.send(
      destination: '/pub/chat/message',
      headers: {
        'Authorization': 'Bearer ${Get.put(AuthService()).token}'
      },
      body: json.encode({
        "receiver": user.value.id,
        "sender": _userController.user.value.id,
        "content": textMsgController.text,
        "message_type": "MESSAGE"
      },),
    );


    update();
  }

  void typingAction(){
    _stompService.stompClient.send(
      destination: '/pub/chat/message',
      headers: {
        'Authorization': 'Bearer ${Get.put(AuthService()).token}'
      },
      body: json.encode({
        "receiver": user.value.id,
        "content": textMsgController.text,
        "message_type": "TYPING"
      },),
    );
  }

  Future<void> getMessages() async {
    try{
      final result = await ChatRepo().getMessages(
          options: Options(
              headers: {
                'Authorization': 'Bearer ${Get.find<AuthService>().token}'
              }
          ), userId: user.value.id!
      );
      if(result.statusCode == CODE_SUCCESS ){
        _chatRoomController.chatRooms[index.value].messages = result.listObjects;
        // saveUser(result.response);
      }
      else{
        if (kDebugMode) {
          print(result.msg);
        }

      }
    } catch (error){
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}