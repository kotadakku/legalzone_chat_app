
import 'package:dio/dio.dart';
import 'package:legal_chat/src/data/model/message_data.dart';
import 'package:legal_chat/src/data/provider/provider.dart';

abstract class ChatRepoRepository{
  Future<Responses<MessageData>> getMessages({int userId, Map<String, dynamic>? queryParameters, Options? options});
}

class ChatRepo{
  @override
  Future<Responses<MessageData>> getMessages({required int userId, Map<String, dynamic>? queryParameters, Options? options}) async {
    try{
      final response = await ApiProvider().get(
          path: ApiUrls.baseUrl2 + "/chat/" + userId.toString() +"/messages",
          options: options
      );

      if(response.data != null){
        List<MessageData> messages = List.from((response.data['content'] as List).map((e) => MessageData.fromJson(e)));
        return Responses(statusCode: CODE_SUCCESS,
            response: response.data,
            listObjects: messages);
      }
      else{
        return Responses(statusCode: CODE_RESPONSE_NULL, msg: '');
      }
    } catch(error){
      String? errorMessage = DioExceptions.fromDioError(error).toString();
      return Responses(statusCode: CODE_ERROR, msg: errorMessage);
    }
  }
}