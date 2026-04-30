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
    final tabsController = context.read<TabsController>();
    tabsController.tagType = widget.tagType;
    tabsController.requestData();
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Selector<TabsController, int>(
      builder: (context, value, child) {
        final controller = context.read<TabsController>();
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
      selector: (context, controller) {
        return controller.tagType == TagType.publicAccount
            ? controller.wechatPublic.length
            : controller.projectTabs.length;
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
            final listController = TabsListController();
            listController.tagType = widget.tagType;
            listController.id = model.id.toString();
            return TabsListPage(
              id: model.id.toString(),
              controller: listController,
            );
          }).toList()
        : (controller.projectTabs).map((model) {
            final listController = TabsListController();
            listController.tagType = widget.tagType;
            listController.id = model.id.toString();
            return TabsListPage(
              id: model.id.toString(),
              controller: listController,
            );
          }).toList();
  }

  @override
  bool get wantKeepAlive => true;
}
