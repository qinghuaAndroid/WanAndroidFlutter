import 'package:flutter/material.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/utils/utils.dart';

/// @class : WebUtil
/// @date : 2021/9/14
/// @name : jhf
/// @description :Web工具类
class WebUtil {
  ///普通页面进入Web页面1
  static void toWebPage(
    BuildContext context,
    ProjectDetail detail, {
    Function(bool)? onResult,
  }) {
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

    ///存储浏览记录
    SpUtil.saveBrowseHistory(detail);
  }

  ///收藏页面进入Web页面2
  static Future<dynamic>? toWebPageCollect(
    BuildContext context,
    CollectDetail detail,
  ) {
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

  ///普通页面进入Web页面2
  static void toWebPageBanners(BuildContext context, Banners detail) {
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

  ///其他页面进入Web页面2
  static void toWebPageOther(
    BuildContext context, {
    String title = '',
    String link = '',
  }) {
    Navigate.push(
      context,
      Routes.webViewPage,
      arguments: WebEntity(title: title, link: link, id: 0, isCollect: false),
    );
  }
}
