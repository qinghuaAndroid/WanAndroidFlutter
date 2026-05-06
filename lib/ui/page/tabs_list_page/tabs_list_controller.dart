part of "tabs_list_page.dart";

class TabsListController extends BaseGetPageController {
  late TagType tagType;

  late String id;

  List<ProjectDetail> projectData = [];

  void initData(String id, TagType tagType) {
    this.id = id;
    this.tagType = tagType;
  }

  ///请求积分明细
  @override
  void requestData(
    RefreshController controller, {
    Refresh refresh = Refresh.first,
  }) {
    request.getWxArticle(
      id,
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
