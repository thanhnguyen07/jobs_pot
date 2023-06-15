import 'package:auto_route/auto_route.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/login_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/onboarding_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/splash_screen.dart';
import 'package:jobs_pot/routes/route_config.gr.dart';

// part 'app_router.gr.dart';

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
      ];
}
