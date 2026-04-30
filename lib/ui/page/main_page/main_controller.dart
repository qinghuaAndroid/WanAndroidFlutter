import 'package:provider/provider.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/utils/utils.dart';

class MainController extends BaseGetController {
  int currentIndex = 0;

  ///用户信息
  late UserEntity userInfo;

  @override
  void onInit() {
    super.onInit();
    var info = SpUtil.getUserInfo();
    if (info != null) {
      userInfo = info;
      update();
    }
  }

  void onTabChange(int index) {
    currentIndex = index;
    update();
  }
}
