import 'package:get/get.dart';
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
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: registerPage,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: webViewPage,
      page: () => const WebViewPage(),
      binding: WebViewBinding(),
    ),
    GetPage(
      name: mainPage,
      page: () => const MainPage(),
      binding: MainBinding(),
      middlewares: [AuthMiddleware()],
    ),

    GetPage(
      name: feedbackPage,
      page: () => const FeedbackPage(),
      binding: FeedbackBinding(),
    ),
    GetPage(
      name: loginPage,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: userInfoPage,
      page: () => const UserInfoPage(),
      binding: UserInfoBinding(),
    ),
    GetPage(
      name: aboutPage,
      page: () => const AboutPage(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: pointsPage,
      page: () => const PointsPage(),
      binding: PointsBinding(),
    ),
    GetPage(
      name: settingPage,
      page: () => const SettingPage(),
      binding: SettingBinding(),
    ),
    GetPage(name: settingLanguagePage, page: () => const SettingLanguagePage()),
    GetPage(name: settingThemeColors, page: () => const ColorPickerPage()),
    GetPage(
      name: collectPage,
      page: () => const CollectPage(),
      binding: CollectBinding(),
    ),
    GetPage(
      name: searchPage,
      page: () => const SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: historyPage,
      page: () => const HistoryPage(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: sharePage,
      page: () => const SharePage(),
      binding: ShareBinding(),
    ),
    GetPage(
      name: articlePage,
      page: () => const ArticlePage(),
      binding: ArticleBinding(),
    ),
  ];

  static final unknownPage = GetPage(
    name: Routes.unknown,
    page: () => const UnknownPage(),
  );
}
