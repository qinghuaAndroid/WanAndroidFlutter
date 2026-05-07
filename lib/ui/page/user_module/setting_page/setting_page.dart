import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/routes/router_reporter.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/utils/utils.dart';
import 'package:wan_android_flutter/widgets/widgets.dart';

import 'setting_controller.dart';

export 'setting_controller.dart';

class SettingPage extends StatefulWidget {
  final String? tag;

  const SettingPage({super.key, this.tag});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>
    with RouteAware, WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    debugPrint('---------->didChangeAppLifecycleState: $state');
  }

  @override
  void didPush() {
    super.didPush();
    debugPrint('---------->didPush');
  }

  @override
  void didPushNext() {
    super.didPushNext();
    debugPrint('---------->didPushNext');
  }

  @override
  void didPop() {
    super.didPop();
    debugPrint('---------->didPop');
  }

  @override
  void didPopNext() {
    super.didPopNext();
    debugPrint('---------->didPopNext');
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ToolBar(title: S.of(context).settingTitle),
          DividerStyle.divider1Half,
          ListTile(
            onTap: () => Navigate.push(context, Routes.settingLanguagePage),
            title: Text(S.of(context).settingLanguage),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),

          ListTile(
            onTap: () => context.read<SettingController>().clearCacheFile(),
            title: Text(S.of(context).settingCache),
            trailing: Consumer<SettingController>(
              builder: (context, controller, child) {
                return Text(controller.cache, style: Styles.style_6A6969_14);
              },
            ),
          ),

          ListTile(
            onTap: () => Navigate.push(context, Routes.settingThemeColors),
            title: Text(S.of(context).settingThemeColors),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),

          DividerStyle.divider20Half,

          ListTile(
            onTap: () {
              context.read<SettingController>().exitLoginState(context);
            },
            title: Container(
              alignment: Alignment.center,
              child: Text(S.of(context).settingExitLogin),
            ),
          ),
        ],
      ),
    );
  }
}
