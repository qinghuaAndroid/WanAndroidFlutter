import 'package:easy_refresh/easy_refresh.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

/// @class : ShareController
/// @date : 2021/9/14
/// @name : jhf
/// @description :分享页 控制器层
class ShareController extends BaseGetPageController {
  ///排行榜源数据
  List<ProjectDetail> shareList = [];

  ///请求积分明细
  @override
  void requestData(
    EasyRefreshController controller, {
    Refresh refresh = Refresh.first,
  }) {
    request.requestShareArticleList(
      page,
      success: (data, over) {
        RefreshExtension.onSuccess(controller, refresh, over);

        ///下拉刷新需要清除列表
        if (refresh != Refresh.down) {
          shareList.clear();
        }
        shareList.addAll(data);
        showSuccess(shareList);
      },
      fail: (code, msg) {
        showError();
        RefreshExtension.onError(controller, refresh);
      },
    );
  }
}
