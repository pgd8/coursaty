import 'package:coursaty/Core/Constants/constants.dart';
import 'package:coursaty/Core/Shared_Widgets/app_bar_custom.dart';
import 'package:coursaty/Core/Themes/assets_manager.dart';
import 'package:coursaty/Core/data/models/course_model.dart';
import 'package:coursaty/Core/locale_keys.g.dart';
import 'package:coursaty/features/My_Courses/presentation/view/my_course_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCourseView extends StatelessWidget {
  const MyCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(.infinity, Constants.kToolBarHeight),
        child: AppBarCustom(isHome: false, title: LocaleKeys.kMyCourses.tr()),
      ),
      body: Padding(
        padding: .symmetric(horizontal: 15.r, vertical: 10.r),
        child: Column(
          children: [
            MyCourseCard(
              course: CourseModel(
                id: '1',
                title: 'Flutter Deploma',
                image: AssetsManager.flutterCourse,
                duration: 3,
                cost: 6000,
                capacity: 30,
                isActive: true,
                description:
                    """ Flutter is Google’s open-source UI toolkit for building high-performance, natively compiled applications from a single codebase for mobile (iOS & Android), web, desktop, and embedded devices. This course teaches you how to design, develop, test, and deploy beautiful, responsive apps using Dart and Flutter’s rich ecosystem of widgets and tools.

You’ll start with Flutter fundamentals — understanding widgets, layouts, and app architecture — and progress to building real-world projects with state management, navigation, animations, and backend integration. By the end of the course, you’ll be able to create fully functional, production-ready Flutter applications and understand best practices for performance optimization and app deployment.""",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
