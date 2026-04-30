import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/model/models.dart' hide ProjectPage;
import 'package:wan_android_flutter/provider/provider.dart';
import 'package:wan_android_flutter/ui/page/tabs_list_page/tabs_list_page.dart';

import 'tabs_controller.dart';

export 'tabs_controller.dart';

class TabsPage extends StatefulWidget {
  final TagType tagType;

  const TabsPage({super.key, required this.tagType});

  @override
  State<TabsPage> createState() => TabsPageState();
}

class TabsPageState extends State<TabsPage>
    with AutomaticKeepAliveClientMixin<TabsPage>, TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    var controller = context.read<TabsController>();
    controller.tagType = widget.tagType;
    controller.requestData();
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<TabsController>(
      builder: (context, controller, child) {
        tabController?.dispose();
        tabController = TabController(
          length: widget.tagType == TagType.publicAccount
              ? controller.wechatPublic.length
              : controller.projectTabs.length,
          vsync: this,
        );
        return SafeArea(
          top: true,
          child: Column(
            children: [
              Selector<ThemeColorsNotifier, Color>(
                builder: (BuildContext context, value, Widget? child) {
                  return DecoratedBox(
                    decoration: BoxDecoration(color: value),
                    child: TabBar(
                      tabs: _tabs(controller),
                      controller: tabController,
                      isScrollable: true,
                      indicatorColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white,
                      labelPadding: const EdgeInsets.all(0.0),
                      indicatorPadding: const EdgeInsets.all(0.0),
                      tabAlignment: TabAlignment.start,
                      dividerHeight: 0,
                    ),
                  );
                },
                selector: (context, themeColorsNotifier) {
                  return themeColorsNotifier.color;
                },
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: _createTabsPage(controller),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Tab> _tabs(TabsController controller) {
    return widget.tagType == TagType.publicAccount
        ? (controller.wechatPublic).map((model) {
            return Tab(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(model.name),
              ),
            );
          }).toList()
        : (controller.projectTabs).map((model) {
            return Tab(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(model.name),
              ),
            );
          }).toList();
  }

  List<Widget> _createTabsPage(TabsController controller) {
    return widget.tagType == TagType.publicAccount
        ? (controller.wechatPublic).map((model) {
            final controller = TabsListController();
            controller.tagType = widget.tagType;
            controller.id = model.id.toString();
            return TabsListPage(
              id: model.id.toString(),
              controller: controller,
            );
          }).toList()
        : (controller.projectTabs).map((model) {
            final controller = TabsListController();
            controller.tagType = widget.tagType;
            controller.id = model.id.toString();
            return TabsListPage(
              id: model.id.toString(),
              controller: controller,
            );
          }).toList();
  }

  @override
  bool get wantKeepAlive => true;
}
