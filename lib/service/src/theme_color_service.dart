import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/utils/src/save/sp_util.dart';

class ThemeColorService extends GetxService {
  ///主题颜色
  final Rx<Color> _color = Colors.transparent.obs;

  Rx<Color> get color => _color;

  ThemeColorService._();

  static final ThemeColorService _singleTon = ThemeColorService._();

  factory ThemeColorService() => _singleTon;

  @override
  void onInit() {
    super.onInit();
    _color.value = SpUtil.getThemeColor() ?? Colors.lightBlueAccent;
  }

  void setColor(Color color) {
    _color.value = color;
    SpUtil.updateThemeColor(color);
  }
}
