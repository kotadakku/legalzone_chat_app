
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:legal_chat/src/controller/controller.dart';
import 'package:legal_chat/src/data/model/message_data.dart';
import 'package:legal_chat/src/service/service.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';


class StompService extends GetxService{

  late StompClient stompClient;

  void onConnect(StompFrame frame) {
    UserController userController = Get.find();
    ChatRoomController chatRoomController = Get.find();
    stompClient.subscribe(
      destination: '/sub/chat/${userController.user.value.id}',
      callback: (frame) {
        Map<String, dynamic> result = json.decode(frame.body!);
        chatRoomController.receiveMessage(result);


      },
    );
  }

  void listenWebSocket(){
    stompClient = StompClient(
      config: StompConfig(
        url: 'ws://192.168.1.9:8081/ws/chat',
        onConnect: onConnect,
        beforeConnect: () async {
          if (kDebugMode) {
            print('waiting to connect...');
            print('connecting...');
          }
        },
        onWebSocketDone: (){

        },
        onWebSocketError: (dynamic error) => print(error.toString()),
        stompConnectHeaders: {'Authorization': 'Bearer ${Get.put(AuthService()).token}'},
        webSocketConnectHeaders: {'Authorization': 'Bearer ${Get.put(AuthService()).token}'},
      ),
    );
    stompClient.activate();
  }
}
