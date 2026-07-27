
import 'package:acoursa/Core/Themes/assets_manager.dart';
import 'package:acoursa/Core/Themes/color_data.dart';
import 'package:acoursa/Core/Themes/style_data.dart';
import 'package:acoursa/Core/Themes/unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

void showErrorDialog({required BuildContext context, required String message}){
  showDialog(
    fullscreenDialog: false,
    context: context,
    builder: (context) => Center(
      child: Container(
        width: Unit(context).getWidthSize * 0.6,
        padding: .all(15.r),
        decoration: BoxDecoration(
          color: ColorData.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(
              alignment: .topRight,
              child: CloseButton(onPressed: context.pop,),
            ),
            Lottie.asset(
                AssetsManager.errorLottie,
                width: 200.w,
                height:150.h
            ),
            Text(message, style: Styles.textStyleWarning500R14,),
          ],
        ),
      ),
    ),);
}