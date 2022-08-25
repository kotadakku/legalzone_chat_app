
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:legal_chat/app/controllers/bottom_nav_controller.dart';

class BotomNavigator extends StatelessWidget {
  const BotomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavController bottom_nv_controller = Get.find();
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
          currentIndex: bottom_nv_controller.tabIndex.value,
          onTap: (index) =>bottom_nv_controller.changeTabIndex(index),
        )
    );
  }
}
