import 'package:acoursa/Core/Constants/constants.dart';
import 'package:acoursa/Core/Shared_Widgets/app_bar_custom.dart';
import 'package:acoursa/Core/locale_keys.g.dart';
import 'package:acoursa/features/Home/prsentation/manager/home_cubit.dart';
import 'package:acoursa/features/Home/prsentation/manager/home_state.dart';
import 'package:acoursa/features/Home/prsentation/view/widgets/my_course_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCourseView extends StatefulWidget {
  const MyCourseView({super.key});

  @override
  State<MyCourseView> createState() => _MyCourseViewState();
}

class _MyCourseViewState extends State<MyCourseView> {
  @override
  void initState() {
    context.read<HomeCubit>().getMyCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(.infinity, Constants.kToolBarHeight),
        child: AppBarCustom(isHome: false, title: LocaleKeys.kMyCourses.tr()),
      ),
      body: Padding(
        padding: .symmetric(horizontal: 15.r, vertical: 10.r),
        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) {
            return current is GetMyCoursesLoading ||
                current is GetMyCoursesError ||
                current is GetMyCoursesSuccess;
          },
          builder: (context, state) {
            if (state is GetMyCoursesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetMyCoursesSuccess) {
              return ListView.builder(
                itemCount: state.courses.length,
                itemBuilder: (context, index) {
                  return MyCourseCard(course: state.courses[index]);
                },
              );
            } else if (state is GetMyCoursesError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No courses found'));
            }
          },
        ),
      ),
    );
  }
}
