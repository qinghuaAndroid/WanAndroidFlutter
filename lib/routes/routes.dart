import 'package:flutter/material.dart' hide SearchController;
import 'package:wan_android_flutter/get/get.dart';
import 'package:wan_android_flutter/ui/ui.dart';
import 'package:wan_android_flutter/utils/utils.dart';

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

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // 模拟登录状态，实际开发中从本地存储或状态管理(Provider/Bloc)获取
    bool isLoggedIn = SpUtil.getUserInfo() != null;

    // 需要拦截的“黑名单”：这些页面必须登录才能看
    final protectedRoutes = [Routes.mainPage];

    // 如果访问的是受保护页面且未登录，强行指向登录页
    if (protectedRoutes.contains(settings.name) && !isLoggedIn) {
      return MaterialPageRoute(
        builder: (context) => ControllerProvider(
          create: (_) => LoginController(),
          child: const LoginPage(),
        ),
      );
    }

    // 正常匹配跳转
    switch (settings.name) {
      case Routes.splashPage:
        return MaterialPageRoute(
          builder: (context) => ControllerProvider(
            create: (_) => SplashController(),
            child: const SplashPage(),
          ),
        );
      case Routes.registerPage:
        return MaterialPageRoute(
          builder: (context) => ControllerProvider(
            create: (_) => RegisterController(),
            child: const RegisterPage(),
          ),
        );
      case Routes.webViewPage:
        return MaterialPageRoute(
          settings: settings, // 必须传递 settings 才能在下级 context 中获取 arguments
          builder: (context) => ControllerProvider(
            create: (args) => WebController(arguments: args),
            child: const WebViewPage(),
          ),
        );
      case Routes.mainPage:
        return MaterialPageRoute(
          builder: (context) => ControllerProvider(
            create: (_) => MainController(),
            child: const MainPage(),
          ),
        );
      case Routes.feedbackPage:
        return MaterialPageRoute(
          builder: (context) => ControllerProvider(
            create: (_) => FeedbackController(),
            child: const FeedbackPage(),
          ),
        );
      case Routes.loginPage:
        return MaterialPageRoute(
          builder: (context) => ControllerProvider(
            create: (_) => LoginController(),
            child: const LoginPage(),
          ),
        );
      case Routes.userInfoPage:
        return MaterialPageRoute(
          builder: (context) => ControllerProvider(
            create: (_) => UserInfoController(),
            child: const UserInfoPage(),
          ),
        );
      case Routes.aboutPage:
        return MaterialPageRoute(
          builder: (context) => ControllerProvider(
            create: (_) => AboutController(),
            child: const AboutPage(),
          ),
        );
      case Routes.pointsPage:
        return MaterialPageRoute(
          builder: (context) => ControllerProvider(
            create: (_) => PointsController(),
            child: const PointsPage(),
          ),
        );
      case Routes.settingPage:
        return MaterialPageRoute(
          builder: (context) => ControllerProvider(
            create: (_) => SettingController(),
            child: const SettingPage(),
          ),
        );
      case Routes.settingLanguagePage:
        return MaterialPageRoute(
          builder: (context) => const SettingLanguagePage(),
        );
      case Routes.settingThemeColors:
        return MaterialPageRoute(builder: (context) => const ColorPickerPage());
      case Routes.collectPage:
        return MaterialPageRoute(
          builder: (context) => ControllerProvider(
            create: (_) => CollectController(),
            child: const CollectPage(),
          ),
        );
      case Routes.searchPage:
        return MaterialPageRoute(
          builder: (context) => ControllerProvider(
            create: (_) => SearchController(),
            child: const SearchPage(),
          ),
        );
      case Routes.historyPage:
        return MaterialPageRoute(
          builder: (context) => ControllerProvider(
            create: (_) => HistoryController(),
            child: const HistoryPage(),
          ),
        );
      case Routes.sharePage:
        return MaterialPageRoute(
          builder: (context) => ControllerProvider(
            create: (_) => ShareController(),
            child: const SharePage(),
          ),
        );
      case Routes.articlePage:
        return MaterialPageRoute(
          settings: settings, // 必须传递 settings 才能在下级 context 中获取 arguments
          builder: (context) => ControllerProvider(
            create: (args) => ArticleController(arguments: args),
            child: const ArticlePage(),
          ),
        );
      default:
        return unknownRoute(settings);
    }
  }

  /// 未知页面的构建器
  static MaterialPageRoute unknownRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const UnknownPage());
  }
}
