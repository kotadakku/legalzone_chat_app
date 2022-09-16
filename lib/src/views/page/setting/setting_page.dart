import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:legal_chat/src/controller/controller.dart';
import 'package:legal_chat/src/routes/app_routes.dart';
import 'package:legal_chat/src/views/page/page.dart';
import 'package:legal_chat/src/views/widget/load/image_network_loading.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController _userController = Get.find();
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
                  child: ImageNetworkLoading(
                    "${_userController.user.value.avatar}",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0.h),
                child: Obx(()=>
                    Text(_userController.user.value.fullName())
                ),
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
                        Get.toNamed(Routes.SETTING);
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
