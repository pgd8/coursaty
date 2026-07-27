import 'package:coursaty/Core/locale_keys.g.dart';
import 'package:coursaty/Core/Routing/routes.dart';
import 'package:coursaty/Core/Themes/assets_manager.dart';
import 'package:coursaty/Core/Themes/style_data.dart';
import 'package:coursaty/Core/Themes/unit.dart';
import 'package:coursaty/features/Sign_Up/presentaion/view/widgets/signup_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Center(
                child: Image.asset(
                  AssetsManager.appLogo,
                  width: Unit(context).getWidthSize * 0.5,
                ),
              ),
              SizedBox(height: 10.h),
              SignupForm(),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    LocaleKeys.kAlreadyHaveAccount.tr(),
                    style: Styles.textStyleGray400R14,
                  ),
                  TextButton(
                    onPressed: () {
                      context.go(Routes.kLogin);
                    },
                    child: Text(
                      LocaleKeys.kLogin.tr(),
                      style: Styles.textStyleBlue700R12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
