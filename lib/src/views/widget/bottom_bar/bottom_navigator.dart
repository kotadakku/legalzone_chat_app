import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:legal_chat/src/controller/controller.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.find();
    return Obx(()=>
        BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/message.svg"),
              activeIcon: SvgPicture.asset("assets/icons/message.svg", color: Colors.blue,),
              label: 'Tin nhắn',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/users.svg"),
              activeIcon: SvgPicture.asset("assets/icons/users.svg", color: Colors.blue,),
              label: 'Người liên hệ',
            ),
          ],
          currentIndex: _homeController.tabIndex.value,
          onTap: (index) =>_homeController.changeTabIndex(index),
        )
    );
  }
}
