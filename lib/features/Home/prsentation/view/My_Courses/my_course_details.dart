import 'package:coursaty/Core/Constants/constants.dart';
import 'package:coursaty/Core/Routing/routes.dart';
import 'package:coursaty/Core/Shared_Widgets/app_bar_custom.dart';
import 'package:coursaty/Core/Shared_Widgets/main_button_custom.dart';
import 'package:coursaty/Core/Themes/assets_manager.dart';
import 'package:coursaty/Core/Themes/unit.dart';
import 'package:coursaty/Core/locale_keys.g.dart';
import 'package:coursaty/features/Home/prsentation/manager/home_cubit.dart';
import 'package:coursaty/features/Home/prsentation/manager/home_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        builder: (context, state) {
          if (state is GetMyCourseByIdLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is GetMyCourseByIdError) {
            return Center(child: Text(state.message));
          }
          return Column(
            children: [
              Container(
                width: .infinity,
                height: 150.h,
                margin: .symmetric(horizontal: 15.w, vertical: 10.h),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetsManager.flutterCourse),
                    fit: .fill,
                  ),
                  borderRadius: .circular(16.r),
                ),
              ),
              SizedBox(height: 20.h),
              MainButtonCustom(
                text: LocaleKeys.kAttemptExam.tr(),
                width: Unit(context).getWidthSize * 0.6,
                onTap: () {
                  context.push(Routes.kExamView);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
