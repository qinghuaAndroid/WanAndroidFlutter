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
  final TabsListController controller;

  @override
  get tag => id;

  const TabsListPage({super.key, required this.id, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: controller,
      child: _TabsListPage(),
    );
  }
}

class _TabsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshWidget<TabsListController>(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: context
            .watch<TabsListController>()
            .projectData
            .length,
        itemBuilder: (BuildContext context, int index) {
          return TabsListItem(
            tagType: context
                .read<TabsListController>()
                .tagType,
            detail: context
                .read<TabsListController>()
                .projectData[index],
            onResult: (value) {
              context
                  .read<TabsListController>()
                  .projectData[index].collect =
                  value;
            },
          );
        },
      ),
    );
  }
}