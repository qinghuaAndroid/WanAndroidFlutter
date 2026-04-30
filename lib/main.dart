import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/get/src/controller_provider.dart';

import 'app/app_theme.dart';
import 'generated/l10n.dart';
import 'provider/src/local_provider.dart';
import 'provider/src/theme_colors_provider.dart';
import 'res/src/strings.dart';
import 'routes/navigation_history_observer.dart';
import 'routes/router_reporter.dart';
import 'routes/routes.dart';
import 'ui/page/splash_page/splash_page.dart';
import 'utils/src/injection_init.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([
        // 强制竖屏
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      await Injection.init();

      FlutterError.onError = (FlutterErrorDetails details) {
        // 异常上报 转发容易遗漏异常消息
        debugPrint("FlutterError-${details.exception}");
      };

      runApp(
        MultiProvider(
          providers: [LocaleProvider(), ThemeColorsProvider()],
          child: MyApp(),
        ),
      );
    },
    (Object exception, StackTrace stack) async {
      // 异常上报
      debugPrint("runZonedGuarded-$exception");
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //填入设计稿中设备的屏幕尺寸,单位dp
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(textScaler: TextScaler.noScaling, boldText: false),
        child: GetMaterialApp(
          navigatorObservers: [NavigationHistoryObserver(), routeObserver],
          getPages: Routes.routePage,
          debugShowCheckedModeBanner: false,
          popGesture: Get.isPopGestureEnable,
          initialRoute: Routes.splashPage,
          unknownRoute: Routes.unknownPage,
          theme: appThemeData,
          //主题颜色
          translations: Messages(),
          //国际化支持-来源配置
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          // 当前语言
          locale: Provider.of<LocaleNotifier>(context).locale,
          //国际化支持-默认语言
          fallbackLocale: const Locale('zh', 'CN'),
          //国际化支持-备用语言
          defaultTransition: Transition.native,
          builder: FlutterSmartDialog.init(),
        ),
      ),
    );
  }
}
