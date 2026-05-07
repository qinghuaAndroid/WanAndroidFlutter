import 'package:flutter/material.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/utils/utils.dart';

/// @class : SplashController
/// @date : 2021/08/15
/// @name : jhf
/// @description :启动页 控制器层
class LoginController extends BaseGetController {
  ///账号
  String account = "";

  ///密码
  String password = "";

  ///当前按钮是否可点击
  bool changeShowButton() {
    return account.isNotEmpty && password.isNotEmpty;
  }

  ///用户登录
  void login(BuildContext context) {
    if (account.isEmpty || password.isEmpty) {
      return;
    }

    ///账户名：>6位
    if (account.isEmpty || account.length < 6) {
      ToastUtils.show(
        account.isEmpty
            ? S.current.registerAccountEmpty
            : S.current.registerAccountLength,
      );
      return;
    }

    ///密码：>6位
    if (password.isEmpty || password.length < 6) {
      ToastUtils.show(
        password.isEmpty
            ? S.current.registerPasswordEmpty
            : S.current.registerPasswordLength,
      );
      return;
    }

    request.login(
      account,
      password,
      success: (data) {
        ToastUtils.show(S.current.loginSuccess);
        if (context.mounted) {
          Navigate.popAndPush(context, Routes.mainPage);
        }
      },
    );
  }
}
