import 'package:coursaty/core/Constants/constants.dart';
import 'package:coursaty/core/Themes/color_data.dart';
import 'package:coursaty/core/Themes/style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarThemeData(
      backgroundColor: ColorData.blackColor,
      toolbarHeight: Constants.kToolBarHeight,
    ),
    inputDecorationTheme: InputDecorationThemeData(
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
    )
  );
}