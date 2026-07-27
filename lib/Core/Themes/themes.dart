
import 'package:acoursa/Core/Constants/constants.dart';
import 'package:acoursa/Core/Themes/color_data.dart';
import 'package:acoursa/Core/Themes/style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarThemeData(
      backgroundColor: ColorData.blackColor,
      toolbarHeight: Constants.kToolBarHeight,
    ),
    inputDecorationTheme: InputDecorationThemeData(
      suffixIconColor: ColorData.gray300Color,
      hintStyle: Styles.textStyleGray300R14,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: ColorData.danger500Color)
        )
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: ColorData.primary500Color,
    ),
  );
}