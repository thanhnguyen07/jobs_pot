import 'package:auto_route/auto_route.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/emailVerification/email_verification_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/forgotPassword/check_mail_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/forgotPassword/forgot_password_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/login/login_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/onboarding_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/signUp/sign_up_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/splash_screen.dart';
import 'package:jobs_pot/features/chat/persentation/screens/chat_screen.dart';
import 'package:jobs_pot/features/create/presentation/screens/create_screen.dart';
import 'package:jobs_pot/features/home/presentation/screens/home_screen.dart';
import 'package:jobs_pot/features/home_stack/presentation/screens/bottom_navigation_screen.dart';
import 'package:jobs_pot/features/post/presentation/screens/post_screen.dart';
import 'package:jobs_pot/features/profile/presentation/screens/profile_screen.dart';
import 'package:jobs_pot/features/save_job/presentation/screens/save_job_screen.dart';
import 'package:jobs_pot/features/setting/presentation/screens/setting_screen.dart';
import 'package:jobs_pot/routes/route_config.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        ..._authRoutesList,
        _homeStack,
        AutoRoute(
          page: ProfileRoute.page,
          path: ProfileScreen.path,
        ),
        AutoRoute(
          page: SettingRoute.page,
          path: SettingScreen.path,
        )
      ];

  final List<AutoRoute> _authRoutesList = [
    AutoRoute(
      page: SplashRoute.page,
      initial: true,
      path: SplashScreen.path,
    ),
    AutoRoute(
      page: OnboardingRoute.page,
      path: OnboardingScreen.path,
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: LoginScreen.path,
    ),
    AutoRoute(
      page: SignUpRoute.page,
      path: SignUpScreen.path,
    ),
    AutoRoute(
      page: ForgotPasswordRoute.page,
      path: ForgotPasswordScreen.path,
    ),
    AutoRoute(
      page: EmailVerificationRoute.page,
      path: EmailVerificationScreen.path,
    ),
    AutoRoute(
      page: CheckMailRoute.page,
      path: CheckMailScreen.path,
    ),
  ];

  final AutoRoute _homeStack = AutoRoute(
    page: HomeStackRoute.page,
    path: HomeStackScreen.path,
    children: [
      AutoRoute(
        page: HomeRoute.page,
        path: HomeScreen.path,
      ),
      AutoRoute(
        page: PostJobRoute.page,
        path: PostJobScreen.path,
      ),
      AutoRoute(
        page: CreateRoute.page,
        path: CreateScreen.path,
      ),
      AutoRoute(
        page: ChatRoute.page,
        path: ChatScreen.path,
      ),
      AutoRoute(
        page: SaveJobRoute.page,
        path: SaveJobScreen.path,
      ),
    ],
  );
}
