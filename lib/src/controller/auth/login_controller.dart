import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:legal_chat/src/controller/controller.dart';
import 'package:legal_chat/src/data/provider/provider.dart';
import 'package:legal_chat/src/data/repositories/repositories.dart';
import 'package:legal_chat/src/service/service.dart';

class LoginController extends GetxController{
  late GlobalKey<FormState> formKey;
  late TextEditingController phoneController;
  late TextEditingController passwordTextController;
  final AuthService _authService = Get.find();
  final ConnectivityService _connectivityService = Get.find();
  final UserController _userController = Get.find();
  final ChatRoomController _chatRoomController = Get.find();
  final isObscurePassword = true.obs;
  final isLogging = false.obs;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    phoneController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  void login() async {
    FocusManager.instance.primaryFocus!.unfocus();
    if(formKey.currentState!.validate()){
      isLogging.value = true;
      final storage = FlutterSecureStorage();
      storage.write(
          key: CacheManagerKey.USERNAME.toString(),
          value: phoneController.text

      );
      storage.write(
          key: CacheManagerKey.PASSWORD.toString(),
          value: passwordTextController.text

      );
      bool connected = await _connectivityService.checkInternet();
      if(connected){
        final Map<String, String> data = {
          'email': phoneController.text,
          'password': passwordTextController.text
        };
        try{
          final result = await UserRepo().getToken(
              data: data
          );
          if(result.statusCode == CODE_SUCCESS){
            GetStorageProvider().save(
                key: CacheManagerKey.TOKEN.toString(),
                value: result.objects
            );
            _authService.token = result.objects!;
            _authService.isLogged.value = true;
            _userController.getUsers();
            _chatRoomController.getChatRoom();
            await _userController.getDetailUser();

            Get.put(StompService()).listenWebSocket();
          }
          else{
            Get.defaultDialog(
              title: 'notification'.tr,
              middleText: 'login_failed'.tr,
              textConfirm: 'Ok',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              },
            );
          }
        } catch (error){
          Get.defaultDialog(
            title: 'notification'.tr,
            middleText: 'login_failed'.tr,
            textConfirm: 'Ok',
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            },
          );
        } finally{
          isLogging.value = false;
        }
      }else{
        _connectivityService.showSnackBarNoInternet();
      }
    }

  }
}