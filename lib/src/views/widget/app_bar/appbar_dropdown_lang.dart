
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:legal_chat/src/controller/controller.dart';
import 'package:legal_chat/src/translation/translation.dart';
import 'package:legal_chat/src/views/theme/theme.dart';

class AppbarDropdownButton extends StatelessWidget {
  AppbarDropdownButton({Key? key}) : super(key: key);
  final MainController _mainController = Get.find();

  List<int> _getDividersIndexes(items) {
    List<int> _dividersIndexes = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isOdd) {
        _dividersIndexes.add(i);
      }
    }
    return _dividersIndexes;
  }
  List<DropdownMenuItem<String>> _addDividersAfterItems(Map<String, String> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items.entries) {
      if(item.key == _mainController.lang.value){
        _menuItems.insertAll(0,
          [
            DropdownMenuItem<String>(
              value: item.key,
              child: Row(
                children: [
                  SizedBox(width: 8,),
                  Text(item.value.tr,
                    style: TextStyle(
                        color: AppColor.accent,
                        fontSize: AppSize.textBase,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 16,
                    width: 16,
                    child: SvgPicture.asset(
                      'assets/icons/ic_check.svg',
                      color: AppColor.accent,
                    ),
                  ),
                  SizedBox(width: 12,),
                ],
              ),
            ),
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(
                height: 1,
              ),
            ),
          ],
        );
        continue;
      }
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item.key,
            child: Row(
              children: [
                SizedBox(width: 8,),
                Text(item.value.tr,
                  style: TextStyle(
                      color: AppColor.content,
                      fontSize: AppSize.textBase,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
          ),
          const DropdownMenuItem<String>(
            enabled: false,
            child: Divider(
              height: 1,
            ),
          ),
        ],
      );
    }
    _menuItems.removeLast();
    return _menuItems;
  }
  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      isExpanded: true,
      items:_addDividersAfterItems(Map<String, String>.from(LocalizationService.langs)),
      onChanged: (value) {
        _mainController.changeLanguage(value as String);

      },
      hint: Obx(()=>Text(_mainController.lang.value.toUpperCase()),),
      icon: Container(
        height: 16,
        width: 16,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        child: SvgPicture.asset('assets/icons/ic_chevron_down.svg',
          color: AppColor.content2,
          height: 4,
          width: 8,
        ),
      ),
      style: TextStyle(
          color: AppColor.content2,
          fontSize: AppSize.textBase,
          fontWeight: FontWeight.w600
      ),
      buttonHeight: 28.h,
      buttonWidth: 48.w,
      buttonPadding: const EdgeInsets.symmetric(horizontal: 6.5),
      dropdownElevation: 1,
      underline: const SizedBox(),
      dropdownWidth: 160.w,
      itemHeight: 47,
      customItemsIndexes: _getDividersIndexes(Map<String, String>.from(LocalizationService.langs).values),
      customItemsHeight: 1,
      itemPadding: EdgeInsets.only(left: 0, bottom: 0),
      buttonDecoration: BoxDecoration(
          color: AppColor.backgroundSecondary,
          borderRadius: BorderRadius.circular(5.0)
      ),
      dropdownDecoration: BoxDecoration(
          color: AppColor.backgroundLight,
          borderRadius: BorderRadius.circular(5.0)
      ),
      buttonElevation: 0,

      scrollbarRadius: const Radius.circular(40),
      scrollbarThickness: 6,
      offset: const Offset(0, -10),
    );
  }
}
