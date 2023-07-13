import 'package:auto_route/auto_route.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/emailVerification/email_verification_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/forgotPassword/check_mail_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/forgotPassword/forgot_password_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/login/login_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/onboarding_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/signUp/sign_up_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/splash_screen.dart';
import 'package:jobs_pot/features/chat/persentation/screens/chat_screen.dart';
import 'package:jobs_pot/features/create_job/presentation/screens/create_screen.dart';
import 'package:jobs_pot/features/home/presentation/screens/home_screen.dart';
import 'package:jobs_pot/features/home_stack/presentation/screens/home_stack_screen.dart';
import 'package:jobs_pot/features/post/presentation/screens/post_screen.dart';
import 'package:jobs_pot/features/save_job/presentation/screens/save_job_screen.dart';
import 'package:jobs_pot/routes/route_config.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
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
        AutoRoute(
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
              page: CreateJobRoute.page,
              path: CreateJobScreen.path,
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
        ),
      ];
}
