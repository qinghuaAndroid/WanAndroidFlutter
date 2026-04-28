import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/generated/l10n.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/service/service.dart';
import 'package:wan_android_flutter/utils/utils.dart';

class MBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ParamSingleCallback<int> onTap;

  const MBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeColorService = Get.find<ThemeColorService>();
    final unselectedColor = ColorStyle.color_B8C0D4;
    final icons = <String>[
      "home",
      "system",
      "official_account",
      "navigation",
      "project",
    ];
    final labels = <String>[
      S.of(context).tab_1,
      S.of(context).tab_2,
      S.of(context).tab_3,
      S.of(context).tab_4,
      S.of(context).tab_5,
    ];

    final selectedColor = themeColorService.color;
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: selectedColor.value,
      unselectedItemColor: unselectedColor,
      selectedFontSize: 12.sp,
      unselectedFontSize: 12.sp,
      items: List.generate(
        labels.length,
        (index) => _buildNavItem(
          index: index,
          iconName: icons[index],
          label: labels[index],
          selectedColor: selectedColor.value,
          unselectedColor: unselectedColor,
        ),
      ),
      onTap: onTap.call,
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required int index,
    required String iconName,
    required String label,
    required Color selectedColor,
    required Color unselectedColor,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        assetImage(iconName),
        width: 24.w,
        height: 24.w,
        color: currentIndex == index ? selectedColor : unselectedColor,
      ),
      label: label,
    );
  }
}
