

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:legal_chat/src/data/model/model.dart';
import 'package:legal_chat/src/data/repositories/chat_room_repo.dart';
import 'package:legal_chat/src/service/service.dart';
import 'package:legal_chat/src/data/provider/provider.dart';

class ChatRoomController extends GetxController{
  List<ChatRoom> chatRooms = [];

  @override
  void onInit() {

  }

  // getDetailUserDB() async {
  //   try{
  //     final value = await GetStorageProvider().get(key: CacheManagerKey.INFORMATION_USER.toString());
  //     if(value != null){
  //       user.value = User.fromJson(value);
  //     }
  //   } catch(error){
  //     if (kDebugMode) {
  //       print(error);
  //     }
  //   }
  // }

  Future<void> getChatRoom() async {
    try{
      final result = await ChatRoomRepo().getChatRooms(
          options: Options(
              headers: {
                'Authorization': 'Bearer ${Get.find<AuthService>().token}'
              }
          )
      );
      if(result.statusCode == CODE_SUCCESS ){
        chatRooms = result.listObjects;
        update();
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

  void receiveMessage(Map<String, dynamic> result) {
    int index = chatRooms.indexWhere((element) =>
    element.user?.id ==  result['sender']
    );
    if(index>-1) {
      chatRooms[index].messages.insert(0,
        MessageData(
          content: result['content'],
          isMe: false,
          createAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
          isRead: false,
        )
      );
    }
    print(result);
    update();
  }


  // void saveUser(data){
  //   GetStorageProvider().save(
  //       key: CacheManagerKey.INFORMATION_USER.toString(),
  //       value: data
  //   );
  // }
}