import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:legal_chat/src/controller/controller.dart';
import 'package:legal_chat/src/data/model/message_data.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final ChatController _controller = Get.find();
  final ChatRoomController _chatRoomController = Get.find();
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          leadingWidth: 35,
          title: ListTile(
            leading: Stack(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                        "${_controller.user.value.avatar}",
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
                      decoration: const BoxDecoration(
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
            title: Text('${_controller.user.value.fullName()}'),
            subtitle: Text('Active Now'),
          ),
          //if app is connected to node.js then it will be gree, else red.
          titleSpacing: 0,
        ),
        body: Container(
            child: Column(children: [
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(15),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                        child:Column(children: [
                          Text("Your Messages", style: const TextStyle(fontSize: 20)),
                          GetBuilder<ChatRoomController>(
                            init: ChatRoomController(),
                            builder: (controller) {
                              return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              reverse: true,
                              itemCount: controller.chatRooms[_controller.index.value].messages.length,
                              itemBuilder: (context, index) {
                                MessageData item = controller.chatRooms[_controller.index.value].messages[index];
                                return Container(
                                    margin: EdgeInsets.only(
                                      top: 10.0.h, //else margin at right
                                    ),
                                    alignment: item.isMe ? Alignment.centerLeft:Alignment.centerRight,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        item.isMe ? Stack(
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 30,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(20.0),
                                                child: Image.network(
                                                    "${_controller.user.value.avatar}",
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
                                            child: Text(item.content!, style: TextStyle(fontSize: 17)),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20.0),
                                              color: item.isMe ? Colors.grey.withOpacity(0.2): Colors.blueAccent,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                );
                              },
                              shrinkWrap: true,
                            );
                            },

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
                              controller: _controller.textMsgController,
                              // controller: messageController.textController,
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
                              // if( messageController.textController?.text != ""){
                              _controller.sendMsg(); //send message with webspcket
                              // }else{
                              //   print("Enter message");
                              // }
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
}
