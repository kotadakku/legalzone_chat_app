

import 'package:get/get.dart';
import 'package:legal_chat/src/controller/auth/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }

}