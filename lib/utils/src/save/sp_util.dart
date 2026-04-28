import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/utils/src/color_util.dart';

import 'sp_key.dart';

/// @class : SpUtil
/// @date : 2021/08/19
/// @name : jhf
/// @description :键值对存储
class SpUtil {
  static SharedPreferences get _prefs => Get.find<SharedPreferences>();

  ///更新用户信息，需要保存密码
  ///[userInfo] 用户信息
  static void notifyUserInfo(UserEntity userInfo) {
    final UserEntity? oldInfo = getUserInfo();
    if (oldInfo != null) {
      userInfo.password = oldInfo.password;
    }
    SpUtil.deleteUserInfo();
    SpUtil.putUserInfo(userInfo);
  }

  ///删除存储用户信息
  static void deleteUserInfo() {
    _prefs.remove(SPKey.keyUserInfo);
  }

  ///存储用户信息
  ///[userInfo] 用户信息
  static void putUserInfo(UserEntity userInfo) {
    _prefs.setString(SPKey.keyUserInfo, jsonEncode(userInfo.toJson()));
  }

  ///获取用户信息
  ///[UserEntity] 用户信息
  static UserEntity? getUserInfo() {
    try {
      final String? json = _prefs.getString(SPKey.keyUserInfo);
      if (json == null) {
        return null;
      } else {
        return UserEntity.fromJson(jsonDecode(json));
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  ///存储语言
  ///[Language] 语言
  static void updateLanguage(Language language) {
    _prefs.remove(SPKey.language);
    _prefs.setString(SPKey.language, jsonEncode(language.toJson()));
  }

  ///获取语言选项
  ///[Language] 语言
  static Language? getLanguage() {
    try {
      final String? json = _prefs.getString(SPKey.language);
      if (json == null) {
        return null;
      } else {
        return Language.fromJson(jsonDecode(json));
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  ///存储主题颜色
  ///[color] 主题颜色
  static void updateThemeColor(Color color) {
    _prefs.remove(SPKey.themeColors);
    _prefs.setString(SPKey.themeColors, ColorUtil.colorToHexString(color));
  }

  ///获取主题颜色
  static Color? getThemeColor() {
    try {
      final String? colorString = _prefs.getString(SPKey.themeColors);
      if (colorString == null) {
        return null;
      } else {
        return ColorUtil.hexStringColor(colorString);
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  /// 搜索历史记录
  /// [word] 搜索记录
  static void saveSearchHistory(String word) {
    final List<String> history = getSearchHistory();
    if (history.contains(word)) {
      return;
    }
    history.insert(0, word);
    _prefs.setStringList(SPKey.searchHistory, history);
  }

  ///清空搜索历史
  static void deleteSearchHistory() {
    Get.find<SharedPreferences>().remove(SPKey.searchHistory);
  }

  ///获取搜索历史记录
  static List<String> getSearchHistory() {
    try {
      final List<String>? json = _prefs.getStringList(SPKey.searchHistory);
      if (json == null) {
        return [];
      } else {
        return json;
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  /// 浏览历史记录
  /// [detail] 浏览记录
  static void saveBrowseHistory(ProjectDetail detail) {
    final List<String> history = getBrowseHistory();
    for (final String element in history) {
      Map<String, dynamic> map = jsonDecode(element);
      final ProjectDetail convert = ProjectDetail.fromJson(map);
      if (convert.id == detail.id) {
        return;
      }
    }
    final String toJson = jsonEncode(detail.toJson());
    history.insert(0, toJson);
    _prefs.setStringList(SPKey.browseHistory, history);
  }

  ///浏览记录JSON转换为Model之后的数据
  static List<ProjectDetail> getBrowseHistoryModel() {
    final List<ProjectDetail> data = <ProjectDetail>[];
    final List<String> history = getBrowseHistory();
    for (final String element in history) {
      final Map<String, dynamic> map = jsonDecode(element);
      final ProjectDetail convert = ProjectDetail.fromJson(map);
      data.add(convert);
    }
    return data;
  }

  ///浏览记录长度
  static int getBrowseHistoryLength() {
    return getBrowseHistory().length;
  }

  ///获取浏览历史记录
  static List<String> getBrowseHistory() {
    try {
      final List<String>? json = _prefs.getStringList(SPKey.browseHistory);
      if (json == null) {
        return [];
      } else {
        return json;
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
