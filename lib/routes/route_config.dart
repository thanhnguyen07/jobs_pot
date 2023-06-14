import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/login_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/onboarding_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/splash_screen.dart';

class RouteConfig {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static RouteObserver<ModalRoute<void>> routeObserver =
      RouteObserver<ModalRoute<void>>();

  static GoRouter router(BuildContext context) {
    return GoRouter(
      initialLocation: '/${SplashScreen.route}',
      navigatorKey: rootNavigatorKey,
      routes: [
        GoRoute(
          name: SplashScreen.route,
          path: "/${SplashScreen.route}",
          builder: (BuildContext context, GoRouterState state) {
            return const SplashScreen();
          },
        ),
        GoRoute(
          name: OnboardingScreen.route,
          path: "/${OnboardingScreen.route}",
          builder: (BuildContext context, GoRouterState state) {
            return const OnboardingScreen();
          },
        ),
        GoRoute(
          name: LoginScreen.route,
          path: "/${LoginScreen.route}",
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
      ],
      observers: [
        routeObserver,
      ],
      redirect: (context, state) {
        final loggedIn = authStateListenable.value;

        if (loggedIn == null) {
          return '/${SplashScreen.route}';
        }

        return null;
      },
      refreshListenable: authStateListenable,
      debugLogDiagnostics: true,
    );
  }
}
