import 'package:coursaty/Core/Routing/routes.dart';
import 'package:coursaty/core/Shared_Widgets/main_button_custom.dart';
import 'package:coursaty/core/Themes/color_data.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/Themes/style_data.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final formKey = GlobalKey<FormState>();
  bool isHidden = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Email', style: Styles.textStyleGray600M18),
          SizedBox(height: 10.h),
          TextFormField(

            controller: emailController,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email is required";
              }

              if (!EmailValidator.validate(value)) {
                return "Enter a valid email address";
              }

              return null;
            },
            decoration: InputDecoration(
              isDense: true,
              hintText: 'example@email.com',
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          SizedBox(height: 20.h),
          Text('Password', style: Styles.textStyleGray600M18),
          SizedBox(height: 10.h),
          TextFormField(
            obscureText: isHidden,
            controller: passwordController,
            validator: (value){
              if (value == null || value.isEmpty) {
                return "Password is required";
              }

              if(value.length < 8){
                return 'Password should be at least 8 characters';
              }

              final passwordRegex = RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>]).+$');

              if (!passwordRegex.hasMatch(value)) {
                return "Password should contain at least 1 special character";
              }
              return null;
            },
            decoration: InputDecoration(
              isCollapsed: true,
              hintText: '••••••••',
              prefixIcon: Icon(Icons.lock_outline,size: 20.r,),
              suffix: IconButton(
                alignment: .center,
                iconSize: 20.r,
                padding: .zero,
                onPressed: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
                icon: !isHidden
                    ? Icon(Icons.visibility_rounded , color: ColorData.primary500Color,size: 20.r,)
                    : Icon(Icons.visibility_off_outlined),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          MainButtonCustom(
            text: 'Login',
            color: ColorData.primary500Color,
            onTap: () {
              if(formKey.currentState!.validate()){
                context.go(Routes.kHome);
              }
            },
          ),
        ],
      ),
    );
  }
}
