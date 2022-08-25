import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

import '../../controllers/message_controller.dart';

class ChatPage extends StatelessWidget {

  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageController = Get.put(MessageController());
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          leadingWidth: 35,
          title: ListTile(
            leading: Stack(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                        "https://reqres.in/img/faces/7-image.jpg",
                        fit:BoxFit.fill
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 3,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 1.5,
                                color: Colors.white
                            )
                          ]
                      ),
                    )
                )
              ],
            ),
            title: Text('Phuong'),
            subtitle: Text('Active Now'),
          ),
          //if app is connected to node.js then it will be gree, else red.
          titleSpacing: 0,
        ),
        body: Container(
            child: Column(children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: SingleChildScrollView(
                      child:Column(children: [

                        Container(
                          child:Text("Your Messages", style: TextStyle(fontSize: 20)),
                        ),
                        GetBuilder<MessageController>(
                            init: MessageController(),
                            builder: (controller){
                              if(controller.msglist.isEmpty){
                                return Text("error");
                              }
                              else {
                                return  ListView(
                                shrinkWrap: true,
                                children: messageController.msglist.map((onemsg){
                                  return Container(
                                      margin: EdgeInsets.only(
                                        top: 10.0.h, //else margin at right
                                      ),
                                      alignment: onemsg.isme! ? Alignment.centerLeft:Alignment.centerRight,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          onemsg.isme! ? Stack(
                                            children: [
                                              Container(
                                                width: 30,
                                                height: 30,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(20.0),
                                                  child: Image.network(
                                                      "https://reqres.in/img/faces/7-image.jpg",
                                                      fit:BoxFit.fill
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 0,
                                                  right: 2,
                                                  child: Container(
                                                    width: 8,
                                                    height: 8,
                                                    decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        shape: BoxShape.circle,
                                                        boxShadow: [
                                                          BoxShadow(
                                                              spreadRadius: 1.5,
                                                              color: Colors.white
                                                          )
                                                        ]
                                                    ),
                                                  )
                                              )
                                            ],
                                          ): SizedBox(),
                                          GestureDetector(
                                            onLongPress: (){
                                              Get.bottomSheet(
                                                Row(
                                                  children: [
                                                    Icon(Icons.delete),
                                                    Icon(Icons.delete),
                                                    Icon(Icons.delete),
                                                    Icon(Icons.delete),
                                                  ],
                                                )
                                              );
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 10.0.w),
                                              padding: EdgeInsets.all(10.0),
                                              constraints: BoxConstraints(
                                                  maxWidth: 0.6.sw
                                              ),
                                              child: Text(onemsg.msgtext!, style: TextStyle(fontSize: 17)),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20.0),
                                                color: onemsg.isme! ? Colors.grey.withOpacity(0.2): Colors.blueAccent,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                  );
                                }).toList(),
                              );
                              }
                            }
                        )
                      ],)
                  )
              ),
              ),
              Material(
                elevation: 5,
                child: Container(
                    color: Colors.white,
                    height: 60,
                    child: Row(children: [

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                        child: Icon(Icons.camera_alt),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                        child: Icon(Icons.image),
                      ),
                      Expanded(
                          child: Container(
                            child: TextField(
                              controller: messageController.textController,
                              decoration: InputDecoration(
                                  hintText: "Aa",
                                  suffixIcon: Icon(Icons.tag_faces)
                              ),
                            ),
                          )
                      ),

                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0.w),
                          child: ElevatedButton(
                            child:Icon(Icons.send),
                            onPressed: (){
                              if( messageController.textController?.text != ""){
                                messageController.sendmsg( messageController.textController!.text,  messageController.recieverid); //send message with webspcket
                              }else{
                                print("Enter message");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            ),
                          )
                      )
                    ],)
                ),
              )
            ],)
        )
    );
  }
  void onTapDown(BuildContext context, TapDownDetails details) {
    print('${details.globalPosition}');
  }

}
