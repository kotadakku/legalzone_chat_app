
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legal_chat/app/ui/screens/settings/setting_screen.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        title: Text("People"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
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
            title: Text("T"),
          );
        }
      )
    );
  }
}
