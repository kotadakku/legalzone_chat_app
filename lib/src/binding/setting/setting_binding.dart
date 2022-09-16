import 'package:get/get.dart';
import 'package:legal_chat/src/controller/controller.dart';

class SettingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }

}