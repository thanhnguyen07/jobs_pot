// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:jobs_pot/features/authentication/presentation/screens/emailVerification/email_verification_screen.dart'
    as _i6;
import 'package:jobs_pot/features/authentication/presentation/screens/forgotPassword/forgot_password_screen.dart'
    as _i2;
import 'package:jobs_pot/features/authentication/presentation/screens/login/login_screen.dart'
    as _i5;
import 'package:jobs_pot/features/authentication/presentation/screens/onboarding_screen.dart'
    as _i4;
import 'package:jobs_pot/features/authentication/presentation/screens/signUp/sign_up_screen.dart'
    as _i3;
import 'package:jobs_pot/features/authentication/presentation/screens/splash_screen.dart'
    as _i2;
import 'package:jobs_pot/features/bottom_bar/presentation/screens/bottom_tab_bar.dart'
    as _i8;
import 'package:jobs_pot/features/create_job/presentation/screens/create.dart'
    as _i10;
import 'package:jobs_pot/features/home/presentation/screens/home_screen.dart'
    as _i7;
import 'package:jobs_pot/features/post/presentation/screens/post.dart' as _i9;
import 'package:jobs_pot/features/save_job/presentation/screens/save_job.dart'
    as _i11;
    as _i7;
import 'package:jobs_pot/features/home/presentation/screens/home_screen.dart'
    as _i1;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    OnboardingRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
  final Map<String, _i8.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
    ForgotPasswordRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ForgotPasswordScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignUpScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.OnboardingScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ForgotPasswordScreen(),
        child: const _i5.LoginScreen(),
      );
    },
    EmailVerificationRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.EmailVerificationScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
    SplashRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashScreen(),
      );
    },
    BottomTabBar.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.BottomTabBar(),
      );
    },
    PostJobRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.PostJobScreen(),
      );
    },
    CreateJobRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.CreateJobScreen(),
      );
    },
    SaveJobRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SaveJobScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.OnboardingScreen]
class OnboardingRoute extends _i12.PageRouteInfo<void> {
  const OnboardingRoute({List<_i12.PageRouteInfo>? children})
/// [_i1.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SplashScreen]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
/// [_i2.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i8.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SignUpScreen]
class SignUpRoute extends _i12.PageRouteInfo<void> {
  const SignUpRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
/// [_i4.OnboardingScreen]
class OnboardingRoute extends _i8.PageRouteInfo<void> {
  const OnboardingRoute({List<_i8.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i12.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.EmailVerificationScreen]
class EmailVerificationRoute extends _i12.PageRouteInfo<void> {
  const EmailVerificationRoute({List<_i12.PageRouteInfo>? children})
      : super(
          EmailVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmailVerificationRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
/// [_i7.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.BottomTabBar]
class BottomTabBar extends _i12.PageRouteInfo<void> {
  const BottomTabBar({List<_i12.PageRouteInfo>? children})
      : super(
          BottomTabBar.name,
          initialChildren: children,
        );

  static const String name = 'BottomTabBar';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PostJobScreen]
class PostJobRoute extends _i12.PageRouteInfo<void> {
  const PostJobRoute({List<_i12.PageRouteInfo>? children})
      : super(
          PostJobRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostJobRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.CreateJobScreen]
class CreateJobRoute extends _i12.PageRouteInfo<void> {
  const CreateJobRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CreateJobRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateJobRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SaveJobScreen]
class SaveJobRoute extends _i12.PageRouteInfo<void> {
  const SaveJobRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SaveJobRoute.name,
          initialChildren: children,
        );

  static const String name = 'SaveJobRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
