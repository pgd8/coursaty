import 'package:coursaty/Core/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Themes/color_data.dart';

class Constants {
  static const String kToken = 'kToken';

  static double kToolBarHeight = 56.0;

  static const String kEgyptianPound = 'E£';

  static List<BoxShadow> boxShadow = [
    BoxShadow(
      color: ColorData.grayShadow1Color.withValues(alpha: 0.08),
      spreadRadius: -2.r,
      blurRadius: 8.r,
      offset: const Offset(0, 4),
    ),
    BoxShadow(
      color: ColorData.grayShadow2Color.withValues(alpha: 0.04),
      blurRadius: 4.r,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> bottomNavBarShadow = [
    BoxShadow(
      color: ColorData.bottomNavBarShadow1Color,
      spreadRadius: -8.r,
      blurRadius: 24.r,
      offset: Offset(0, 4),
    ),
    BoxShadow(
      color: ColorData.bottomNavBarShadow2Color,
      blurRadius: 160.r,
      offset: Offset(0, 8),
    ),
  ];

  static List<BoxShadow> boxShadow2 = [
    const BoxShadow(
      color: ColorData.grayShadow1Color,
      spreadRadius: -8,
      blurRadius: 24,
      offset: Offset(0, 4),
    ),
    const BoxShadow(
      color: ColorData.grayShadow2Color,
      blurRadius: 16,
      offset: Offset(0, 8),
    ),
  ];

  static BoxDecoration decorationUser = BoxDecoration(
    borderRadius: BorderRadius.circular(16.r),
    color: ColorData.whiteColor,
    boxShadow: boxShadow2,
  );

  static List<String> questions = [
    LocaleKeys.kQuestionOne.tr(),
    LocaleKeys.kQuestionTwo.tr(),
    LocaleKeys.kQuestionThree.tr(),
    LocaleKeys.kQuestionFour.tr(),
    LocaleKeys.kQuestionFive.tr(),
  ];

  static List<List<String>> answers = [
    [
      LocaleKeys.kQ1Option1.tr(),
      LocaleKeys.kQ1Option2.tr(),
      LocaleKeys.kQ1Option3.tr(),
      LocaleKeys.kQ1Option4.tr(),
    ],
    [
      LocaleKeys.kQ2Option1.tr(),
      LocaleKeys.kQ2Option2.tr(),
      LocaleKeys.kQ2Option3.tr(),
      LocaleKeys.kQ2Option4.tr(),
    ],
    [
      LocaleKeys.kQ3Option1.tr(),
      LocaleKeys.kQ3Option2.tr(),
      LocaleKeys.kQ3Option3.tr(),
      LocaleKeys.kQ3Option4.tr(),
    ],
    [
      LocaleKeys.kQ4Option1.tr(),
      LocaleKeys.kQ4Option2.tr(),
      LocaleKeys.kQ4Option3.tr(),
      LocaleKeys.kQ4Option4.tr(),
    ],
    [
      LocaleKeys.kQ5Option1.tr(),
      LocaleKeys.kQ5Option2.tr(),
      LocaleKeys.kQ5Option3.tr(),
      LocaleKeys.kQ5Option4.tr(),
    ],
  ];
}
