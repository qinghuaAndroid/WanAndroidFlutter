import 'package:easy_refresh/easy_refresh.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

/// @class : ProjectController
/// @date : 2021/08/23
/// @name : jhf
/// @description :项目 控制器层
class ArticleController extends BaseGetPageController {
  List<ProjectDetail> projectData = [];

  @override
  int get initialPage => args['articleType'] == ArticleType.question ? 1 : 0;

  Map<String, dynamic> get args => (arguments as Map<String, dynamic>?) ?? {};

  ArticleController({super.arguments});

  ///请求积分明细
  @override
  void requestData(
    EasyRefreshController controller, {
    Refresh refresh = Refresh.first,
  }) {
    switch (args['articleType'] as ArticleType?) {
      case ArticleType.system:
        requestSystemArticles(controller, refresh);
        break;
      case ArticleType.question:
        requestAskModule(controller, refresh);
        break;
      case ArticleType.square:
        requestSquareModule(controller, refresh);
        break;
      case null:
        break;
    }
  }

  void requestSystemArticles(
    EasyRefreshController controller,
    Refresh refresh,
  ) {
    request.requestSystemArticles(
      args["cid"].toString(),
      page,
      success: (data, over) {
        RefreshExtension.onSuccess(controller, refresh, over);

        ///下拉刷新需要清除列表
        if (refresh != Refresh.down) {
          projectData.clear();
        }
        projectData.addAll(data);
        showSuccess(projectData);
      },
      fail: (code, msg) {
        showError();
        RefreshExtension.onError(controller, refresh);
      },
    );
  }

  void requestAskModule(EasyRefreshController controller, Refresh refresh) {
    request.requestAskModule(
      page,
      success: (data, over) {
        RefreshExtension.onSuccess(controller, refresh, over);

        ///下拉刷新需要清除列表
        if (refresh != Refresh.down) {
          projectData.clear();
        }
        projectData.addAll(data);
        showSuccess(projectData);
      },
      fail: (code, msg) {
        showError();
        RefreshExtension.onError(controller, refresh);
      },
    );
  }

  void requestSquareModule(EasyRefreshController controller, Refresh refresh) {
    request.requestSquareModule(
      page,
      success: (data, over) {
        RefreshExtension.onSuccess(controller, refresh, over);

        ///下拉刷新需要清除列表
        if (refresh != Refresh.down) {
          projectData.clear();
        }
        projectData.addAll(data);
        showSuccess(projectData);
      },
      fail: (code, msg) {
        showError();
        RefreshExtension.onError(controller, refresh);
      },
    );
  }
}
