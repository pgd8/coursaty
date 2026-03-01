import 'package:coursaty/Core/Shared_Widgets/app_bar_custom.dart';
import 'package:coursaty/Core/Shared_Widgets/main_button_custom.dart';
import 'package:coursaty/Core/Themes/assets_manager.dart';
import 'package:coursaty/Core/Themes/color_data.dart';
import 'package:coursaty/Core/Themes/style_data.dart';
import 'package:coursaty/Core/Themes/unit.dart';
import 'package:coursaty/Core/data/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Core/Constants/constants.dart';

class CourseDetailView extends StatelessWidget {
  final CourseModel course;
  const CourseDetailView({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(.infinity, Constants.kToolBarHeight),
        child: AppBarCustom(isHome: false, title: 'Course Details'),
      ),
      body: Padding(
        padding: .all(12.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Container(
                width: .infinity,
                height: 150.h,
                margin: .symmetric(horizontal: 15.w, vertical: 10.h),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(course.image),
                    fit: .fill,
                  ),
                  borderRadius: .circular(16.r),
                ),
              ),
              Text(course.name, style: Styles.textStyleBlue500M14),
              SizedBox(height: 15.h),
              Row(
                children: [
                  SvgPicture.asset(
                    AssetsManager.clockIcon,
                    color: ColorData.blue500Color,
                    width: 15.w,
                    height: 15.h,
                  ),
                  SizedBox(width: 5.w),
                  Text('Duration:', style: Styles.textStyleGray500M14),
                  SizedBox(width: 10.w),
                  Text(course.duration, style: Styles.textStyleGray400R12),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  SvgPicture.asset(
                    AssetsManager.poundIcon,
                    color: ColorData.blue500Color,
                    width: 15.w,
                    height: 15.h,
                  ),
                  SizedBox(width: 5.w),
                  Text('Price:', style: Styles.textStyleGray500M14),
                  SizedBox(width: 10.w),
                  Text(course.price, style: Styles.textStyleGray400R12),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  SvgPicture.asset(
                    AssetsManager.descriptionIcon,
                    color: ColorData.blue500Color,
                    width: 15.w,
                    height: 15.h,
                  ),
                  SizedBox(width: 5.w),
                  Text('Description:', style: Styles.textStyleGray500M14),
                ],
              ),
              SizedBox(height: 15.h),
              Text(
                course.description,
                textAlign: .start,
                style: Styles.textStyleGray400R12,
              ),
              SizedBox(height: 20.h),
              Center(
                child: MainButtonCustom(
                  text: 'Enroll',
                  width: Unit(context).getWidthSize * 0.7,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
