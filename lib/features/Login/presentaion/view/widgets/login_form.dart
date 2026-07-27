import 'package:coursaty/Core/Routing/routes.dart';
import 'package:coursaty/Core/Shared_Widgets/dialogs/show_error_dialog.dart';
import 'package:coursaty/Core/Validations/validators.dart';
import 'package:coursaty/Core/locale_keys.g.dart';
import 'package:coursaty/Core/Shared_Widgets/main_button_custom.dart';
import 'package:coursaty/Core/Themes/color_data.dart';
import 'package:coursaty/Core/Themes/style_data.dart';
import 'package:coursaty/features/Login/presentaion/manager/login_cubit.dart';
import 'package:coursaty/features/Login/presentaion/manager/login_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        return Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(LocaleKeys.kEmail.tr(), style: Styles.textStyleGray600M18),
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  validator: Validators.email,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'example@email.com',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                SizedBox(height: 13.h),
                Text(
                  LocaleKeys.kPassword.tr(),
                  style: Styles.textStyleGray600M18,
                ),
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
                          ? Icon(
                              Icons.visibility_rounded,
                              color: ColorData.primary500Color,
                              size: 20.r,
                            )
                          : Icon(Icons.visibility_off_outlined),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                MainButtonCustom(
                  text: LocaleKeys.kLogin.tr(),
                  color: ColorData.primary500Color,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      cubit.login(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is SuccessLoginState) {
          context.go(Routes.kHome);
        }
        if (state is ErrorLoginState) {
          showErrorDialog(context: context, message: state.message);
        }
      },
    );
  }
}
