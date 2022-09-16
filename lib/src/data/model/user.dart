import 'package:equatable/equatable.dart';

class User extends Equatable{
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? avatar;

  User();

  User.fromJson(data) {
    id = data['id'];
    firstName = data['firstName'];
    lastName = data['lastName'];
    email = data['email'];
    phone = data['phone'];
    avatar = data['avatar'];
  }


  String fullName(){
    String name = '';

    if(firstName != null){
      name += firstName!;
    }
    if(lastName != null){
      name += ' ' + lastName!;
    }
      return name;
  }

  @override
  List<Object?> get props => [id];
}