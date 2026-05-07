import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/model/models.dart' hide ProjectPage;
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/service/service.dart';
import 'package:wan_android_flutter/ui/dialog/dialog.dart';
import 'package:wan_android_flutter/ui/page/home_page/home_page.dart';
import 'package:wan_android_flutter/ui/page/navigation_page/navigation_page.dart';
import 'package:wan_android_flutter/ui/page/system_page/system_page.dart';
import 'package:wan_android_flutter/ui/page/tabs_page/tabs_page.dart';
import 'package:wan_android_flutter/utils/utils.dart';

import 'main_controller.dart';
import 'widget/bottom_navigation_bar.dart';
import 'widget/drawer_widget.dart';

/// @class : MainPage
/// @date : 2021/08/19
/// @name : jhf
/// @description :主页 View层
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainTabOptionsState();
}

class MainTabOptionsState extends State<MainPage>
    with
        AutomaticKeepAliveClientMixin,
        SingleTickerProviderStateMixin,
        WidgetsBindingObserver {
  ///控制器
  late TabController? tabController;
  late MainController mainController;
  late ThemeColorService themeColorService;

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
    mainController = Get.find<MainController>();
    themeColorService = Get.find<ThemeColorService>();
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
    return Obx(() {
      return Scaffold(
        backgroundColor: ColorStyle.color_F8F9FC,
        appBar: AppBar(
          backgroundColor: themeColorService.color.value,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            _title(mainController.currentIndex.value),
            style: TextStyle(color: Colors.white, fontSize: 18.sp),
          ),
          actionsPadding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
          actions: [
            GestureDetector(
              onTap: () => Navigate.push(Routes.searchPage),
              child: Icon(Icons.search),
            ),
          ],
        ),
        drawer: DrawerWidget(controller: mainController),
        body: TabBarView(
          controller: tabController,
          children: const [
            HomePage(),
            SystemPage(),
            TabsPage(tagType: TagType.publicAccount),
            NavigationPage(),
            TabsPage(tagType: TagType.project),
          ],
        ),
        bottomNavigationBar: DecoratedBox(
          decoration: ShadowStyle.white12TopSpread4Blur10(radius: 0),
          child: MBottomNavigationBar(
            currentIndex: mainController.currentIndex.value,
            onTap: (index) {
              mainController.currentIndex.value = index;
              tabController?.animateTo(index);
            },
          ),
        ),
      );
    });
  }

  String _title(int index) {
    return switch (index) {
      0 => StringStyles.tab1.tr,
      1 => StringStyles.tab2.tr,
      2 => StringStyles.tab3.tr,
      3 => StringStyles.tab4.tr,
      4 => StringStyles.tab5.tr,
      _ => throw UnimplementedError(),
    };
  }

  @override
  bool get wantKeepAlive => true;
}
