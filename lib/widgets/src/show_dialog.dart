import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/ui/dialog/dialog.dart';

///显示公共弹窗
void showCommonDialog({
  String title = '',
  String content = '',
  String backText = '',
  String nextText = '',
  bool backVisible = true,
  bool nextVisible = true,
  VoidCallback? backTap,
  VoidCallback? nextTap,
}) {
  SmartDialog.show(
    builder: (BuildContext context) {
      return CommonDialog(
        title: title,
        content: content,
        backText: backText.isEmpty ? S.of(context).quit : backText,
        nextText: nextText.isEmpty ? S.of(context).enter : nextText,
        backVisible: backVisible,
        nextVisible: nextVisible,
        backTap: backTap,
        nextTap: nextTap,
      );
    },
  );
}
