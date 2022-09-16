import 'package:intl/intl.dart';

class MessageData{ //message data model
  String? id;
  String? createAt;
  String? updateAt;
  String? content;
  String? chatRoomId;
  bool isRead = false;
  bool isMe = false;
  MessageData(
    {
      this.createAt,
      this.content,
      this.isRead = false,
      this.isMe = false
    }
  );

  MessageData.fromJson(json) {
    id = json['id'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    chatRoomId = json['chatRoomId'];
    if(json['me'] != null){
      isMe = json['me'];
    }
    if(json['read'] != null){
      isRead = json['read'];
    }

    content = json['content'];
  }


  MessageData.fromMessage(Map<String, dynamic> result) {
    createAt = DateFormat('dd/MM/yyyy').format(DateTime.now());
    content = result['content'];
  }
}