import 'package:get/get.dart';
import '../ui/screens/chat.dart';
part './app_pages.dart';

class AppPages {
  static final routes =[
    GetPage(name: Routes.HOME, page: () => ChatPage())
  ];
}