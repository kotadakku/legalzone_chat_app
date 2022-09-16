
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:legal_chat/src/controller/controller.dart';
import 'package:legal_chat/src/routes/app_routes.dart';
import 'package:legal_chat/src/views/theme/theme.dart';

class FloatActionButtonNavigationBar extends StatelessWidget {
  FloatActionButtonNavigationBar({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.h,
      width: 64.h,
      child: FloatingActionButton(
        elevation: 1,
        highlightElevation: 0,
        heroTag: 'home_btn',
        backgroundColor: AppColor.fillPositive,
        focusColor: AppColor.accent100,
        onPressed: () {
          _homeController.changeTabIndex(1);
          Get.offNamed(Routes.HOME);
        },
        child: SvgPicture.asset(
          'assets/icons/ic_qr.svg',
          height: 37.h,
          color: AppColor.backgroundLight,
        ),
      ),
    );
  }
}
