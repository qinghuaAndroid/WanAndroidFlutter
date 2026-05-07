import 'package:flutter/material.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/utils/utils.dart';

/// @class : SettingController
/// @date : 2021/08/25
/// @name : jhf
/// @description :设置 控制器层
class SettingController extends BaseGetController {
  ///缓存大小
  var cache = '';

  @override
  void onInit() {
    super.onInit();
    loadCache();
  }

  ///加载缓存
  void loadCache() {
    CacheUtil.loadCache().then((value) {
      cache = CacheUtil.byte2FitMemorySize(value);
      update();
    });
  }

  ///清除缓存
  void clearCacheFile() {
    CacheUtil.clearCache().then((value) {
      loadCache();
      ToastUtils.show(
        value ? S.current.settingCacheSuccess : S.current.settingCacheFail,
      );
    });
  }

  ///退出登录
  void exitLoginState(BuildContext context) {
    SpUtil.deleteUserInfo();
    request.exitLogin();
    Navigate.cleanRouteAndPush(context, Routes.loginPage);
  }
}
