
import 'package:get/get.dart';
import 'package:legal_chat/src/controller/controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());

  }

}