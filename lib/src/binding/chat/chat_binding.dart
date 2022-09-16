import 'package:get/get.dart';
import 'package:legal_chat/src/controller/chat/chat_controller.dart';

class ChatBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }

}