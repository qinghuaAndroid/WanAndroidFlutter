import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/app/global.dart';
import 'package:wan_android_flutter/utils/utils.dart';

import 'app/app_theme.dart';
import 'generated/l10n.dart';
import 'provider/src/local_provider.dart';
import 'provider/src/theme_colors_provider.dart';
import 'routes/navigation_history_observer.dart';
import 'routes/router_reporter.dart';
import 'routes/routes.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([
        // 强制竖屏
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      await SpUtil.init();
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
        child: Selector<LocaleNotifier, Locale>(
          builder: (context, value, child) {
            return MaterialApp(
              navigatorKey: Global.navigatorKey,
              navigatorObservers: [NavigationHistoryObserver(), routeObserver],

              // 使用 onGenerateRoute 代替 routes
              onGenerateRoute: Routes.onGenerateRoute,

              // onUnknownRoute 仍然作为兜底
              onUnknownRoute: Routes.unknownRoute,

              initialRoute: Routes.splashPage,
              debugShowCheckedModeBanner: false,
              theme: appThemeData,
              //国际化支持-来源配置
              supportedLocales: S.delegate.supportedLocales,
              localizationsDelegates: const [
                S.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              // 当前语言
              locale: value,
              builder: FlutterSmartDialog.init(),
            );
          },
          selector: (context, localeNotifier) {
            return localeNotifier.locale;
          },
        ),
      ),
    );
  }
}
