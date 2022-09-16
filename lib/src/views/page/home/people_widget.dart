import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legal_chat/src/controller/controller.dart';
import 'package:legal_chat/src/routes/app_routes.dart';
import 'package:legal_chat/src/service/service.dart';
import 'package:legal_chat/src/views/page/page.dart';
import 'package:legal_chat/src/views/widget/widget.dart';

class PeopleWidget extends StatelessWidget {
  const PeopleWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final StompService _stompService = Get.find();
    final UserController _userController = Get.find();
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
                child: ImageNetworkLoading(
                  "${_userController.user.value.avatar}",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          title: Text("People"),
        ),
        body: ListView.builder(
          itemCount: _userController.users.length,
            itemBuilder: (context, index) {
              if(_userController.users[index].email == _userController.user.value.email){
                return const SizedBox();
              }

              return ListTile(
                onTap: (){

                  Get.toNamed(Routes.CHAT,
                    arguments: {
                      'user': _userController.users[index]
                    }
                  );
                },
                leading: Stack(
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.network(
                            "${_userController.users[index].avatar}",
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
                title: Text("${_userController.users[index].fullName()}"),
              );
            }
        )
    );
  }
}
