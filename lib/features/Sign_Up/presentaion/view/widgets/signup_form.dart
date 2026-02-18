import 'package:coursaty/core/Shared_Widgets/main_button_custom.dart';
import 'package:coursaty/core/Themes/color_data.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/Themes/style_data.dart';
import '../../../../../core/routing/routes.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final formKey = GlobalKey<FormState>();
  bool isHidden = true;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;

  @override
  void initState() {
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    passwordConfirmationController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Name', style: Styles.textStyleGray600M18),
          SizedBox(height: 10.h),
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Ex. John Doe',
              prefixIcon: Icon(Icons.drive_file_rename_outline),
            ),
          ),
          SizedBox(height: 20.h),
          Text('Phone Number', style: Styles.textStyleGray600M18),
          SizedBox(height: 10.h),
          TextFormField(
            controller: phoneNumberController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Phone number is required";
              }

              final phoneRegex = RegExp(r'^[0-9]{10,15}$');

              if (!phoneRegex.hasMatch(value)) {
                return "Enter a valid phone number";
              }

              if(value.trim().length != 11){
                return "Enter a valid phone number";

              }

              return null;
            },
            decoration: InputDecoration(
              isDense: true,
              hintText: '01234567890',
              prefixIcon: Icon(Icons.phone_enabled_outlined),
            ),
          ),
          SizedBox(height: 20.h),
          Text('Email', style: Styles.textStyleGray600M18),
          SizedBox(height: 10.h),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
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
              prefixIcon: Icon(Icons.lock_outline, size: 20.r),
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
                    ? Icon(
                        Icons.visibility_rounded,
                        color: ColorData.primary500Color,
                        size: 20.r,
                      )
                    : Icon(Icons.visibility_off_outlined),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text('Confirm Password', style: Styles.textStyleGray600M18),
          SizedBox(height: 10.h),
          TextFormField(
            obscureText: isHidden,
            controller: passwordConfirmationController,
            validator: (value){
              if (value == null || value.isEmpty) {
                return "Password is required";
              }


              if(value != passwordController.text.trim()){
                return 'Passwords Don\'t Mathc';
              }
              return null;
            },

            decoration: InputDecoration(
              isCollapsed: true,
              hintText: '••••••••',
              prefixIcon: Icon(Icons.lock_outline, size: 20.r),
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
                    ? Icon(
                  Icons.visibility_rounded,
                  color: ColorData.primary500Color,
                  size: 20.r,
                )
                    : Icon(Icons.visibility_off_outlined),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          MainButtonCustom(
            text: 'Signup',
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
