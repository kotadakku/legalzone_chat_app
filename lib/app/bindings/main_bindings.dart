import 'package:get/get.dart';
import 'package:legal_chat/app/controllers/bottom_nav_controller.dart';

class MainBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavController());
  }

}