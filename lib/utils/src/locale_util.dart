import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/app/global.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/provider/provider.dart';

import 'save/sp_util.dart';

/// @class : LocaleOptions
/// @date : 2021/08/26
/// @name : jhf
/// @description :语言工具类
class LocaleUtil {
  ///更新语言
  static void updateLocale(Language language) {
    Locale? locale;
    if (language.language == '' || language.country == '') {
      // 使用原生方式获取设备语言
      locale = PlatformDispatcher.instance.locale;
    } else {
      locale = Locale(language.language, language.country);
    }
    // 移除 Get.updateLocale，完全使用 Provider 管理状态
    if (Global.context != null) {
      Provider.of<LocaleNotifier>(
        Global.context!,
        listen: false,
      ).setLocale(locale);
    }
  }

  ///获取当前存储的默认语言
  static Locale? getDefault() {
    var language = SpUtil.getLanguage();
    if (language == null || language.language == '' || language.country == '') {
      return PlatformDispatcher.instance.locale;
    } else {
      return Locale(language.language, language.country);
    }
  }
}
