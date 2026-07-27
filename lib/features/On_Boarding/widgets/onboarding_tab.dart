import 'package:acoursa/Core/Themes/style_data.dart';
import 'package:acoursa/features/On_Boarding/widgets/onboard_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingTab extends StatelessWidget {
  final String body;
  final String image;
  const OnboardingTab({super.key, required this.body, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisAlignment: .center,
      children: [
        Center(child: OnboardBg(image: image)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15.h,
            children: [Text(body, style: Styles.textStylePrimary500SB25)],
          ),
        ),
      ],
    );
  }
}
