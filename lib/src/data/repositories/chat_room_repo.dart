import 'package:dio/dio.dart';
import 'package:legal_chat/src/data/model/model.dart';
import 'package:legal_chat/src/data/provider/provider.dart';

abstract class ChatRoomRepoInterface{
  Future<Responses<ChatRoom>> getChatRooms({Map<String, dynamic> queryParameters, Options? options});

}

class ChatRoomRepo extends ChatRoomRepoInterface{
  @override
  Future<Responses<ChatRoom>> getChatRooms({Map<String, dynamic>? queryParameters, options}) async {
    try{
      final response = await ApiProvider().get(
          path: ApiUrls.baseUrl2 + ApiUrls.rooms,
          options: options
      );

      if(response.data != null){
        List<ChatRoom> chatRooms = List.from((response.data['content'] as List).map((e) => ChatRoom.fromJson(e)));
        return Responses(statusCode: CODE_SUCCESS,
            response: response.data,
            listObjects: chatRooms);
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