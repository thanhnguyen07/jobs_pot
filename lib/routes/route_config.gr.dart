// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:jobs_pot/features/authentication/presentation/screens/emailVerification/email_verification_screen.dart'
    as _i6;
import 'package:jobs_pot/features/authentication/presentation/screens/forgotPassword/check_mail_screen.dart'
    as _i8;
import 'package:jobs_pot/features/authentication/presentation/screens/forgotPassword/forgot_password_screen.dart'
    as _i2;
import 'package:jobs_pot/features/authentication/presentation/screens/login/login_screen.dart'
    as _i5;
import 'package:jobs_pot/features/authentication/presentation/screens/onboarding_screen.dart'
    as _i4;
import 'package:jobs_pot/features/authentication/presentation/screens/signUp/sign_up_screen.dart'
    as _i3;
import 'package:jobs_pot/features/authentication/presentation/screens/splash_screen.dart'
    as _i7;
import 'package:jobs_pot/features/chat/persentation/screens/chat_screen.dart'
    as _i10;
import 'package:jobs_pot/features/create_job/presentation/screens/create_screen.dart'
    as _i11;
import 'package:jobs_pot/features/home/presentation/screens/home_screen.dart'
    as _i1;
import 'package:jobs_pot/features/home_stack/presentation/screens/home_stack_screen.dart'
    as _i12;
import 'package:jobs_pot/features/post/presentation/screens/post_screen.dart'
    as _i9;
import 'package:jobs_pot/features/save_job/presentation/screens/save_job_screen.dart'
    as _i13;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ForgotPasswordScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignUpScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.OnboardingScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginScreen(),
      );
    },
    EmailVerificationRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.EmailVerificationScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashScreen(),
      );
    },
    CheckMailRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.CheckMailScreen(),
      );
    },
    PostJobRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.PostJobScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ChatScreen(),
      );
    },
    CreateJobRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.CreateJobScreen(),
      );
    },
    HomeStackRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.HomeStackScreen(),
      );
    },
    SaveJobRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SaveJobScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i14.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SignUpScreen]
class SignUpRoute extends _i14.PageRouteInfo<void> {
  const SignUpRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i4.OnboardingScreen]
class OnboardingRoute extends _i14.PageRouteInfo<void> {
  const OnboardingRoute({List<_i14.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute({List<_i14.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i6.EmailVerificationScreen]
class EmailVerificationRoute extends _i14.PageRouteInfo<void> {
  const EmailVerificationRoute({List<_i14.PageRouteInfo>? children})
      : super(
          EmailVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmailVerificationRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashScreen]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i8.CheckMailScreen]
class CheckMailRoute extends _i14.PageRouteInfo<void> {
  const CheckMailRoute({List<_i14.PageRouteInfo>? children})
      : super(
          CheckMailRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckMailRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PostJobScreen]
class PostJobRoute extends _i14.PageRouteInfo<void> {
  const PostJobRoute({List<_i14.PageRouteInfo>? children})
      : super(
          PostJobRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostJobRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ChatScreen]
class ChatRoute extends _i14.PageRouteInfo<void> {
  const ChatRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.CreateJobScreen]
class CreateJobRoute extends _i14.PageRouteInfo<void> {
  const CreateJobRoute({List<_i14.PageRouteInfo>? children})
      : super(
          CreateJobRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateJobRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i12.HomeStackScreen]
class HomeStackRoute extends _i14.PageRouteInfo<void> {
  const HomeStackRoute({List<_i14.PageRouteInfo>? children})
      : super(
          HomeStackRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeStackRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SaveJobScreen]
class SaveJobRoute extends _i14.PageRouteInfo<void> {
  const SaveJobRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SaveJobRoute.name,
          initialChildren: children,
        );

  static const String name = 'SaveJobRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}
