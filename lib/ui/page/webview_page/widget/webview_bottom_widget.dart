import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/ui/page/webview_page/webview_controller.dart';
import 'package:wan_android_flutter/utils/utils.dart';

/// @class : WebViewBottomWidget
/// @date : 2021/08/25
/// @name : jhf
/// @description :WebView 底部菜单
class WebViewBottomWidget extends GetCommonView<WebController> {
  const WebViewBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: ShadowStyle.white12Circle(radius: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Box.hBox20,
          Expanded(
            child: GestureDetector(
              onTap: () => ToastUtils.show(S.of(context).webNotComment),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: ColorStyle.colorShadow,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Text(
                  S.of(context).webEditHint,
                  style: Styles.style_B8C0D4_14,
                ),
              ),
            ),
          ),
          Box.hBox20,
          InkWell(
            onTap: () => context.read<WebController>().collectArticle(),
            child: Consumer(
              builder: (context, WebController controller, child) {
                return SvgPicture.asset(
                  controller.isCollect
                      ? R.assetsImagesCollect
                      : R.assetsImagesCollectQuit,
                  width: 24,
                );
              },
            ),
          ),
          Box.hBox20,
          InkWell(
            onTap: () => ToastUtils.show(S.of(context).notSupportLikes),
            child: const Icon(
              Icons.thumb_up_alt_outlined,
              color: ColorStyle.color_24CF5F,
              size: 24,
            ),
          ),
          Box.hBox20,
          InkWell(
            onTap: () => Navigate.launchInBrowser(
              context.read<WebController>().detail.link,
            ),
            child: const Icon(Icons.public, color: Colors.blue, size: 24),
          ),
          Box.hBox20,
        ],
      ),
    );
  }
}
