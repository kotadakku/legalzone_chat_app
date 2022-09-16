import 'package:dio/dio.dart';

import 'package:get/get.dart' as getx;

import 'api_provider.dart';


class LoggingInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl ) + (options.path)}");
    if(options.headers != null){
      print("Headers:");
      options.headers.forEach((k, v) => print('$k: $v'));
    }
    if (options.queryParameters != null) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print("--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) async {
    // print("<-- ${dioError.message} ${(dioError.response?.requestOptions != null ?
    // dioError.response?.requestOptions.path : 'URL')}");
    // print(
    //     "${dioError.response != null ? dioError.response?.data : 'Unknown Error'}");
    // print("<-- End error");
    // if(dioError.response?.statusCode == 403 && dioError.response?.requestOptions.path != ApiUrls.baseUrl+'/api/v1/token/refresh'
    //     && dioError.response!.data['message'].toString().contains("The Token has expired on")){
      // final response = await ApiProvider().get(
      //   options: Options(
      //     headers: {
      //       'Authorization': 'Bearer ${getx.Get.find<AuthService>().refreshToken}'
      //     }
      //   ),
      //   path: ApiUrls.baseUrl +'/api/v1/token/refresh',
      // );
      // if (response.statusCode == 200) {
      //   dioError.requestOptions.headers['Authorization'] = 'Bearer ${response.data['access_token']}';
      //   await GetStorageProvider().save(key: CacheManagerKey.TOKEN.toString(), value: response.data['access_token']);
      //   await GetStorageProvider().save(key: CacheManagerKey.REFRESH_TOKEN.toString(), value: response.data['refresh_token']);
      //   getx.Get.find<AuthService>().token = response.data['access_token'];
      //   getx.Get.find<AuthService>().refreshToken = response.data['access_token'];
    //     return handler.resolve(await _retry(dioError.requestOptions));
    //   }
    // }
    return handler.next(dioError);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        "<-- ${response.statusCode} ${(response.redirects != null ? response.requestOptions.path : 'URL')}");
    if(response.headers != null){
      print("Headers:");
      response.headers.forEach((k, v) => print('$k: $v'));
    }
    print("Response: ${response.data}");
    print("<-- END HTTP");
    return super.onResponse(response, handler);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return ApiProvider().request(path:requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
