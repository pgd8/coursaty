import 'package:coursaty/Core/Shared_Widgets/app_bar_custom.dart';
import 'package:coursaty/Core/Shared_Widgets/functions/shou_logut_dialog.dart';
import 'package:coursaty/Core/Shared_Widgets/main_button_custom.dart';
import 'package:coursaty/Core/Themes/style_data.dart';
import 'package:coursaty/Core/Themes/unit.dart';
import 'package:coursaty/Core/data/models/course_model.dart';
import 'package:coursaty/Core/locale_keys.g.dart';
import 'package:coursaty/core/Constants/constants.dart';
import 'package:coursaty/features/Home/widgets/course_card.dart';
import 'package:coursaty/features/Home/widgets/drawer_item.dart';
import 'package:coursaty/features/user/prsentation/manager/user_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../Core/Themes/color_data.dart';
import '../../core/Themes/assets_manager.dart';
import '../../core/routing/routes.dart';
import '../user/prsentation/manager/user_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
      drawer: BlocConsumer<UserCubit,UserState>(
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
                    onTap: (){
                      context.pop();
                      context.push(Routes.kMyCourses);
                    },
                  ),
                  SizedBox(height: 10.h),
                  DrawerItem(
                    icon: AssetsManager.translationsIcon,
                    title: LocaleKeys.kChangeLanguage.tr(),
                    onTap: (){
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
                    icon: AssetsManager.translationsIcon,
                    title: LocaleKeys.kLogout.tr(),
                    onTap: (){
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
          if(state is RequestedLogOut){
            showLogoutDialog(context: context);
          }
          if(state is LogOutSuccess){
            context.go(Routes.kLogin);
          }
        }),
      body: Padding(
        padding: .symmetric(horizontal: 15.r, vertical: 10.r),
        child: Column(
          children: [
            CourseCard(
              course: CourseModel(
                id: '1',
                name: 'Flutter Deploma',
                image: AssetsManager.flutterCourse,
                duration: '3 months',
                price: '6000',
                description:
                    """ Flutter is Google’s open-source UI toolkit for building high-performance, natively compiled applications from a single codebase for mobile (iOS & Android), web, desktop, and embedded devices. This course teaches you how to design, develop, test, and deploy beautiful, responsive apps using Dart and Flutter’s rich ecosystem of widgets and tools.

You’ll start with Flutter fundamentals — understanding widgets, layouts, and app architecture — and progress to building real-world projects with state management, navigation, animations, and backend integration. By the end of the course, you’ll be able to create fully functional, production-ready Flutter applications and understand best practices for performance optimization and app deployment.""",
              ),
            ),
            SizedBox(height: 15.h),
            CourseCard(
              course: CourseModel(
                id: '2',
                name: 'Beckend Deploma',
                image: AssetsManager.backendCourse,
                duration: '5 months',
                price: '10000',
                description:
                    """This course teaches how to build scalable and secure backend systems using Node.js and modern backend technologies. You will learn how to create RESTful APIs, manage databases, implement authentication, and handle real-world server-side logic.

The course covers building backend services using Express.js, connecting to databases such as MongoDB or SQL, and implementing secure authentication using JWT and encryption techniques. You will also learn how to structure backend projects using best practices and clean architecture principles.

By the end of the course, you will be able to design, develop, and deploy production-ready backend APIs that can power mobile and web applications.""",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
