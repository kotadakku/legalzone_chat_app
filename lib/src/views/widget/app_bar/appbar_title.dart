import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_chat/src/views/theme/theme.dart';

class AppbarTitle extends StatelessWidget {
  final String? title;
  const AppbarTitle({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height:33.h,
        child: Text('$title',
          style: TextStyle(
              color: AppColor.content,
              fontSize: AppSize.text2xl,
              fontWeight: FontWeight.w600
          ),
        )
    );
  }
}
