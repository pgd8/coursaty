import 'package:acoursa/Core/Constants/constants.dart';
import 'package:acoursa/Core/Routing/routes.dart';
import 'package:acoursa/Core/Themes/assets_manager.dart';
import 'package:acoursa/Core/Themes/style_data.dart';
import 'package:acoursa/Core/Themes/unit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    routeToAppStart();
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

  void routeToAppStart() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString(Constants.kToken);
    if(token != null){
      context.go(Routes.kHome);
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          context.go(Routes.kOnBoarding);
        }
      });
    }
  }
}
