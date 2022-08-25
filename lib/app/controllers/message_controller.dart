import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../data/models/message_data.dart';


/// [https://www.piesocket.com/websocket-tester] adresten dummy websocket kullanılmıştır.
class MessageController extends GetxController{
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  late final WebSocketChannel? channel;
  TextEditingController? textController= TextEditingController();

  late bool connected; // boolean value to track connection status

  String myid = "222"; //my id
  String recieverid = "111"; //reciever id
  // swap myid and recieverid value on another mobile to test send and recieve
  String auth = "chatapphdfgjd34534hjdfk"; //auth key

  List<MessageData> msglist = [
    MessageData(isme: true, userid: '123', msgtext: 'Hello, How are you ?'),
    MessageData(isme: false, userid: '123', msgtext: 'Hi, I\'m good'),
    MessageData(isme: true, userid: '123', msgtext: 'What are you doing? What are you doing? What are you doing?'),
    MessageData(isme: true, userid: '123', msgtext: 'Can you help me now?'),
  ];


  void sendMessage() {
    if (textController!.text.isNotEmpty) {
      channel!.sink.add(textController!.text);
    }
  }

  @override
  void onInit() {
    super.onInit();
    connected = false;
    channelconnect();


  }


  @override
  void dispose() {

    channel!.sink.close();
    super.dispose();
  }

  channelconnect(){ //function to connect
    try{
      channel = IOWebSocketChannel.connect("ws://websocket-legal.herokuapp.com/$myid"); //channel IP : Port
      channel?.stream.listen((message) {
          if(message == "connected") {
            connected = true;
            print("Connection establised.");
          }
          else if(message == "send:success"){
            print("Message send success");
            textController?.text = "";
          }
          else if(message == "send:error") {
            print("Message send error");
          }
          else if(message.substring(0, 6) == "{'cmd'"){
            print("Message data");
            message = message.replaceAll(RegExp("'"), '"');
            var jsondata = json.decode(message);

            msglist.add(MessageData( //on message recieve, add data to model
              msgtext: jsondata["msgtext"],
              userid: jsondata["userid"],
              isme: false,
              )
            );
            update();
          }
        },
        onDone: () {
          //if WebSocket is disconnected
          print("Web socket is closed");
          connected = false;
        },
        onError: (error) {
          print(error.toString());
        },);
    }catch (_){
      print("error on connecting to websocket.");
    }
  }

  Future<void> sendmsg(String sendmsg, String id) async {
    if(connected == true){
      String msg = "{'auth':'$auth','cmd':'send','userid':'$id', 'msgtext':'$sendmsg'}";
      textController?.text = "";
      msglist.add(MessageData(msgtext: sendmsg, userid: myid, isme: true));
      update();
      channel?.sink.add(msg); //send message to reciever channel
    }else{
      channelconnect();
      print("Websocket is not connected.");
    }
  }

}