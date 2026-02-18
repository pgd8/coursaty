import 'package:coursaty/core/routing/routes.dart';
import 'package:coursaty/core/Themes/assets_manager.dart';
import 'package:coursaty/core/Themes/style_data.dart';
import 'package:coursaty/core/Themes/unit.dart';
import 'package:coursaty/features/Login/presentaion/view/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .center,
          children: [
            Center(
              child: Image.asset(
                AssetsManager.appLogo,
                width: Unit(context).getWidthSize * 0.4,
              ),
            ),
            LoginForm(),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: .center,
              children: [
                Text(
                  'Don\'t Have Account?',
                  style: Styles.textStyleGray400R14,
                ),
                TextButton(
                  onPressed: () {
                    context.go(Routes.kSignUp);
                  },
                  child: Text('Signup', style: Styles.textStyleBlue700R12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
