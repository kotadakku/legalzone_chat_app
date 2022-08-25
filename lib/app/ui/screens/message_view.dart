import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:legal_chat/app/ui/screens/search_screen.dart';
import 'package:legal_chat/app/ui/screens/settings/setting_screen.dart';

import '../../controllers/message_controller.dart';
import 'chat.dart';

class MessageView extends StatelessWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageController = Get.put(MessageController());


    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.to(SettingScreen());
          },
          child: Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.all(10.0),
            child: ClipOval(
              child: Image.network("https://thutucphapluat.com/files/profile_images/_file6237e8019676f-avatar.png"),
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
                    Get.to(SearchScreen());
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
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 12,
              itemBuilder: (context, index){
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
                        title: Text("Bùi Ngọc Khánh"),
                        subtitle: Row(
                          children: [
                            Expanded(child:
                            Text("You: Hello Hello HelloHello Hello Hello Hello",
                              overflow: TextOverflow.ellipsis,
                            ),
                            ),
                            Text(" - Mar 25"),
                          ],
                        ),
                        trailing: Container(
                          height: 15,
                          width: 15,
                          child: ClipOval(
                            child: Image.network("https://reqres.in/img/faces/7-image.jpg"),
                          ),
                        )
                    ),
                    onTap: (){
                      print('Tap');
                      Get.to(ChatPage());
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
            ),
          ],
        ),
      ),
    );
  }
}
