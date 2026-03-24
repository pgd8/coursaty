import 'package:coursaty/Core/locale_keys.g.dart';
import 'package:coursaty/Core/Routing/routes.dart';
import 'package:coursaty/Core/Themes/assets_manager.dart';
import 'package:coursaty/Core/Themes/style_data.dart';
import 'package:coursaty/Core/Themes/unit.dart';
import 'package:coursaty/features/Login/presentaion/view/widgets/login_form.dart';
import 'package:easy_localization/easy_localization.dart';
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
            Row(
              mainAxisAlignment: .center,
              children: [
                Text(
                  LocaleKeys.kDoNotHaveAccount.tr(),
                  style: Styles.textStyleGray400R14,
                ),
                TextButton(
                  onPressed: () {
                    context.go(Routes.kSignUp);
                  },
                  child: Text(
                    LocaleKeys.kSignup.tr(),
                    style: Styles.textStyleBlue700R12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
