

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:legal_chat/src/data/model/model.dart';
import 'package:legal_chat/src/data/provider/provider.dart';

abstract class UserRepoInterface{
  Future<Responses<String>> getToken({data});
  Future<Responses<User>> getUser({Options? options});
  Future<Responses<User>> getUsers({Map<String, dynamic> queryParameters, Options? options});
}

class UserRepo extends UserRepoInterface{

  @override
  Future<Responses<String>> getToken({data}) async {
    try{
      final response = await ApiProvider().post(
        path: ApiUrls.baseUrl + ApiUrls.login,
        data: data
      );

      if(response.data != null){
        String accessToken = response.data['access_token'];
        return Responses<String>(
            statusCode: CODE_SUCCESS,
            objects: accessToken);
      }
      else{
        return Responses<String>(statusCode: CODE_RESPONSE_NULL, msg: '');
      }
    } catch(error){
      if(error is DioError){
        if(error.response?.statusCode == 400){
          return Responses<String>(statusCode: error.response?.statusCode, msg: 'incorrect_login'.tr);
        }
      }

      String? errorMessage = DioExceptions.fromDioError(error).toString();

      return Responses<String>(statusCode: CODE_ERROR, msg: errorMessage);
    }
  }

  @override
  Future<Responses<User>> getUser({Options? options}) async {
    try{
      final response = await ApiProvider().get(
          path: ApiUrls.baseUrl + ApiUrls.user,
          options: options
      );

      if(response.data != null){
        User user = User.fromJson(response.data);
        return Responses<User>(statusCode: CODE_SUCCESS,
            response: response.data,
            objects: user);
      }
      else{
        return Responses<User>(statusCode: CODE_RESPONSE_NULL, msg: '');
      }
    } catch(error){
      String? errorMessage = DioExceptions.fromDioError(error).toString();
      return Responses<User>(statusCode: CODE_ERROR, msg: errorMessage);
    }
  }

  @override
  Future<Responses<User>> getUsers({Map<String, dynamic>? queryParameters, Options? options}) async {
    try{
      final response = await ApiProvider().get(
          path: ApiUrls.baseUrl + ApiUrls.users,
          options: options
      );

      if(response.data != null){
        List<User> users = List.from((response.data['content'] as List).map((e) => User.fromJson(e)));
        return Responses<User>(statusCode: CODE_SUCCESS,
            response: response.data,
            listObjects: users);
      }
      else{
        return Responses<User>(statusCode: CODE_RESPONSE_NULL, msg: '');
      }
    } catch(error){
      String? errorMessage = DioExceptions.fromDioError(error).toString();
      return Responses<User>(statusCode: CODE_ERROR, msg: errorMessage);
    }

    throw UnimplementedError();
  }

}
