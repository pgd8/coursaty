import 'package:coursaty/Core/Routing/app_router.dart';
import 'package:coursaty/core/routing/routes.dart';
import 'package:coursaty/core/Themes/assets_manager.dart';
import 'package:coursaty/core/Themes/style_data.dart';
import 'package:coursaty/core/Themes/unit.dart';
import 'package:coursaty/features/On_Boarding/onboard_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    routeToOnBoarding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            Image.asset(
              AssetsManager.appLogo,
              width: Unit(context).getWidthSize * 0.4,
            ),
            Text('Coursaty', style: Styles.textStylePrimary500SB25),
          ],
        ),
      ),
    );
  }

  void routeToOnBoarding() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go(Routes.kOnBoarding);
      }
    });
  }
}
