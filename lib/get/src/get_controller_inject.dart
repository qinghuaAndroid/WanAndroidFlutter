import 'package:get/get.dart';
import 'package:wan_android_flutter/http/src/request_repository.dart';

/// @class : BaseGetController
/// @date : 2021/08/26
/// @name : jhf
/// @description :基类 Controller
class BaseGetController extends GetxController {
  static const int loadingState = 0;
  static const int successState = 1;
  static const int emptyState = 2;
  static const int errorState = 3;

  ///HTTP请求仓库
  late RequestRepository request;

  ///加载状态  0加载中 1加载成功 2加载数据为空 3加载失败
  final RxInt loadState = loadingState.obs;

  ///加载成功，是否显示空页面
  void showSuccess(dynamic data) {
    loadState.value = data is! List || data.isNotEmpty
        ? successState
        : emptyState;
  }

  ///加载失败,显示失败页面
  void showError() {
    loadState.value = errorState;
  }

  ///重新加载
  void showLoading() {
    loadState.value = loadingState;
  }

  @override
  void onInit() {
    super.onInit();
    request = Get.find<RequestRepository>();
  }
}
