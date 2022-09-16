import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService extends GetxService{
  late StreamSubscription<ConnectivityResult> _streamSubscription;
  @override
  void onInit() {
    _streamSubscription =  Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
      bool isConnected = await checkInternet();
      if(!isConnected){
        Get.find<ScaffoldMessengerState>().showSnackBar(SnackBar(
          width: 150.w,
          content: Text('no_internet_connection'.tr,
            textAlign: TextAlign.center
          ),
        )
        );
      }
    });
  }
  Future<bool> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
  void showSnackBarNoInternet() {
    Get.defaultDialog(
      title: 'notification'.tr,
      middleText: 'no_internet_connection'.tr,
      textConfirm: 'Ok',
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
      },
    );
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }

}