import 'package:get/get.dart';
import 'package:wan_android_flutter/get/src/controller_provider.dart';
import 'package:wan_android_flutter/get/src/get_auth_middleware.dart';
import 'package:wan_android_flutter/ui/ui.dart';

/// @class : Routes
/// @name : jhf
/// @description :页面管理
abstract class Routes {
  ///入口模块
  static const String splashPage = '/splash';

  ///登录模块
  static const String loginPage = '/login';

  ///注册
  static const String registerPage = '/register';

  ///主页
  static const String mainPage = '/main';

  ///webView
  static const String webViewPage = '/webView';

  ///入口模块
  static const String feedbackPage = '/feedback';

  ///用户信息模块
  static const String userInfoPage = '/userInfo';

  ///关于我们
  static const String aboutPage = '/about';

  ///积分明细
  static const String pointsPage = '/points';

  ///设置
  static const String settingPage = '/setting';

  ///语言
  static const String settingLanguagePage = '/language';

  ///主题颜色
  static const String settingThemeColors = '/themeColors';

  ///我的收藏
  static const String collectPage = '/collect';

  ///搜索页面
  static const String searchPage = '/search';

  ///浏览记录
  static const String historyPage = '/history';

  ///分享页面
  static const String sharePage = '/share';

  ///文章页面
  static const String articlePage = '/article';

  ///未知页面
  static const unknown = "/unknown";

  ///页面合集
  static final routePage = [
    GetPage(
      name: splashPage,
      page: () => ControllerProvider(
        create: () => SplashController(),
        child: const SplashPage(),
      ),
    ),
    GetPage(
      name: registerPage,
      page: () => ControllerProvider(
        create: () => RegisterController(),
        child: const RegisterPage(),
      ),
    ),
    GetPage(
      name: webViewPage,
      page: () => ControllerProvider(
        create: () => WebController(),
        child: const WebViewPage(),
      ),
    ),
    GetPage(
      name: mainPage,
      page: () => ControllerProvider(
        create: () => MainController(),
        child: const MainPage(),
      ),
      middlewares: [AuthMiddleware()],
    ),

    GetPage(
      name: feedbackPage,
      page: () => ControllerProvider(
        create: () => FeedbackController(),
        child: const FeedbackPage(),
      ),
    ),
    GetPage(
      name: loginPage,
      page: () => ControllerProvider(
        create: () => LoginController(),
        child: const LoginPage(),
      ),
    ),
    GetPage(
      name: userInfoPage,
      page: () => ControllerProvider(
        create: () => UserInfoController(),
        child: const UserInfoPage(),
      ),
    ),
    GetPage(
      name: aboutPage,
      page: () => ControllerProvider(
        create: () => AboutController(),
        child: const AboutPage(),
      ),
    ),
    GetPage(
      name: pointsPage,
      page: () => ControllerProvider(
        create: () => PointsController(),
        child: const PointsPage(),
      ),
    ),
    GetPage(
      name: settingPage,
      page: () => ControllerProvider(
        create: () => SettingController(),
        child: const SettingPage(),
      ),
    ),
    GetPage(
      name: settingLanguagePage,
      page: () {
        return const SettingLanguagePage();
      },
    ),
    GetPage(
      name: settingThemeColors,
      page: () {
        return const ColorPickerPage();
      },
    ),
    GetPage(
      name: collectPage,
      page: () => ControllerProvider(
        create: () => CollectController(),
        child: const CollectPage(),
      ),
    ),
    GetPage(
      name: searchPage,
      page: () => ControllerProvider(
        create: () => SearchController(),
        child: const SearchPage(),
      ),
    ),
    GetPage(
      name: historyPage,
      page: () => ControllerProvider(
        create: () => HistoryController(),
        child: const HistoryPage(),
      ),
    ),
    GetPage(
      name: sharePage,
      page: () => ControllerProvider(
        create: () => ShareController(),
        child: const SharePage(),
      ),
    ),
    GetPage(
      name: articlePage,
      page: () => ControllerProvider(
        create: () => ArticleController(),
        child: const ArticlePage(),
      ),
    ),
  ];

  static final unknownPage = GetPage(
    name: Routes.unknown,
    page: () => const UnknownPage(),
  );
}
