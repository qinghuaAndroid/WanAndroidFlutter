import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/utils/utils.dart';

/// @class : WebUtil
/// @date : 2021/9/14
/// @name : jhf
/// @description :Web工具类
class WebUtil {
  ///普通页面进入Web页面1
  static Future<void> toWebPage(
    BuildContext context,
    ProjectDetail detail, {
    Function(bool)? onResult,
  }) async {
    if (kIsWeb) {
      final Uri uri = Uri.parse(detail.link);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } else {
        if (kDebugMode) {
          print('无法打开链接: ${detail.link}');
        }
      }
    } else {
      Navigate.push(
        context,
        Routes.webViewPage,
        arguments: WebEntity(
          title: detail.title,
          link: detail.link,
          id: detail.id,
          isCollect: detail.collect,
        ),
      )?.then((value) async {
        if (value is bool && onResult != null) {
          onResult(value);
        }
      });
    }

    ///存储浏览记录
    SpUtil.saveBrowseHistory(detail);
  }

  ///收藏页面进入Web页面2
  static Future<dynamic>? toWebPageCollect(
    BuildContext context,
    CollectDetail detail,
  ) async {
    if (kIsWeb) {
      final Uri uri = Uri.parse(detail.link);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } else {
        if (kDebugMode) {
          print('无法打开链接: ${detail.link}');
        }
      }
    } else {
      return Navigate.push(
        context,
        Routes.webViewPage,
        arguments: WebEntity(
          title: detail.title,
          link: detail.link,
          id: detail.id,
          originId: detail.originId,
          isCollect: true,
        ),
      );
    }
  }

  ///普通页面进入Web页面2
  static Future<void> toWebPageBanners(
    BuildContext context,
    Banners detail,
  ) async {
    if (kIsWeb) {
      final Uri uri = Uri.parse(detail.url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } else {
        if (kDebugMode) {
          print('无法打开链接: ${detail.url}');
        }
      }
    } else {
      Navigate.push(
        context,
        Routes.webViewPage,
        arguments: WebEntity(
          title: detail.title,
          link: detail.url,
          id: 0,
          isCollect: false,
        ),
      );
    }
  }

  ///其他页面进入Web页面2
  static Future<void> toWebPageOther(
    BuildContext context, {
    String title = '',
    String link = '',
  }) async {
    if (kIsWeb) {
      final Uri uri = Uri.parse(link);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } else {
        if (kDebugMode) {
          print('无法打开链接: $link');
        }
      }
    } else {
      Navigate.push(
        context,
        Routes.webViewPage,
        arguments: WebEntity(title: title, link: link, id: 0, isCollect: false),
      );
    }
  }
}
