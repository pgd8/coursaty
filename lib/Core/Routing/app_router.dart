import 'package:coursaty/Core/data/models/course_model.dart';
import 'package:coursaty/core/routing/routes.dart';
import 'package:coursaty/features/Home/home_view.dart';
import 'package:coursaty/features/Login/presentaion/view/login_view.dart';
import 'package:coursaty/features/My_Courses/my_course_details.dart';
import 'package:coursaty/features/My_Courses/presentation/my_course_view.dart';
import 'package:coursaty/features/Notifications/presentaion/view/notification_view.dart';
import 'package:coursaty/features/On_Boarding/onboard_view.dart';
import 'package:coursaty/features/Sign_Up/presentaion/view/signup_view.dart';
import 'package:coursaty/features/Splash_Screen/splash_screen.dart';
import 'package:coursaty/features/course_details/course_detail_view.dart';
import 'package:coursaty/features/user/prsentation/view/exam_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static List<GoRoute> routes = [
    //splash view
    GoRoute(
      path: Routes.kSplashView,
      builder: (context, state) => SplashScreen(),
    ),

    GoRoute(
      path: Routes.kOnBoarding,
      builder: (context, state) => OnboardView(),
    ),

    //login view
    GoRoute(path: Routes.kLogin, builder: (context, state) => LoginView()),

    //signup view
    GoRoute(path: Routes.kSignUp, builder: (context, state) => SignupView()),

    //home view
    GoRoute(path: Routes.kHome, builder: (context, state) => HomeView()),
    //notifications view
    GoRoute(
      path: Routes.kNotificationsView,
      builder: (context, state) => NotificationView(),
    ),
    //courses View
    GoRoute(
      path: Routes.kMyCourses,
      builder: (context, state) => MyCourseView(),
    ),
    //courseDetails View
    GoRoute(
      path: Routes.kCourseDetails,
      builder: (context, state) {
        Map<String, CourseModel> ex = state.extra as Map<String, CourseModel>;
        return CourseDetailView(course: ex['course']!);
      },
    ),

    GoRoute(
      path: Routes.kMyCoursesDetails,
      builder: (context, state) => MyCourseDetails(),
    ),

    GoRoute(path: Routes.kExamView, builder: (context, state) => ExamView()),
  ];

  static GoRouter router = GoRouter(
    routes: routes,
    initialLocation: Routes.kSplashView,
    navigatorKey: _rootNavigatorKey,
  );
}
