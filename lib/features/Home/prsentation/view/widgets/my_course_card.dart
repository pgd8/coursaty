import 'package:coursaty/Core/Constants/constants.dart';
import 'package:coursaty/Core/Routing/routes.dart';
import 'package:coursaty/Core/Themes/assets_manager.dart';
import 'package:coursaty/Core/Themes/color_data.dart';
import 'package:coursaty/Core/Themes/style_data.dart';
import 'package:coursaty/Core/data/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MyCourseCard extends StatelessWidget {
  final CourseModel course;
  const MyCourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.kMyCoursesDetails, extra: {'courseId': course.id});
      },
      child: Container(
        decoration: Constants.decorationUser,
        height: 220.h,
        child: Column(
          children: [
            course.image != null && course.image!.isEmpty
                ? Container(
                    width: .infinity,
                    height: 150.h,
                    margin: .symmetric(horizontal: 15.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetsManager.placeHolderImage),
                        fit: .fill,
                      ),
                      borderRadius: .circular(16.r),
                    ),
                  )
                : Container(
                    width: .infinity,
                    height: 150.h,
                    margin: .symmetric(horizontal: 15.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(course.image!),
                        fit: .fill,
                      ),
                      borderRadius: .circular(16.r),
                    ),
                  ),
            Container(
              padding: .symmetric(horizontal: 10.w),
              width: .infinity,
              decoration: BoxDecoration(
                color: ColorData.primary500Color,
                borderRadius: .only(
                  bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(course.title, style: Styles.textStyleWhiteR14),
                  Row(
                    children: [
                      Text('Duration:', style: Styles.textStyleWhiteR14),
                      SizedBox(width: 2.w),
                      Text(
                        course.duration.toString(),
                        style: Styles.textStyleWhiteR12,
                      ),
                    ],
                  ),
                  Text(
                    '${course.cost} ${Constants.kEgyptianPound}',
                    style: Styles.textStyleWhiteR12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
