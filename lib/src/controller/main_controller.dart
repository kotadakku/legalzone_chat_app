import 'package:get/get.dart';
import 'package:legal_chat/src/translation/translation.dart';

class MainController extends GetxController{
  final lang = 'en'.obs;

  @override
  void onInit() {
    lang.value = LocalizationService.locale!.languageCode;
  }

  void changeLanguage(String value) async {
    lang.value = value;
    LocalizationService.changeLocale(value);
  }
}