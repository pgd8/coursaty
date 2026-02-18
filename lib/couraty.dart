import 'package:coursaty/core/routing/app_router.dart';
import 'package:coursaty/core/Themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursatyApp extends StatelessWidget {
  const CoursatyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const	Size(360,690),
      useInheritedMediaQuery: true,
      ensureScreenSize: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Coursaty',
          themeMode: ThemeMode.light,
          theme: Themes.lightTheme,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
