import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/ui/dialog/dialog.dart';
import 'package:wan_android_flutter/utils/utils.dart';

class FeedbackController extends BaseGetController {
  ///存储本地选择的图片
  List<File> photoEntity = [];

  ///问题
  String issue = '';

  ///联系方式
  String contact = '';

  /// 打开相册
  /// [index] 索引
  Future<void> openGallery(int index) async {
    if (photoEntity.length >= 4) {
      ToastUtils.show(S.current.feedbackToast);
      return;
    }
    if (index == photoEntity.length) {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        photoEntity.add(File(image.path));
      }
      update();
    }
  }

  ///由于没有反馈接口，因此延时2秒进行操作
  void requestFeedback(BuildContext context) {
    debugPrint("feedback >> issue == $issue");
    debugPrint("feedback >> contact == $contact");
    debugPrint("feedback >> photo == $photoEntity");
    if (issue.isEmpty) {
      ToastUtils.show(S.current.feedbackContent);
      return;
    }
    KeyboardUtils.hideKeyboard(context);
    BaseLoadingDialog.show();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      BaseLoadingDialog.hide();
      ToastUtils.show(S.current.feedbackSuccess);
      if (context.mounted) {
        Navigate.pop(context);
      }
    });
  }
}
