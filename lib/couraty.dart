import 'package:acoursa/Core/Routing/app_router.dart';
import 'package:acoursa/Core/Themes/themes.dart';
import 'package:acoursa/features/Home/domain/home_repo.dart';
import 'package:acoursa/features/Home/prsentation/manager/home_cubit.dart';
import 'package:acoursa/features/Login/domain/login_repo.dart';
import 'package:acoursa/features/Sign_Up/presentaion/manager/signup_cubit.dart';
import 'package:acoursa/features/user/domain/repos/user_repo.dart';
import 'package:acoursa/features/user/prsentation/manager/user_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/Login/presentaion/manager/login_cubit.dart';
import 'features/Sign_Up/domain/signup_repo.dart';

class CoursatyApp extends StatelessWidget {
  const CoursatyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(create: (context) => UserCubit(UserRepo())),
        BlocProvider<SignupCubit>(
          create: (context) => SignupCubit(SignupRepo()),
        ),
        BlocProvider<LoginCubit>(create: (context) => LoginCubit(LoginRepo())),
        BlocProvider(create: (context) => HomeCubit(HomeRepo())),
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
