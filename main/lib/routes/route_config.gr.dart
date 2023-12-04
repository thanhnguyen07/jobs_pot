// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:jobs_pot/features/authentication/presentation/screens/emailVerification/email_verification_screen.dart'
    as _i7;
import 'package:jobs_pot/features/authentication/presentation/screens/forgotPassword/check_mail_screen.dart'
    as _i4;
import 'package:jobs_pot/features/authentication/presentation/screens/forgotPassword/forgot_password_screen.dart'
    as _i8;
import 'package:jobs_pot/features/authentication/presentation/screens/login/login_screen.dart'
    as _i11;
import 'package:jobs_pot/features/authentication/presentation/screens/onboarding_screen.dart'
    as _i12;
import 'package:jobs_pot/features/authentication/presentation/screens/signUp/sign_up_screen.dart'
    as _i17;
import 'package:jobs_pot/features/authentication/presentation/screens/splash_screen.dart'
    as _i18;
import 'package:jobs_pot/features/chat/persentation/screens/chat_screen.dart'
    as _i3;
import 'package:jobs_pot/features/create/presentation/screens/create_screen.dart'
    as _i5;
import 'package:jobs_pot/features/home/presentation/screens/home_screen.dart'
    as _i9;
import 'package:jobs_pot/features/home_stack/presentation/screens/bottom_navigation_screen.dart'
    as _i10;
import 'package:jobs_pot/features/post/presentation/screens/post_screen.dart'
    as _i13;
import 'package:jobs_pot/features/profile/presentation/screens/edit_profile.dart'
    as _i6;
import 'package:jobs_pot/features/profile/presentation/screens/profile_screen.dart'
    as _i14;
import 'package:jobs_pot/features/save_job/presentation/screens/save_job_screen.dart'
    as _i15;
import 'package:jobs_pot/features/setting/presentation/screens/account_screen.dart'
    as _i1;
import 'package:jobs_pot/features/setting/presentation/screens/change_password_screen.dart'
    as _i2;
import 'package:jobs_pot/features/setting/presentation/screens/setting_screen.dart'
    as _i16;

abstract class $AppRouter extends _i19.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountScreen(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ChangePasswordScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ChatScreen(),
      );
    },
    CheckMailRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CheckMailScreen(),
      );
    },
    CreateRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.CreateScreen(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.EditProfileScreen(),
      );
    },
    EmailVerificationRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.EmailVerificationScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ForgotPasswordScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.HomeScreen(),
      );
    },
    HomeStackRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.HomeStackScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.LoginScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.OnboardingScreen(),
      );
    },
    PostJobRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.PostJobScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ProfileScreen(),
      );
    },
    SaveJobRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SaveJobScreen(),
      );
    },
    SettingRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SettingScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.SignUpScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountScreen]
class AccountRoute extends _i19.PageRouteInfo<void> {
  const AccountRoute({List<_i19.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ChangePasswordScreen]
class ChangePasswordRoute extends _i19.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ChatScreen]
class ChatRoute extends _i19.PageRouteInfo<void> {
  const ChatRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CheckMailScreen]
class CheckMailRoute extends _i19.PageRouteInfo<void> {
  const CheckMailRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CheckMailRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckMailRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CreateScreen]
class CreateRoute extends _i19.PageRouteInfo<void> {
  const CreateRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CreateRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i6.EditProfileScreen]
class EditProfileRoute extends _i19.PageRouteInfo<void> {
  const EditProfileRoute({List<_i19.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i7.EmailVerificationScreen]
class EmailVerificationRoute extends _i19.PageRouteInfo<void> {
  const EmailVerificationRoute({List<_i19.PageRouteInfo>? children})
      : super(
          EmailVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmailVerificationRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i19.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i9.HomeScreen]
class HomeRoute extends _i19.PageRouteInfo<void> {
  const HomeRoute({List<_i19.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i10.HomeStackScreen]
class HomeStackRoute extends _i19.PageRouteInfo<void> {
  const HomeStackRoute({List<_i19.PageRouteInfo>? children})
      : super(
          HomeStackRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeStackRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i11.LoginScreen]
class LoginRoute extends _i19.PageRouteInfo<void> {
  const LoginRoute({List<_i19.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i12.OnboardingScreen]
class OnboardingRoute extends _i19.PageRouteInfo<void> {
  const OnboardingRoute({List<_i19.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i13.PostJobScreen]
class PostJobRoute extends _i19.PageRouteInfo<void> {
  const PostJobRoute({List<_i19.PageRouteInfo>? children})
      : super(
          PostJobRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostJobRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ProfileScreen]
class ProfileRoute extends _i19.PageRouteInfo<void> {
  const ProfileRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SaveJobScreen]
class SaveJobRoute extends _i19.PageRouteInfo<void> {
  const SaveJobRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SaveJobRoute.name,
          initialChildren: children,
        );

  static const String name = 'SaveJobRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SettingScreen]
class SettingRoute extends _i19.PageRouteInfo<void> {
  const SettingRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i17.SignUpScreen]
class SignUpRoute extends _i19.PageRouteInfo<void> {
  const SignUpRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i18.SplashScreen]
class SplashRoute extends _i19.PageRouteInfo<void> {
  const SplashRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}