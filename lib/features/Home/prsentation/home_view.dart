import 'package:coursaty/Core/Constants/constants.dart';
import 'package:coursaty/Core/Routing/routes.dart';
import 'package:coursaty/Core/Shared_Widgets/app_bar_custom.dart';
import 'package:coursaty/Core/Shared_Widgets/functions/shou_logut_dialog.dart';
import 'package:coursaty/Core/Themes/assets_manager.dart';
import 'package:coursaty/Core/Themes/unit.dart';
import 'package:coursaty/Core/locale_keys.g.dart';
import 'package:coursaty/features/Home/prsentation/manager/home_cubit.dart';
import 'package:coursaty/features/Home/prsentation/manager/home_state.dart';
import 'package:coursaty/features/Home/prsentation/widgets/course_card.dart';
import 'package:coursaty/features/user/prsentation/manager/user_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../user/prsentation/manager/user_state.dart';
import 'widgets/drawer_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  initState() {
    super.initState();
    context.read<HomeCubit>().getCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size(.infinity, Constants.kToolBarHeight),
        child: AppBarCustom(
          isHome: true,
          menuButtonOnPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      drawer: BlocConsumer<UserCubit, UserState>(
        builder: (context, state) {
          final cubit = context.read<UserCubit>();
          return Drawer(
            width: Unit(context).getWidthSize * 0.5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 0.1.sh),
              child: Column(
                children: [
                  DrawerItem(
                    icon: AssetsManager.myCoursesIcon,
                    title: LocaleKeys.kMyCourses.tr(),
                    onTap: () {
                      context.pop();
                      context.push(Routes.kMyCourses);
                    },
                  ),
                  SizedBox(height: 10.h),
                  DrawerItem(
                    icon: AssetsManager.translationsIcon,
                    title: LocaleKeys.kChangeLanguage.tr(),
                    onTap: () {
                      context.pop();
                      if (context.locale == const Locale('en')) {
                        context.setLocale(const Locale('ar'));
                      } else {
                        context.setLocale(const Locale('en'));
                        setState(() {});
                      }
                    },
                  ),
                  SizedBox(height: 10.h),
                  DrawerItem(
                    icon: AssetsManager.signOutIcon,
                    title: LocaleKeys.kLogout.tr(),
                    onTap: () {
                      context.pop();
                      cubit.requestLogout();
                    },
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is RequestedLogOut) {
            showLogoutDialog(context: context);
          }
          if (state is LogOutSuccess) {
            context.go(Routes.kLogin);
          }
        },
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingCourses) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeError) {
            return Center(child: Text(state.message));
          } else if (state is HomeCoursesLoaded) {
            final courses = state.courses;
            debugPrint(courses.length.toString());
            Widget itemBuilder(context, index) {
              return CourseCard(course: courses[index]);
            }

            Widget separatorBuilder(context, index) {
              return SizedBox(height: 10.h);
            }

            int itemCount = courses.length;
        
          return Padding(
            padding: .symmetric(horizontal: 15.r, vertical: 10.r),
            child: Column(
              children: [
                Expanded(child: ListView.separated(itemBuilder: itemBuilder, separatorBuilder: separatorBuilder, itemCount: itemCount))
                ],
            ),
          );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
