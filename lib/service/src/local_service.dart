import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/utils/src/save/sp_util.dart';

class LocalService extends GetxService {
  final Rx<Locale> _locale = Locale.fromSubtags(languageCode: 'zh').obs;

  @override
  void onInit() {
    super.onInit();
    var language = SpUtil.getLanguage();
    if (language == null || language.language == '' || language.country == '') {
      _locale.value = Locale.fromSubtags(languageCode: 'zh');
    } else {
      _locale.value = Locale(language.language, language.country);
    }
  }

  Rx<Locale> get locale => _locale;

  void setLocale(Locale locale) {
    _locale.value = locale;
  }

}
