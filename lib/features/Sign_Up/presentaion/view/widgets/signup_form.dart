import 'package:coursaty/Core/Routing/routes.dart';
import 'package:coursaty/Core/Shared_Widgets/dialogs/show_error_dialog.dart';
import 'package:coursaty/Core/Shared_Widgets/main_button_custom.dart';
import 'package:coursaty/Core/Themes/color_data.dart';
import 'package:coursaty/Core/Themes/style_data.dart';
import 'package:coursaty/Core/Validations/validators.dart';
import 'package:coursaty/Core/locale_keys.g.dart';
import 'package:coursaty/features/Sign_Up/presentaion/manager/signup_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../manager/signup_cubit.dart';

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
    return BlocConsumer<SignupCubit, SignupState>(
      builder: (context, state) {
        final cubit = context.read<SignupCubit>();
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(LocaleKeys.kName.tr(), style: Styles.textStyleGray600M18),
              SizedBox(height: 10.h),
              TextFormField(
                validator: Validators.name,
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
              Text(LocaleKeys.kEmail.tr(), style: Styles.textStyleGray600M18),
              SizedBox(height: 10.h),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: Validators.email,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'example@email.com',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                LocaleKeys.kPassword.tr(),
                style: Styles.textStyleGray600M18,
              ),
              SizedBox(height: 10.h),
              TextFormField(
                obscureText: isHidden,
                controller: passwordController,
                validator: Validators.password,
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
                        ? Icon(Icons.visibility_rounded, size: 20.r)
                        : Icon(Icons.visibility_off_outlined),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                LocaleKeys.kConfirmPassword.tr(),
                style: Styles.textStyleGray600M18,
              ),
              SizedBox(height: 10.h),
              TextFormField(
                obscureText: isHidden,
                controller: passwordConfirmationController,
                validator: (value) =>
                    Validators.confirmPassword(value, passwordController),
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
                        ? Icon(Icons.visibility_rounded, size: 20.r)
                        : Icon(Icons.visibility_off_outlined),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              MainButtonCustom(
                text: LocaleKeys.kSignup.tr(),
                color: ColorData.primary500Color,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    cubit.createAccount(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is SuccessSignUpState) {
          context.go(Routes.kLogin);
        }
        if (state is ErrorSignUpState) {
          showErrorDialog(context: context, message: state.message);
        }
      },
    );
  }
}
