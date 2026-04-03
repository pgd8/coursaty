import 'package:coursaty/Core/Shared_Widgets/app_bar_custom.dart';
import 'package:coursaty/Core/Shared_Widgets/dialogs/show_error_dialog.dart';
import 'package:coursaty/Core/Shared_Widgets/dialogs/show_success_dialog.dart';
import 'package:coursaty/Core/Shared_Widgets/main_button_custom.dart';
import 'package:coursaty/Core/Themes/assets_manager.dart';
import 'package:coursaty/Core/Themes/color_data.dart';
import 'package:coursaty/Core/Themes/style_data.dart';
import 'package:coursaty/Core/Themes/unit.dart';
import 'package:coursaty/Core/data/models/course_model.dart';
import 'package:coursaty/Core/locale_keys.g.dart';
import 'package:coursaty/features/Home/prsentation/manager/home_cubit.dart';
import 'package:coursaty/features/Home/prsentation/manager/home_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../Core/Constants/constants.dart';

class CourseDetailView extends StatefulWidget {
  final String courseId;
  const CourseDetailView({super.key, required this.courseId});

  @override
  State<CourseDetailView> createState() => _CourseDetailViewState();
}

class _CourseDetailViewState extends State<CourseDetailView> {
  CourseModel? _course;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getCourseById(couseId: widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (previous, current) =>
          current is GetCourseError ||
          current is GotCourseSuccess ||
          current is EnrollCourseError ||
          current is EnrollCourseSuccess,
      listener: (context, state) {
        if (state is GotCourseSuccess) {
          _course = state.course;
        } else if (state is GetCourseError) {
          showErrorDialog(context: context, message: state.message);
        } else if (state is EnrollCourseError) {
          showErrorDialog(context: context, message: state.message);
        } else if (state is EnrollCourseSuccess) {
          showSuccessDialog(context: context);
        }
      },
      buildWhen: (previous, current) =>
          current is GetCouseLoading ||
          current is GetCourseError ||
          current is GotCourseSuccess ||
          current is EnrollCourseLoading ||
          current is EnrollCourseError ||
          current is EnrollCourseSuccess,
      builder: (context, state) {
        final course = state is GotCourseSuccess ? state.course : _course;
        final isInitialLoading = state is GetCouseLoading && course == null;
        final isEnrolling = state is EnrollCourseLoading;

        if (isInitialLoading) {
          return _buildScaffold(
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (course == null) {
          return _buildScaffold(
            body: Center(child: Text(LocaleKeys.kCourseDetails.tr())),
          );
        }

        return _buildScaffold(
          body: Stack(
            children: [
              Padding(
                padding: .all(12.r),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      course.image != null && course.image!.isEmpty
                          ? Container(
                              width: .infinity,
                              height: 150.h,
                              margin: .symmetric(
                                horizontal: 15.w,
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    AssetsManager.placeHolderImage,
                                  ),
                                  fit: .fill,
                                ),
                                borderRadius: .circular(16.r),
                              ),
                            )
                          : Container(
                              width: .infinity,
                              height: 150.h,
                              margin: .symmetric(
                                horizontal: 15.w,
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(course.image!),
                                  fit: .fill,
                                ),
                                borderRadius: .circular(16.r),
                              ),
                            ),
                      Text(course.title, style: Styles.textStyleBlue500M14),
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
                            course.duration.toString(),
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
                            course.cost.toString(),
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
                            course.capacity.toString(),
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
                        course.description,
                        textAlign: .start,
                        style: Styles.textStyleGray400R12,
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: MainButtonCustom(
                          text: LocaleKeys.kEnroll.tr(),
                          width: Unit(context).getWidthSize * 0.7,
                          onTap: isEnrolling
                              ? null
                              : () {
                                  context.read<HomeCubit>().enrollCourse(
                                    courseID: course.id,
                                  );
                                },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildScaffold({required Widget body}) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(.infinity, Constants.kToolBarHeight),
        child: AppBarCustom(
          isHome: false,
          title: LocaleKeys.kCourseDetails.tr(),
        ),
      ),
      body: body,
    );
  }
}
