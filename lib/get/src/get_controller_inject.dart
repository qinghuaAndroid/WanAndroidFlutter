import 'package:flutter/material.dart';
import 'package:wan_android_flutter/http/src/request_repository.dart';

/// @class : BaseGetController
/// @date : 2021/08/26
/// @name : jhf
/// @description :基类 Controller
class BaseGetController extends ChangeNotifier {
  static const int loadingState = 0;
  static const int successState = 1;
  static const int emptyState = 2;
  static const int errorState = 3;

  BaseGetController({this.arguments}) {
    request = RequestRepository();
    _initialize();
  }

  Object? arguments;

  ///HTTP请求仓库
  late RequestRepository request;

  ///加载状态  0加载中 1加载成功 2加载数据为空 3加载失败
  int loadState = loadingState;

  bool _initialized = false;

  void _initialize() {
    if (_initialized) {
      return;
    }
    _initialized = true;
    onInit();
  }

  @mustCallSuper
  void onInit() {}

  void update([List<Object>? ids]) {
    notifyListeners();
  }

  ///加载成功，是否显示空页面
  void showSuccess(dynamic data) {
    loadState = data is! List || data.isNotEmpty ? successState : emptyState;
    notifyListeners();
  }

  ///加载失败,显示失败页面
  void showError() {
    loadState = errorState;
    notifyListeners();
  }

  ///重新加载
  void showLoading() {
    loadState = loadingState;
    notifyListeners();
  }
}
