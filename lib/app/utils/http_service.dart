import 'package:dio/dio.dart';

class ApiRequest {
  final String url;
  final Map<String, dynamic>? data;
  final String? token;

  ApiRequest({ required this.url, this.data, this.token});

  Dio _dio(){
    return Dio(
        BaseOptions(
          headers: {
            'Authorization': token == null ? '' : 'Bearer $token'
          },
          // baseUrl: '',
        )
    );
  }

  void get({Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }){
    _dio().get(this.url, queryParameters: null).then((res){
      if(onSuccess != null) onSuccess(res.data);
    }).catchError((error){
      if(onError != null) onError(error);
    });

  }
  void post( {Function()? beforePost,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
    required Map<String, dynamic> data,
  }){
    _dio().post(this.url, queryParameters: null, data: data).then((value){
      if(onSuccess != null) onSuccess(value.data);
    }).catchError((error){
      // final errorMessage = DioExceptions.fromDioError(error).toString();
      if(onError != null ) onError(error);
    });;
  }

  void put( {Function()? beforePut,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
    required Map<String, dynamic> data,

  }){
    _dio().post(this.url, queryParameters: null, data: data).then((value){
      if(onSuccess != null) onSuccess(value.data);
    }).catchError((error){
      final errorMessage = DioExceptions.fromDioError(error).toString();
      if(onError != null ) onError(errorMessage);
    });
  }

  void delete( {Function()? beforeDelete,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }){
    _dio().post(this.url, queryParameters: null).then((value){
      if(onSuccess != null) onSuccess(value.data);
    }).catchError((error){
      if(onError != null ) onError(error);
    });
  }

}

class DioExceptions implements Exception {

  late String message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message =
            _handleError(dioError.response?.statusCode, dioError.response?.data);
        break;
    // case DioErrorType.DioErrorType:
    //   message = "Send timeout in connection with API server";
    //   break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error["error"];
      case 404:
        return error["message"];
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }
  @override
  String toString() => message;
}