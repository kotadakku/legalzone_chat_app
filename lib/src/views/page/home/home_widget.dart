import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:legal_chat/src/controller/controller.dart';
import 'package:legal_chat/src/data/model/model.dart';
import 'package:legal_chat/src/routes/app_routes.dart';
import 'package:legal_chat/src/views/page/page.dart';
import 'package:legal_chat/src/views/page/search/search_page.dart';
import 'package:legal_chat/src/views/widget/widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController _userController = Get.find();
    final ChatRoomController _chatRoomController = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.to(SettingPage());
          },
          child: Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.all(10.0),
            child: ClipOval(
              child:ImageNetworkLoading(
                "${_userController.user.value.avatar}",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        title: Text("Legal Chat"),
      ),
      body: RefreshIndicator(

        onRefresh: () async {  },
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                margin: EdgeInsets.only(top: 10.0.h),
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Get.to(SearchPage());
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(Icons.search),
                      ),
                      Text("Search")
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.grey.withOpacity(0.1),
                      primary: Colors.grey.withOpacity(0.5),
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      )
                  ),

                )
            ),

            Container(
              height: 105,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 80,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      height: 100,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25.0),
                                  child: Image.network(
                                      "https://reqres.in/img/faces/7-image.jpg",
                                      fit:BoxFit.fill
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 5,
                                  child: Container(
                                    width: 13,
                                    height: 13,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              spreadRadius: 2,
                                              color: Colors.white
                                          )
                                        ]
                                    ),
                                  )
                              )
                            ],
                          ),

                          Text("Trần Anh Tuấn",
                            style: TextStyle(
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    );
                  }
              ),),
            GetBuilder<ChatRoomController>(
              init: ChatRoomController(),
              builder: (controller){
                return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.chatRooms.length,
                itemBuilder: (context, index){
                  ChatRoom item = controller.chatRooms[index];
                  return Material(
                    color: Colors.white,
                    child: InkWell(
                      focusColor: Colors.grey,
                      child: ListTile(

                          leading: Stack(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25.0),
                                  child: Image.network(
                                      "${item.user?.avatar}",
                                      fit:BoxFit.fill
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 5,
                                  child: Container(
                                    width: 13,
                                    height: 13,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              spreadRadius: 2,
                                              color: Colors.white
                                          )
                                        ]
                                    ),
                                  )
                              )
                            ],
                          ),
                          title: Text("${item.user?.fullName()}"),
                          subtitle: Row(
                            children: [
                              Expanded(child:
                              item.messages.isNotEmpty ? Text("${item.messages[0].isMe ? 'You': item.user?.fullName()}: ${item.messages[0].content}",
                                overflow: TextOverflow.ellipsis,
                              ): SizedBox(),
                              ),
                              item.messages.isNotEmpty ?Text(" - ${DateFormat('dd/MM/yyyy').format(DateTime.parse(item.messages[0].createAt!))}"): SizedBox()
                            ],
                          ),
                          trailing: Container(
                            height: 15,
                            width: 15,
                            child: ClipOval(
                              child: Image.network("${item.user?.avatar}"),
                            ),
                          )
                      ),
                      onTap: (){
                        print('Tap');
                        Get.toNamed(Routes.CHAT,
                            arguments: {
                              'user': item.user
                            }

                        );
                      },
                      onLongPress: (){
                        Get.bottomSheet(
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.0.h),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 30,
                                        margin: EdgeInsets.only(right: 10.0.w),
                                        child: Icon(Icons.delete),
                                      ),
                                      Text("Delete")
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.0.h),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 30,
                                        margin: EdgeInsets.only(right: 10.0.w),
                                        child: Icon(Icons.delete),
                                      ),
                                      Text("Delete")
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.0.h),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 30,
                                        margin: EdgeInsets.only(right: 10.0.w),
                                        child: Icon(Icons.delete),
                                      ),
                                      Text("Delete")
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.0.h),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 30,
                                        margin: EdgeInsets.only(right: 10.0.w),
                                        child: Icon(Icons.delete),
                                      ),
                                      Text("Delete")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(50.0))
                            ),
                          ),
                          barrierColor: Colors.grey.withOpacity(0.2),
                          backgroundColor: Colors.white,
                          isDismissible: true,
                        );
                      },
                    ),
                  );
                },
              );
              }
            )
          ],
        ),
      ),
    );
  }
}
