
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:legal_chat/src/controller/controller.dart';
import 'package:legal_chat/src/data/provider/provider.dart';
import 'package:legal_chat/src/data/repositories/repositories.dart';
import 'package:legal_chat/src/service/service.dart';

class AuthService extends GetxService {
  final isLogged = false.obs;
  String token = '';


  @override
  void onInit() async {
    await autoLogin();
  }
  Future<void> autoLogin() async {
    final storage = FlutterSecureStorage();
    String? username = await storage.read(key: CacheManagerKey.USERNAME.toString());
    String? password = await storage.read(key: CacheManagerKey.PASSWORD.toString());
    if(username != null && password != null) {
      try {
        final result = await UserRepo().getToken(
            data: {
              'email': username,
              'password': password
            }
        );
        if (result.statusCode == CODE_SUCCESS) {
          GetStorageProvider().save(
              key: CacheManagerKey.TOKEN.toString(),
              value: result.objects
          );
          token = result.objects!;
          isLogged.value = true;
          final UserController _userController = Get.find();
          final ChatRoomController _chatRoomController = Get.find();
          await _userController.getDetailUser();
          _userController.getUsers();
          _chatRoomController.getChatRoom();
          Get.put(StompService()).listenWebSocket();
        }
        else {

        }
      } catch (error) {
        print(error);
      }
    }
  }
}