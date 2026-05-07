import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/model/models.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/routes/routes.dart';
import 'package:wan_android_flutter/service/service.dart';
import 'package:wan_android_flutter/ui/page/main_page/main_controller.dart';
import 'package:wan_android_flutter/utils/utils.dart' hide ScreenUtil;

class DrawerWidget extends StatelessWidget {
  final MainController controller;

  const DrawerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerTheme: const DividerThemeData(color: Colors.transparent),
            ),
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Get.find<ThemeColorService>().color.value,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80.w,
                    height: 80.w,
                    margin: EdgeInsetsDirectional.only(bottom: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40.w)),
                      border: Border.all(color: Colors.white, width: 2.w),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        assetImage('ic_default_avatar'),
                        width: 80.w,
                        height: 80.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    controller.userInfo.nickname,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          XListTile(
            leading: assetImage('ic_score'),
            title: StringStyles.navMyScore.tr,
            onTap: () {
              Navigate.push(Routes.pointsPage);
            },
          ),
          XListTile(
            leading: assetImage('ic_collect'),
            title: StringStyles.navMyCollect.tr,
            onTap: () {
              Navigate.push(Routes.collectPage);
            },
          ),
          XListTile(
            leading: assetImage('ic_question'),
            title: StringStyles.navQuestion.tr,
            onTap: () {
              Navigate.push(
                Routes.articlePage,
                arguments: {
                  "articleType": ArticleType.question,
                  "title": StringStyles.navQuestion.tr,
                },
              );
            },
          ),
          XListTile(
            leading: assetImage('ic_square'),
            title: StringStyles.navSquare.tr,
            onTap: () {
              Navigate.push(
                Routes.articlePage,
                arguments: {
                  "articleType": ArticleType.square,
                  "title": StringStyles.navSquare.tr,
                },
              );
            },
          ),
          XListTile(
            leading: assetImage('ic_setting'),
            title: StringStyles.navSetting.tr,
            onTap: () {
              Navigate.push(Routes.settingPage);
            },
          ),
          XListTile(
            leading: assetImage('ic_about'),
            title: StringStyles.navAboutUs.tr,
            onTap: () {
              Navigate.push(Routes.aboutPage);
            },
          ),
        ],
      ),
    );
  }
}

class XListTile extends StatelessWidget {
  final String leading;
  final String title;
  final GestureTapCallback? onTap;

  const XListTile({
    super.key,
    required this.leading,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        leading,
        color: Colors.black,
        width: 24.w,
        height: 24.w,
      ),
      title: Text(title),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
      ),
      onTap: onTap,
    );
  }
}
