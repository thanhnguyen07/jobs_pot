import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/login_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/onboarding_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/splash_screen.dart';

final routeConfig = GoRouter(
  initialLocation: '/${SplashScreen.route}',
  navigatorKey: GlobalKey<NavigatorState>(),
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
    RouteObserver<ModalRoute<void>>(),
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
