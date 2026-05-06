import 'package:coursaty/Core/Constants/constants.dart';
import 'package:coursaty/Core/Routing/routes.dart';
import 'package:coursaty/Core/Shared_Widgets/app_bar_custom.dart';
import 'package:coursaty/Core/Shared_Widgets/main_button_custom.dart';
import 'package:coursaty/Core/Themes/assets_manager.dart';
import 'package:coursaty/Core/Themes/color_data.dart';
import 'package:coursaty/Core/Themes/style_data.dart';
import 'package:coursaty/Core/Themes/unit.dart';
import 'package:coursaty/Core/locale_keys.g.dart';
import 'package:coursaty/features/Home/prsentation/manager/home_cubit.dart';
import 'package:coursaty/features/Home/prsentation/manager/home_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class MyCourseDetails extends StatefulWidget {
  final String courseId;
  const MyCourseDetails({super.key, required this.courseId});

  @override
  State<MyCourseDetails> createState() => _MyCourseDetailsState();
}

class _MyCourseDetailsState extends State<MyCourseDetails> {
  @override
  void initState() {
    context.read<HomeCubit>().getMyCourseById(courseId: widget.courseId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(.infinity, Constants.kToolBarHeight),
        child: AppBarCustom(
          isHome: false,
          title: LocaleKeys.kMyCourseDetails.tr(),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) {
          return current is GetMyCourseByIdLoading ||
              current is GetMyCourseByIdError ||
              current is GetMyCourseByIdSuccess;
        },
        builder: (context, state) {
          if (state is GetMyCourseByIdLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is GetMyCourseByIdError) {
            return Center(child: Text(state.message));
          }
          if (state is GetMyCourseByIdSuccess) {
            final course = state.course;
            return Padding(
              padding: .symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  course.courseModel.image != null &&
                          course.courseModel.image!.isEmpty
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
                              image: NetworkImage(course.courseModel.image!),
                              fit: .fill,
                            ),
                            borderRadius: .circular(16.r),
                          ),
                        ),
                  SizedBox(height: 20.h),
                  Text(
                    course.courseModel.title ?? '',
                    style: Styles.textStyleBlue500M14,
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.clockIcon,
                        colorFilter: ColorFilter.mode(
                          ColorData.blue500Color,
                          BlendMode.srcIn,
                        ),
                        width: 15.w,
                        height: 15.h,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        LocaleKeys.kDuration.tr(),
                        style: Styles.textStyleGray500M14,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        course.courseModel.duration.toString(),
                        style: Styles.textStyleGray400R12,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.poundIcon,
                        colorFilter: ColorFilter.mode(
                          ColorData.blue500Color,
                          BlendMode.srcIn,
                        ),
                        width: 15.w,
                        height: 15.h,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        LocaleKeys.kPrice.tr(),
                        style: Styles.textStyleGray500M14,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        course.courseModel.cost.toString(),
                        style: Styles.textStyleGray400R12,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.personsIcon,
                        colorFilter: ColorFilter.mode(
                          ColorData.blue500Color,
                          BlendMode.srcIn,
                        ),
                        width: 15.w,
                        height: 15.h,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        LocaleKeys.kCapacity.tr(),
                        style: Styles.textStyleGray500M14,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        course.courseModel.capacity.toString(),
                        style: Styles.textStyleGray400R12,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.descriptionIcon,
                        colorFilter: ColorFilter.mode(
                          ColorData.blue500Color,
                          BlendMode.srcIn,
                        ),
                        width: 15.w,
                        height: 15.h,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        LocaleKeys.kDescription.tr(),
                        style: Styles.textStyleGray500M14,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    course.courseModel.description ?? '',
                    textAlign: .start,
                    style: Styles.textStyleGray400R12,
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: MainButtonCustom(
                      text: LocaleKeys.kAttemptExam.tr(),
                      width: Unit(context).getWidthSize * 0.6,
                      onTap: () {
                        context.push(
                          Routes.kExamView,
                          extra: {
                            'courseId': course.id,
                            'studentId': course.studentId,
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
