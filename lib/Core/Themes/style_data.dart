import 'package:acoursa/Core/Themes/color_data.dart';
import 'package:acoursa/Core/Themes/font_weight_data.dart';
import 'package:acoursa/Core/Themes/unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


abstract class Styles {
  static const fontFamily = 'Inter';

  static Unit? unit;
  static double get screenWidth => unit?.getWidthSize ?? 0.0;
  static double get screenHeight => unit?.getHeightSize ?? 0.0;

  static void init(BuildContext context) {
    unit = Unit(context);
  }

  static TextStyle textStylePrimary500R14 = TextStyle(
    color: ColorData.primary500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleWhiteR12 = TextStyle(
    color: ColorData.whiteColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: 12.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleWhiteR14 = TextStyle(
    color: ColorData.whiteColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleWhiteR16 = TextStyle(
    color: ColorData.whiteColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: 16.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleWhiteR20 = TextStyle(
    color: ColorData.whiteColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: 20.sp,
    height: 0,
    fontFamily: fontFamily,
  );
  static TextStyle textStyleWhiteM16 = TextStyle(
    color: ColorData.whiteColor,
    fontWeight: FontWeightStyles.medium,
    fontSize: 16.sp,
    height: 0,
    fontFamily: fontFamily,
  );
  static TextStyle textStyleWhiteM20 = TextStyle(
    color: ColorData.whiteColor,
    fontWeight: FontWeightStyles.medium,
    fontSize: 20.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray300R12 = TextStyle(
    color: ColorData.gray300Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 12.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray600M18 = TextStyle(
    color: ColorData.gray600Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: 18.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue500R14 = TextStyle(
    color: ColorData.blue500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray500R14 = TextStyle(
    color: ColorData.gray500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray500R12 = TextStyle(
    color: ColorData.gray500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 12.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleDangerR12 = TextStyle(
    color: ColorData.danger500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 12.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray600M16 = TextStyle(
    color: ColorData.gray600Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: 16.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray400R12 = TextStyle(
    color: ColorData.gray400Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 12.sp,
    height: 0,
    fontFamily: fontFamily,
  );
  static TextStyle textStyleGray400R14 = TextStyle(
    color: ColorData.gray400Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray400R16 = TextStyle(
    color: ColorData.gray400Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 16.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePrimaryGradientM14 = TextStyle(
    fontWeight: FontWeightStyles.medium,
    fontSize: 14.sp,
    height: 1.2,
    fontFamily: fontFamily,
    foreground: Paint()
      ..shader = const LinearGradient(
        colors: [
          ColorData.primaryGradientDarkColor,
          ColorData.primaryGradientLightColor,
        ],
      ).createShader(Rect.fromLTWH(0, 0, screenWidth * 0.2, 0)),
  );

  static TextStyle textStyleBlueGradientR10 = TextStyle(
    fontWeight: FontWeightStyles.regular,
    fontSize: 10.sp,
    height: 1.2,
    fontFamily: fontFamily,
    foreground: Paint()
      ..shader =
      const LinearGradient(
        colors: [
          ColorData.blueGradientLightColor,
          ColorData.blueGradientDarkColor,
        ],
      ).createShader(
        Rect.fromLTWH(screenWidth * 0.6, 0, screenWidth * 0.3, 0),
      ),
  );

  static TextStyle textStyleGray700R12 = TextStyle(
    color: ColorData.gray700Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 12.sp,
    height: 0,
    fontFamily: fontFamily,
  );
  static TextStyle textStyleBlue700R12 = TextStyle(
    color: ColorData.blue500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 12.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray700R14 = TextStyle(
    color: ColorData.gray700Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );
  static TextStyle textStyleBlackM24 = TextStyle(
    color: ColorData.blackColor,
    fontWeight: FontWeightStyles.medium,
    fontSize: 24.sp,
    height: 0,
    fontFamily: fontFamily,
  );
  static TextStyle textStylePrimary500SB16 = TextStyle(
    color: ColorData.primary500Color,
    fontWeight: FontWeightStyles.semiBold,
    fontSize: 16.sp,
    height: 0,
    fontFamily: fontFamily,
  );
  static TextStyle textStylePrimary500SB20 = TextStyle(
    color: ColorData.primary500Color,
    fontWeight: FontWeightStyles.semiBold,
    fontSize: 20.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePrimary500SB25 = TextStyle(
    color: ColorData.primary500Color,
    fontWeight: FontWeightStyles.semiBold,
    fontSize: 25.sp,
    height: 0,
    fontFamily: fontFamily,
  );
  static TextStyle textStyleBlackSB24 = TextStyle(
    color: ColorData.blackColor,
    fontWeight: FontWeightStyles.semiBold,
    fontSize: 24.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlackSB14 = TextStyle(
    color: ColorData.blackColor,
    fontWeight: FontWeightStyles.semiBold,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray600R14 = TextStyle(
    color: ColorData.gray600Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray600R18 = TextStyle(
    color: ColorData.gray600Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 18.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray300R14 = TextStyle(
    color: ColorData.gray300Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue100R12 = TextStyle(
    color: ColorData.blue100Color,
    fontWeight: FontWeightStyles.bold,
    fontSize: 12.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle profileNameTextStyle = TextStyle(
    fontWeight: FontWeightStyles.semiBold,
    color: ColorData.gray600Color,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle profileEmailTextStyle = TextStyle(
    fontWeight: FontWeightStyles.regular,
    color: ColorData.gray400Color,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle selectedItemTextStyle = TextStyle(
    color: ColorData.primary500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle unSelectedItemTextStyle = TextStyle(
    color: ColorData.gray600Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle cardTitleTextStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightStyles.regular,
    color: ColorData.gray700Color,
    fontFamily: fontFamily,
  );

  static TextStyle cardSubtitleTextStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightStyles.regular,
    color: ColorData.gray300Color,
    fontFamily: fontFamily,
  );

  static TextStyle whiteButtonTextStyle = TextStyle(
    color: ColorData.primary500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray500R18 = TextStyle(
    color: ColorData.gray500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 18.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray500R16 = TextStyle(
    color: ColorData.gray500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 16.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray700R18 = TextStyle(
    color: ColorData.gray700Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 18.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlackM16 = TextStyle(
    color: ColorData.blackColor,
    fontWeight: FontWeightStyles.medium,
    fontSize: 16.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle primaryButtonTextStyle = TextStyle(
    color: ColorData.whiteColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray800M15 = TextStyle(
    color: ColorData.gray800Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: 15.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray700M16 = TextStyle(
    color: ColorData.gray700Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: 16.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlueGradientR12 = TextStyle(
    fontWeight: FontWeightStyles.regular,
    fontSize: 12.sp,
    height: 1.2,
    fontFamily: fontFamily,
    foreground: Paint()
      ..shader =
      const LinearGradient(
        colors: [
          ColorData.blueGradientLightColor,
          ColorData.blueGradientDarkColor,
        ],
      ).createShader(
        Rect.fromLTWH(screenWidth * 0.75, 0, screenWidth * 0.2, 0),
      ),
  );

  static TextStyle textStyleGray500M14 = TextStyle(
    color: ColorData.gray500Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray700SB14 = TextStyle(
    color: ColorData.gray700Color,
    fontWeight: FontWeightStyles.semiBold,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleSuccess600R12 = TextStyle(
    color: ColorData.success600Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 12.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray700M14 = TextStyle(
    color: ColorData.gray700Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray600R16 = TextStyle(
    color: ColorData.gray600Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 16.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlueGradientLeftR12 = TextStyle(
    fontWeight: FontWeightStyles.regular,
    fontSize: 12.sp,
    height: 1.2,
    fontFamily: fontFamily,
    foreground: Paint()
      ..shader =
      const LinearGradient(
        colors: [
          ColorData.blueGradientLightColor,
          ColorData.blueGradientDarkColor,
        ],
      ).createShader(
        Rect.fromLTWH(screenWidth * 0.05, 0, screenWidth * 0.25, 0),
      ),
  );


  static TextStyle textStylePrimary600R12 = TextStyle(
    color: ColorData.primary600Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 12.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleWarning500R12 = TextStyle(
    color: ColorData.warning500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 12.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleWarning500R14 = TextStyle(
    color: ColorData.warning500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray600M14 = TextStyle(
    color: ColorData.gray600Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: 16.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue500M14 = TextStyle(
    color: ColorData.blue500Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: 14.sp,
    height: 0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleDanger500R12 = TextStyle(
    color: ColorData.danger500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: 12.sp,
    height: 0,
    fontFamily: fontFamily,
  );


  static TextStyle submitButtonTextStyle = TextStyle(
    fontSize: 13.sp,
    color: ColorData.whiteColor,
  );


  //buttons styles
  static ButtonStyle miniMainButtonStyle =ElevatedButton.styleFrom(
    backgroundColor: ColorData.primary500Color,
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
    ),
  );

}
