import 'package:flutter/material.dart';
import 'package:wan_android_flutter/app/package_info.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'about_controller.dart';

export 'about_controller.dart';

/// @class : AboutPage
/// @date : 2021/08/25
/// @name : jhf
/// @description :关于我们 View层
class AboutPage extends GetCommonView<AboutController> {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: Column(
          children: [
            ToolBar(title: S.of(context).aboutTitle),
            Box.vBox30,
            Image.asset(assetImage('logo_green'), width: 120),
            Box.vBox12,
            Text(S.of(context).appName, style: Styles.style_black_30),
            Box.vBox5,
            Text(
              '${S.of(context).aboutVersion}${PackageInfo.versionName}',
              style: Styles.style_black_12,
            ),
            Box.vBox5,
            Text(
              '${S.of(context).aboutBuild}${PackageInfo.versionCode}',
              style: Styles.style_black_12,
            ),
            Box.vBox30,

            ListTile(
              title: Text(S.of(context).aboutGithub),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => WebUtil.toWebPageOther(
                context,
                title: S.of(context).aboutGithub,
                link: Constant.githubLike,
              ),
            ),
            DividerStyle.divider1HalfPadding20,

            ListTile(
              title: Text(S.of(context).aboutSupport),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => WebUtil.toWebPageOther(
                context,
                title: S.of(context).aboutSupport,
                link: Constant.wanAndroidLike,
              ),
            ),
            DividerStyle.divider1HalfPadding20,

            const Expanded(child: Text('')),
          ],
        ),
      ),
    );
  }
}
