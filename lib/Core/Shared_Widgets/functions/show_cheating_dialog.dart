import 'package:coursaty/Core/Shared_Widgets/main_button_custom.dart';
import 'package:coursaty/Core/Themes/assets_manager.dart';
import 'package:coursaty/Core/Themes/color_data.dart';
import 'package:coursaty/Core/Themes/style_data.dart';
import 'package:coursaty/Core/Themes/unit.dart';
import 'package:coursaty/Core/locale_keys.g.dart';
import 'package:coursaty/features/user/prsentation/manager/user_cubit.dart';
import 'package:coursaty/features/user/prsentation/manager/user_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

void showCheatingDialog({
  required BuildContext context,
  required String courseId,
  required String studentId,
}) {
  showDialog(
    fullscreenDialog: false,
    context: context,
    builder: (context) => Center(
      child: Container(
        width: Unit(context).getWidthSize * 0.8,
        padding: .all(15.r),
        decoration: BoxDecoration(
          color: ColorData.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .center,
          children: [
            Container(
              alignment: .topRight,
              child: CloseButton(onPressed: context.pop),
            ),
            Lottie.asset(
              AssetsManager.cheatedLottie,
              width: 200.w,
              height: 150.h,
            ),
            SizedBox(height: 10.h),
            Text(
              LocaleKeys.kExamClosedBecauseYouCheated.tr(),
              style: Styles.textStyleGray600M14,
              textAlign: .center,
            ),
            SizedBox(height: 10.h),
            MainButtonCustom(
              text: LocaleKeys.kConfirm.tr(),
              color: ColorData.danger500Color,
              onTap: () {
                context.read<UserCubit>().markAsCheating(
                  courseId: courseId,
                  studentId: studentId,
                );
                context
                  ..pop()
                  ..pop()
                  ..pop();
              },
            ),
          ],
        ),
      ),
    ),
  );
}
