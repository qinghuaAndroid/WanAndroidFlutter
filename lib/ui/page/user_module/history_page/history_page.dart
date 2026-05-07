import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'history_controller.dart';
import 'widget/history_item_widget.dart';

export 'history_controller.dart';

/// @class : HistoryPage
/// @date : 2021/9/9
/// @name : jhf
/// @description :历史记录 View层
class HistoryPage extends GetCommonView<HistoryController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: Column(
          children: [
            ToolBar(title: S.of(context).historyTitle),
            DividerStyle.divider1HalfPadding20,

            ///浏览历史
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: context
                    .watch<HistoryController>()
                    .historyList
                    .length,
                itemBuilder: (BuildContext context, int index) {
                  return HistoryItemWidget(
                    detail: context
                        .read<HistoryController>()
                        .historyList[index],
                    onResult: (value) =>
                        context
                                .read<HistoryController>()
                                .historyList[index]
                                .collect =
                            value,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
