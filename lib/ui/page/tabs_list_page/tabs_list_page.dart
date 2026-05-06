import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'widget/tabs_list_item.dart';

part 'tabs_list_controller.dart';

class TabsListPage extends GetSaveView<TabsListController> {
  final String id;
  final TagType tagType;

  @override
  get tag => id;

  const TabsListPage({super.key, required this.id, required this.tagType});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TabsListController()..initData(id, tagType),
      child: _TabsListPage(),
    );
  }
}

class _TabsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller2 = context.watch<TabsListController>();
    return RefreshWidget<TabsListController>(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: controller2.projectData.length,
        itemBuilder: (BuildContext context, int index) {
          var controller = context.read<TabsListController>();
          return TabsListItem(
            tagType: controller.tagType,
            detail: controller.projectData[index],
            onResult: (value) {
              controller.projectData[index].collect = value;
            },
          );
        },
      ),
    );
  }
}
