// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "splashTitle": "Jobspot",
  "onboardingTitle1": "Find Your",
  "onboardingTitle2": "Dream Job",
  "onboardingTitle3": "Here!",
  "onboardingSubTitle": "Explore all the most exciting job roles based on your interest and study major.",
  "authenticationLoginTitle": "Welcome Back",
  "authenticationEmailInputTitle": "Email",
  "authenticationPasswordInputTitle": "Password",
  "authenticationRememberMe": "Remember me",
  "authenticationForgotPassword": "Forgot Password?",
  "authenticationLoginButtonTitle": "Login",
  "authenticationGoogleButtonTitle": "You don't have an account yet?",
  "authenticationSignUpButtonTitle": "Sign up"
};
static const Map<String,dynamic> vi = {
  "splashTitle": "Jobspot",
  "onboardingTitle1": "Tìm",
  "onboardingTitle2": "Công Việc Mơ Ước",
  "onboardingTitle3": "Của Bạn Ở Đây!",
  "onboardingSubTitle": "Khám phá tất cả các vai trò công việc thú vị nhất dựa trên sở thích và chuyên ngành học của bạn.",
  "authenticationLoginTitle": "Chào mừng trở lại",
  "authenticationEmailInputTitle": "Email",
  "authenticationPasswordInputTitle": "Mật khẩu",
  "authenticationRememberMe": "Ghi nhớ đăng nhập",
  "authenticationForgotPassword": "Quên mật khẩu?",
  "authenticationLoginButtonTitle": "Đăng nhập",
  "authenticationGoogleButtonTitle": "Đăng nhập với Google",
  "authenticationSuggestionsSignUp": "Bạn chưa có tài khoản?",
  "authenticationSignUpButtonTitle": "Đăng ký"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "vi": vi};
}
