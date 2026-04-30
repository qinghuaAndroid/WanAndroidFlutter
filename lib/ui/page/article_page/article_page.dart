import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'article_controller.dart';
import 'widget/article_list_item.dart';

export 'article_controller.dart';

class ArticlePage extends GetSaveView<ArticleController> {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: Column(
          children: [
            ToolBar(
              title: context.read<ArticleController>().arguments["title"],
            ),
            DividerStyle.divider1HalfPadding20,

            ///积分列表
            Expanded(
              child: RefreshWidget<ArticleController>(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: context
                      .watch<ArticleController>()
                      .projectData
                      .length,
                  itemBuilder: (BuildContext context, int index) {
                    return ArticleListItem(
                      detail: context
                          .read<ArticleController>()
                          .projectData[index],
                      onResult: (value) {
                        context
                                .read<ArticleController>()
                                .projectData[index]
                                .collect =
                            value;
                      },
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
