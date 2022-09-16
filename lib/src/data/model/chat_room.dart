import 'package:equatable/equatable.dart';
import 'package:legal_chat/src/data/model/message_data.dart';

import 'model.dart';

class ChatRoom extends Equatable{
  String? id;
  String? status;
  List<MessageData> messages = [];
  String? createAt;
  String? updateAt;
  User? user;

  ChatRoom.fromJson(json){
    id = json['id'];
    status = json['status'];

    if(json['lastMessage'] != null){
      for(var item in json['lastMessage']){
        messages.add(MessageData.fromJson(item));
      }
    }
    if(json['user'] != null){
      user = User.fromJson(json['user']);
    }

    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }

  @override
  List<Object?> get props => [id];
}