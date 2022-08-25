
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'dart_mode.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Me'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              margin: EdgeInsets.only(top: 20.0.h),
              child: ClipOval(
                child: Image.network("https://reqres.in/img/faces/7-image.jpg"),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.h),
              child: Text("Phó Hữu"),
            ),

            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Material(
                  color: Colors.white,
                  child: InkWell(
                    focusColor: Colors.grey,
                    onTap: (){
                      Get.to(DartModeScreen());
                    },
                    child: ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(Icons.dark_mode, color: Colors.white,),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                        ),
                      ),
                      title: Text('Dart mode'),
                      subtitle: Text('System'),
                    ),
                  ),
                ),

                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(Icons.dark_mode, color: Colors.white,),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle
                    ),
                  ),
                  title: Text('Dart mode'),
                  subtitle: Text('System'),
                ),
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(Icons.dark_mode, color: Colors.white,),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle
                    ),
                  ),
                  title: Text('Dart mode'),
                  subtitle: Text('System'),
                ),
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(Icons.dark_mode, color: Colors.white,),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle
                    ),
                  ),
                  title: Text('Dart mode'),
                  subtitle: Text('System'),
                ),
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(Icons.dark_mode, color: Colors.white,),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle
                    ),
                  ),
                  title: Text('Dart mode'),
                  subtitle: Text('System'),
                ),
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(Icons.dark_mode, color: Colors.white,),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle
                    ),
                  ),
                  title: Text('Dart mode'),
                  subtitle: Text('System'),
                ),
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(Icons.dark_mode, color: Colors.white,),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle
                    ),
                  ),
                  title: Text('Dart mode'),
                  subtitle: Text('System'),
                ),
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(Icons.dark_mode, color: Colors.white,),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle
                    ),
                  ),
                  title: Text('Dart mode'),
                  subtitle: Text('System'),
                ),
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(Icons.dark_mode, color: Colors.white,),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle
                    ),
                  ),
                  title: Text('Dart mode'),
                  subtitle: Text('System'),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
