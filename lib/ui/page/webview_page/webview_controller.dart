import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// @class : WebViewController
/// @date : 2021/08/24
/// @name : jhf
/// @description : WebView 控制器层
class WebController extends BaseGetController {
  ///加载URL
  WebEntity get detail => arguments as WebEntity;

  ///进度条
  var progress = 0.0;

  ///是否点赞
  var isCollect = false;

  ///控制收藏的取消与结束
  var collectAtState = false;

  final webViewController = WebViewController();

  WebController({super.arguments});

  @override
  void onInit() {
    super.onInit();
    isCollect = detail.isCollect;
    update();
    webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            this.progress = progress.toDouble();
            update();
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(detail.link));
  }

  ///收藏&取消收藏
  ///注意此处，从收藏进入取消收藏的ID是originId
  void collectArticle() {
    if (!isCollect) {
      collectAtState = true;
      update();
      Future.delayed(const Duration(milliseconds: 900)).then((value) {
        collectAtState = false;
        update();
      });
    }

    request.collectArticle(
      isCollect && detail.originId != 0 ? detail.originId : detail.id,
      isCollect: isCollect,
      success: (data) {
        ToastUtils.show(
          isCollect ? S.current.collectQuit : S.current.collectSuccess,
        );
        isCollect = !isCollect;
        update();
      },
    );
  }
}
