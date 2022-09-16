import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:legal_chat/src/data/model/model.dart';
import 'package:legal_chat/src/data/provider/provider.dart';
import 'package:legal_chat/src/data/repositories/repositories.dart';
import 'package:legal_chat/src/service/service.dart';

class UserController extends GetxController{
  final Rx<User> user = User().obs;
  final RxList users = <User>[].obs;


  @override
  void onInit() {
    getDetailUserDB();
  }

  getDetailUserDB() async {
    try{
      final value = await GetStorageProvider().get(key: CacheManagerKey.INFORMATION_USER.toString());
      if(value != null){
        user.value = User.fromJson(value);
      }
    } catch(error){
      if (kDebugMode) {
        print(error);
      }
    }
  }

  Future<void> getDetailUser() async {
    try{
      final result = await UserRepo().getUser(
          options: Options(
              headers: {
                'Authorization': 'Bearer ${Get.find<AuthService>().token}'
              }
          )
      );
      if(result.statusCode == CODE_SUCCESS ){
        user.value = result.objects ?? user.value;
        saveUser(result.response);
      }
      else{
        if (kDebugMode) {
          print(result.msg);
        }

      }
    } catch (error){
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
  Future<void> getUsers() async {
    try{
      final result = await UserRepo().getUsers(
        queryParameters: {
          'page': 0,
          'pageSize': 12,
          'enabled' : 1
        },
          options: Options(
              headers: {
                'Authorization': 'Bearer ${Get.find<AuthService>().token}'
              },
          )
      );
      if(result.statusCode == CODE_SUCCESS ){
        users.value = result.listObjects;
      }
      else{
        if (kDebugMode) {
          print(result.msg);
        }

      }
    } catch (error){
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }


  void saveUser(data){
    GetStorageProvider().save(
        key: CacheManagerKey.INFORMATION_USER.toString(),
        value: data
    );
  }
}