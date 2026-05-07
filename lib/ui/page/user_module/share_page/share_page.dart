import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/ui/page/user_module/history_page/widget/history_item_widget.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'share_controller.dart';

export 'share_controller.dart';

/// @class : SharePage
/// @date : 2021/9/14
/// @name : jhf
/// @description :分享页 View层
class SharePage extends GetCommonView<SearchController> {
  const SharePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: Column(
          children: [
            ToolBar(title: S.of(context).shareTitle),
            DividerStyle.divider1Half,

            ///分享列表
            Expanded(
              child: RefreshWidget<ShareController>(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: context.watch<ShareController>().shareList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return HistoryItemWidget(
                      detail: context.read<ShareController>().shareList[index],
                      onResult: (value) =>
                          context
                                  .read<ShareController>()
                                  .shareList[index]
                                  .collect =
                              value,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
