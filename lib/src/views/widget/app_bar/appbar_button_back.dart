import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AppbarButtonBack extends StatelessWidget {
  const AppbarButtonBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 24.h,
        width: 24.h,
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Get.back();
            print('back');
          },
          child: SvgPicture.asset('assets/icons/ic_arrow_left.svg',
          ),
        )
    );
  }
}
