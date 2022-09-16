import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_chat/src/views/theme/theme.dart';


class AppBarBase extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? middle;
  final Widget? trailing;
  final bool automaticallyImplyLeading;
  final EdgeInsetsDirectional? padding;

  const AppBarBase({Key? key,
    this.leading,
    this.middle,
    this.trailing,
    this.padding,
    this.automaticallyImplyLeading = false,
  }) : super(key: key);


  // You also need to override the preferredSize attribute.
  // You can set it to kToolbarHeight to get the default appBar height.
  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).viewPadding.top + 56.h,
      child: CupertinoNavigationBar(
        heroTag: 'appbar',
        automaticallyImplyLeading: automaticallyImplyLeading,
        transitionBetweenRoutes: false,
        backgroundColor: AppColor.backgroundLight,
        brightness: Brightness.light,
        padding: padding?? EdgeInsetsDirectional.only(top: 12.h, bottom: 16.h, start: 20.w, end: 20.w),
        leading: leading,
        middle: middle,
        trailing: trailing,
      ),
    );
  }
}