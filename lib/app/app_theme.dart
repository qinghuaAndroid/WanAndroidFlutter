/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-09 22:30:22
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/theme/app_theme.dart
 */
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff171616);
const kPrimaryLightColor = Color(0xff151515);
const primaryDarkColor = Color(0xff1d1d1d);
const secondaryColor = Color(0xff1f1f1f);
const secondaryLightColor = Color(0xff1c1c1c);
const secondaryDarkColor = Color(0xff000000);

ThemeData get appThemeData => ThemeData(
  primaryColor: kPrimaryColor,
  primaryColorLight: kPrimaryLightColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: appBarTheme,
  textTheme: const TextTheme(),
  fontFamily: 'Noto_Serif_TC_EN',
  fontFamilyFallback: ['Noto_Serif_TC_ZH'],
);

AppBarTheme get appBarTheme => const AppBarTheme();
