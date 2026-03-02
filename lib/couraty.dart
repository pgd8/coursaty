import 'package:coursaty/core/routing/app_router.dart';
import 'package:coursaty/core/Themes/themes.dart';
import 'package:coursaty/features/user/prsentation/manager/user_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import your other cubits here
// import 'package:coursaty/features/auth/presentation/cubit/auth_cubit.dart';
// import 'package:coursaty/features/home/presentation/cubit/home_cubit.dart';

class CoursatyApp extends StatelessWidget {
  const CoursatyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(),
        ),


      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        useInheritedMediaQuery: true,
        ensureScreenSize: true,
        builder: (context, child) {
          return MaterialApp.router(
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            debugShowCheckedModeBanner: false,
            title: 'Coursaty',
            themeMode: ThemeMode.light,
            theme: Themes.lightTheme,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}