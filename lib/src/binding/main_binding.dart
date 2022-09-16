import 'package:get/get.dart';
import 'package:legal_chat/src/controller/controller.dart';
import 'package:legal_chat/src/service/service.dart';

class MainBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(UserController());
    Get.put(ChatRoomController());
    Get.put(AuthService());
    Get.put(ConnectivityService());
    Get.put(StompService());
    Get.put(MainController());
    Get.lazyPut(() => LoginController());
  }

}