import 'package:easy_refresh/easy_refresh.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

class RefreshExtension {
  ///刷新加载失败
  ///[controller] EasyRefreshController
  ///[refresh] 加载类型 第一次、上拉、下拉
  static void onError(EasyRefreshController controller, Refresh refresh) {
    if (refresh == Refresh.pull) {
      controller.finishRefresh(IndicatorResult.fail);
    } else if (refresh == Refresh.down) {
      controller.finishLoad(IndicatorResult.fail);
    }
  }

  ///刷新加载成功
  ///[controller] EasyRefreshController
  ///[refresh] 加载类型 第一次、上拉、下拉
  ///[over] 是否为最后一页
  static void onSuccess(EasyRefreshController controller,
      Refresh refresh,
      bool over,) {
    ///加载成功，重置刷新状态
    if (refresh == Refresh.pull) {
      controller.finishRefresh();
      controller.resetFooter();
    } else if (refresh == Refresh.down) {
      controller.finishLoad(IndicatorResult.success);
    }

    ///最后一页了，无更多数据
    if (over) {
      controller.finishLoad(IndicatorResult.noMore);
    } else {
      controller.finishLoad(IndicatorResult.success);
    }
    if (refresh == Refresh.pull) {
      ToastUtils.show(S.current.pointsNotifySuccess);
    }
  }
}
