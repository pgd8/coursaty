import 'package:coursaty/Core/Constants/constants.dart';
import 'package:coursaty/Core/Shared_Widgets/app_bar_custom.dart';
import 'package:coursaty/Core/Themes/color_data.dart';
import 'package:coursaty/Core/Themes/style_data.dart';
import 'package:coursaty/Core/locale_keys.g.dart';
import 'package:coursaty/features/user/prsentation/manager/user_cubit.dart';
import 'package:coursaty/features/user/prsentation/manager/user_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradesView extends StatefulWidget {
  const GradesView({super.key});

  @override
  State<GradesView> createState() => _GradesViewState();
}

class _GradesViewState extends State<GradesView> {
  late UserCubit cubit;
  @override
  void initState() {
    cubit = context.read<UserCubit>();
    cubit.getGrades();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(.infinity, Constants.kToolBarHeight),
        child: AppBarCustom(title: LocaleKeys.kGrades.tr(), isHome: false),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is GetGradesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetGradesSuccess) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 10.h),
              child: ListView.separated(
                itemCount: state.grades.length,
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  final grade = state.grades[index];
                  return ListTile(
                    tileColor: ColorData.blackColor,
                    shape: ContinuousRectangleBorder(
                      borderRadius: .circular(16.r),
                    ),
                    title: Text(
                      grade.courseModel.title,
                      style: Styles.textStyleWhiteM16,
                    ),
                    subtitle: Row(
                      spacing: 10.w,
                      children: [
                        Text(
                          LocaleKeys.kGrade.tr(),
                          style: Styles.textStyleWhiteR14,
                        ),
                        grade.letterGrade == 'F'
                            ? Text(
                                LocaleKeys.kCheated.tr(),
                                textAlign: .center,
                                style: Styles.textStyleDanger500R12,
                              )
                            : Text(
                                grade.grade.toString(),
                                style: Styles.textStyleWhiteR14,
                              ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (state is GetGradesError) {
            return Center(
              child: Text(state.message, style: Styles.textStyleGray800M15),
            );
          } else {
            return Center(
              child: Text(
                LocaleKeys.kYouHaveNotTakenAnyExamsYet.tr(),
                style: Styles.textStyleGray800M15,
              ),
            );
          }
        },
      ),
    );
  }
}
