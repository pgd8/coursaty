import 'package:coursaty/Core/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class Validators {
  //name validator
  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.kNameRequired.tr();
    }
    return null;
  }

  //email validator
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.kEmailRequired.tr();
    }
    if (!EmailValidator.validate(value)) {
      return LocaleKeys.kInvalidEmail.tr();
    }
    return null;
  }

  //phone number validator
  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.kPhoneNumberRequired.tr();
    }
    final phoneRegex = RegExp(r'^[0-9]{10,15}$');

    if (value.length != 11 || !phoneRegex.hasMatch(value)) {
      return LocaleKeys.kInvalidPhoneNumber.tr();
    }
    return null;
  }

  //password validator
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.kPasswordRequired.tr();
    }

    if (value.length < 8) {
      return LocaleKeys.kPasswordMustBeAtLeast8Characters.tr();
    }

    final passwordRegex = RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>]).+$');

    if (!passwordRegex.hasMatch(value)) {
      return LocaleKeys.kPasswordShouldContainAtLeast1SpecialCharacter.tr();
    }
    return null;
  }

  //confirmPassword validator
  static String? confirmPassword(
    String? value,
    TextEditingController passwordController,
  ) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.kConfirmPasswordRequired.tr();
    }
    if (value != passwordController.text.trim()) {
      return LocaleKeys.kPasswordsDoNotMatch.tr();
    }
    return null;
  }
}
