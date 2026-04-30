import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/provider/provider.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'register_controller.dart';

export 'register_controller.dart';

/// @class : RegisterPage
/// @date : 2021/08/17
/// @name : jhf
/// @description :注册 View层
class RegisterPage extends GetCommonView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(StringStyles.registerButton.tr),
        titleTextStyle: TextStyle(fontSize: 18.sp, color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            DividerStyle.divider1Half,
            SizedBox(height: 100),

            ///账户名输入框
            EditWidget(
              hintText: StringStyles.loginAccountNameHint.tr,
              onChanged: (text) => context.read<RegisterController>()
                ..account = text
                ..update(),
            ),

            ///密码输入框
            EditWidget(
              hintText: StringStyles.loginAccountPwdHint.tr,
              passwordType: true,
              onChanged: (text) => context.read<RegisterController>()
                ..password = text
                ..update(),
            ),

            ///再次输入密码输入框
            EditWidget(
              hintText: StringStyles.loginAccountRePwdHint.tr,
              passwordType: true,
              onChanged: (text) => context.read<RegisterController>()
                ..rePassword = text
                ..update(),
            ),

            ///注册按钮
            Container(
              width: double.infinity,
              height: 45.w,
              margin: EdgeInsets.only(top: 50.w, left: 50.w, right: 50.w),
              decoration: BoxDecoration(
                color: context.watch<RegisterController>().changeShowButton()
                    ? Provider.of<ThemeColorsNotifier>(context).color
                    : Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(4.w)),
              ),
              child: TextButton(
                style: context.watch<RegisterController>().changeShowButton()
                    ? ButtonStyles.getButtonStyle()
                    : ButtonStyles.getTransparentStyle(),
                onPressed: () {
                  KeyboardUtils.hideKeyboard(context);
                  context.read<RegisterController>().register();
                },
                child: Text(
                  StringStyles.registerButton.tr,
                  style: context.watch<RegisterController>().changeShowButton()
                      ? Styles.style_white_16
                      : Styles.style_white_16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
