import 'package:flutter/material.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/http/http.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/utils.dart';

import 'dialog_base.dart';

/// @class : ShareArticleDialog
/// @date : 2021/9/13
/// @name : jhf
/// @description : 分享文章弹窗
class ShareArticleDialog extends StatelessWidget {
  ///分享的链接
  final String url;

  final TextEditingController controller = TextEditingController();

  ShareArticleDialog({super.key, this.url = 'https://www.baidu.com'});

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      horizontal: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Box.vBox20,
          Text(
            S.of(context).shareArticleTitle,
            style: Styles.style_black_16_bold500,
          ),
          Box.vBox20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(url, style: Styles.style_FFAE2E_16),
          ),
          Box.vBox20,
          Container(
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.left,
              autofocus: true,
              maxLines: 1,
              style: Styles.style_6A6969_14,
              controller: controller,
              inputFormatters: [
                ///输入长度和格式限制
                CustomizedLengthTextInputFormatter(50),
              ],

              ///样式
              decoration: InputDecoration(
                fillColor: Colors.white12,
                filled: true,
                hintText: S.of(context).shareArticleHint,
                hintStyle: Styles.style_B8C0D4_14,
                border: _getEditBorder(false),
                focusedBorder: _getEditBorder(true),
                disabledBorder: _getEditBorder(false),
                enabledBorder: _getEditBorder(false),
                contentPadding: const EdgeInsets.only(left: 10, right: 10),
              ),
            ),
          ),
          Box.vBox20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  shareArticle();
                  Navigate.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 12,
                  ),
                  decoration: DecorationStyle.customize(
                    ColorStyle.color_24CF5F,
                    20,
                  ),
                  child: Text(
                    S.of(context).shareArticleEnter,
                    style: Styles.style_white_14,
                  ),
                ),
              ),
              Box.hBox15,
              GestureDetector(
                onTap: () {
                  Navigate.launchInBrowser(url);
                  Navigate.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 12,
                  ),
                  decoration: DecorationStyle.customizeBorder(
                    color: ColorStyle.color_24CF5F,
                  ),
                  child: Text(
                    S.of(context).shareBrowser,
                    style: Styles.style_24CF5F_14,
                  ),
                ),
              ),
            ],
          ),
          Box.vBox30,
        ],
      ),
    );
  }

  ///分享文章
  void shareArticle() {
    ///分享的文章标题
    String title = controller.text;
    if (title.isEmpty) {
      ToastUtils.show(S.current.shareArticleEdit);
      return;
    }
    var request = RequestRepository();
    request.shareArticle(
      title,
      url,
      success: (data) {
        ToastUtils.show(S.current.shareArticleSuccess);
      },
    );
  }

  ///获取输入框的Border属性，可公用
  ///[isEdit]是否获取焦点
  OutlineInputBorder _getEditBorder(bool isEdit) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(
        color: isEdit ? ColorStyle.color_24CF5F : ColorStyle.colorShadow,
        width: 1,
      ),
    );
  }
}
