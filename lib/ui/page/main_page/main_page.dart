import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/get/src/controller_provider.dart';
import 'package:wan_android_flutter/model/models.dart' hide ProjectPage;
import 'package:wan_android_flutter/provider/provider.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/ui/dialog/dialog.dart';
import 'package:wan_android_flutter/ui/page/home_page/home_page.dart';
import 'package:wan_android_flutter/ui/page/navigation_page/navigation_page.dart';
import 'package:wan_android_flutter/ui/page/system_page/system_page.dart';
import 'package:wan_android_flutter/ui/page/tabs_page/tabs_page.dart';
import 'package:wan_android_flutter/utils/utils.dart';

import 'main_controller.dart';
import 'widget/bottom_navigation_bar.dart';
import 'widget/drawer_widget.dart';

export 'main_controller.dart';

/// @class : MainPage
/// @date : 2021/08/19
/// @name : jhf
/// @description :主页 View层
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainTabOptionsState();
}

class _MainTabOptionsState extends State<MainPage>
    with
        AutomaticKeepAliveClientMixin,
        SingleTickerProviderStateMixin,
        WidgetsBindingObserver {
  ///控制器
  TabController? tabController;

  ///监听应用从后台切换到前台时，读取粘贴板中的数据，验证URL，已保存分享
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      var clipboardData = Clipboard.getData(Clipboard.kTextPlain);
      clipboardData.then((value) {
        debugPrint("clipboardData=> ${value?.text}");
        if (value != null &&
            value.text != null &&
            value.text!.isNotEmpty &&
            (value.text!.startsWith("https://") ||
                value.text!.startsWith("http://"))) {
          SmartDialog.show(
            builder: (BuildContext context) {
              return ShareArticleDialog(url: value.text!);
            },
          );
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<MainController>();
    tabController?.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: ColorStyle.color_F8F9FC,
      appBar: AppBar(
        backgroundColor: Provider.of<ThemeColorsNotifier>(context).color,
        iconTheme: IconThemeData(color: Colors.white),
        title: Consumer<MainController>(
          builder: (context, controller, child) {
            return Text(
              _title(controller.currentIndex),
              style: TextStyle(color: Colors.white, fontSize: 18.sp),
            );
          },
        ),
        actionsPadding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
        actions: [
          GestureDetector(
            onTap: () => Navigate.push(Routes.searchPage),
            child: Icon(Icons.search),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body: TabBarView(
        controller: tabController,
        children: [
          ControllerProvider(
            create: () => HomeController(),
            child: const HomePage(),
          ),
          ControllerProvider(
            create: () => SystemController(),
            child: const SystemPage(),
          ),
          ControllerProvider(
            create: () => TabsController(),
            child: const TabsPage(tagType: TagType.publicAccount),
          ),
          ControllerProvider(
            create: () => NavigationController(),
            child: const NavigationPage(),
          ),
          ControllerProvider(
            create: () => TabsController(),
            child: const TabsPage(tagType: TagType.project),
          ),
        ],
      ),
      bottomNavigationBar: DecoratedBox(
        decoration: ShadowStyle.white12TopSpread4Blur10(radius: 0),
        child: Selector<MainController, int>(
          builder: (BuildContext context, value, Widget? child) {
            return MBottomNavigationBar(
              currentIndex: value,
              onTap: (index) {
                context.read<MainController>().onTabChange(index);
                tabController?.animateTo(index);
              },
            );
          },
          selector: (BuildContext context, MainController controller) {
            return controller.currentIndex;
          },
        ),
      ),
    );
  }

  String _title(int index) {
    return switch (index) {
      0 => S.of(context).tab_1,
      1 => S.of(context).tab_2,
      2 => S.of(context).tab_3,
      3 => S.of(context).tab_4,
      4 => S.of(context).tab_5,
      _ => throw UnimplementedError(),
    };
  }

  @override
  bool get wantKeepAlive => true;
}
