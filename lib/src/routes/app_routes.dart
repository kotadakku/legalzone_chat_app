import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legal_chat/src/binding/binding.dart';
import 'package:legal_chat/src/binding/chat/chat_binding.dart';
import 'package:legal_chat/src/binding/setting/setting_binding.dart';
import 'package:legal_chat/src/views/page/page.dart';
import 'package:legal_chat/src/views/page/search/search_page.dart';
part './app_pages.dart';

class AppPages {
  static final routes =[
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding()
    ),
    GetPage(
      name: Routes.HOME,
      page: () => ControlPage()
    ),
    GetPage(
        name: Routes.CHAT,
        page: () => ChatPage(),
        binding: ChatBinding()
    ),
    GetPage(
        name: Routes.SEARCH,
        page: () => SearchPage(),
        binding: SettingBinding()
    ),
    GetPage(
        name: Routes.SETTING,
        page: () => SettingPage(),
        binding: SettingBinding()
    ),
    GetPage(
        name: Routes.MODE_SETTING,
        page: () => ModeSettingPage(),
        binding: SettingBinding()
    ),
  ];
}