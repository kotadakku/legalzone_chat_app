
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legal_chat/src/controller/controller.dart';
import 'package:legal_chat/src/views/page/home/account_widget.dart';
import 'package:legal_chat/src/views/page/home/people_widget.dart';
import 'package:legal_chat/src/views/widget/widget.dart';

import 'home_widget.dart';

class ControlPage extends StatelessWidget {
  ControlPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.put(HomeController());
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child:  Scaffold(
        bottomNavigationBar: const BottomNavigator(),
        body: Obx(()=>
          IndexedStack(
            index: _homeController.tabIndex.value,
            children: [
              HomeWidget(),
              PeopleWidget()
            ],
          ),
        ),
      ),
    );
  }
  Future<bool> _onWillPop(BuildContext context) async{
    return true;
  }
}