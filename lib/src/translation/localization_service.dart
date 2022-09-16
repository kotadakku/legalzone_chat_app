import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:legal_chat/src/data/provider/provider.dart';
part 'st_en.dart';
part 'st_vi.dart';


class LocalizationService extends Translations {

// locale sẽ được get mỗi khi mới mở app (phụ thuộc vào locale hệ thống hoặc bạn có thể cache lại locale mà người dùng đã setting và set nó ở đây)
  static final locale = _getLocaleFromLanguage();

// fallbackLocale là locale default nếu locale được set không nằm trong những Locale support
  static final fallbackLocale = Locale('en', 'US');

// language code của những locale được support
  static final langCodes = [
    'vi',
    'en',
  ];

// các Locale được support
  static final locales = [
    const Locale('vi', 'VN'),
    const Locale('en', 'US'),
  ];


// cái này là Map các language được support đi kèm với mã code của lang đó: cái này dùng để đổ data vào Dropdownbutton và set language mà không cần quan tâm tới language của hệ thống
  static final langs = LinkedHashMap.from({
    'en': 'english',
    'vi': 'vietnamese',
  });

// function change language nếu bạn không muốn phụ thuộc vào ngôn ngữ hệ thống
  static void changeLocale(String langCode) async {
    GetStorageProvider().save(key: CacheManagerKey.LANGUAGE.toString(),
      value: langCode
    );
    final locale = _getLocaleFromLanguage();
    Get.updateLocale(locale!);
  }

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en,
    'vi_VN': vi,
  };

  static Locale? _getLocaleFromLanguage({String? lang_default}){
    if(lang_default == null){
      GetStorage box = GetStorage();
      lang_default = box.read(CacheManagerKey.LANGUAGE.toString())??'vi';
    }
    for (int i = 0; i < langCodes.length; i++) {
      if (lang_default == langCodes[i]) return locales[i];
    }
    return Get.locale;
  }
}

