import 'package:get/get.dart';

class Validator {
  dynamic validatorEmail(String email){
    if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
      return 'text_support'.tr;
    }
    if(email.trim() == ''){
      return 'text_support'.tr;;
    }
  }
  dynamic? validatorName(String name){
    if(!RegExp("^[a-zA-Z\\s]{1,}").hasMatch(name)){
      return 'text_support'.tr;
    }
  }
  dynamic? validatorPhone(String? phone){
    if(!RegExp(r"(^0[0-9\-\+]{9})|(^\+[0-9\-\+]{10,15})").hasMatch(phone!.trim())){
      return 'invalid_phone_number'.tr;
    }
  }
  dynamic? validatorNumberCard(String numberCard){
    print(numberCard.length);
    if(!RegExp(r"^[0-9]{15,19}").hasMatch(numberCard)){
      return 'text_support'.tr;
    }
  }
  dynamic? validatorDegitCode(String input, int length){
    if(!RegExp("^[0-9]{$length}").hasMatch(input)){
      return 'text_support'.tr;
    }
  }

  dynamic? validatorCode(String input){
    if(!RegExp("^[^-\s]{1,}").hasMatch(input)){
      return 'text_support'.tr;
    }
  }
  dynamic? validatorPassword(String? password ){
    if(password != null){
      if(!RegExp("(?=.*\\d)(?!.*\\s)(?=.*[a-z])(?=.*[A-Z])(?=.*[@\\!%*?&])(?=.*[a-zA-Z]).{8,}").hasMatch(password)){
        return 'invalid_password'.tr;
      }
    }
  }
  dynamic? validatorConfirmPassword(String password, String? confirmPassword){
    if(password != confirmPassword){
      return 'password_incorrect'.tr;
    }
  }
  dynamic? validatorNull(String name){
    if(!RegExp("^[^]{1,}").hasMatch(name)){
      return 'text_support'.tr;
    }
  }
}
