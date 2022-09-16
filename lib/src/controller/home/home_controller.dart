
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legal_chat/src/routes/app_routes.dart';

class HomeController extends GetxController{
  final tabIndex = 0.obs;

  @override
  void onInit() {

  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

}