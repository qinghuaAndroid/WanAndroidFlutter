import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wan_android_flutter/app/global.dart';

/// @class : Navigate
/// @date : 2021/08/25
/// @name : jhf
/// @description : 导航
class Navigate {
  /// 获取全局context
  static BuildContext? get currentContext => Global.context;

  static Future<T?>? push<T extends Object?>(
    BuildContext context,
    String name, {
    dynamic arguments,
  }) {
    return Navigator.pushNamed<T>(context, name, arguments: arguments);
  }

  /// 关闭当前页并跳转新页面
  static Future<T?>? popAndPush<T extends Object?>(
    BuildContext context,
    String name, {
    dynamic arguments,
  }) {
    return Navigator.popAndPushNamed<T, Object?>(
      context,
      name,
      arguments: arguments,
    );
  }

  /// 关闭目标路由页及其栈顶的所有页面
  static void popUntil(BuildContext context, String name) {
    Navigator.popUntil(context, ModalRoute.withName(name));
  }

  /// 清除路由栈并去新页面
  static void cleanRouteAndPush(BuildContext context, String name) {
    Navigator.pushNamedAndRemoveUntil(context, name, (route) => false);
  }

  /// 返回
  static void pop<T>(BuildContext context, {T? result}) {
    Navigator.pop<T>(context, result);
  }

  ///获取当前page
  static String getCurrentRoute(BuildContext context) {
    return ModalRoute.of(context)?.settings.name ?? '';
  }

  ///打开浏览器
  ///[url] 链接
  static Future<Null> launchInBrowser(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
