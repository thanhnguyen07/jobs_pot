import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/splash_screen.dart';

class RouteConfig {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  /// Route observer to use with RouteAware
  static RouteObserver<ModalRoute<void>> routeObserver =
      RouteObserver<ModalRoute<void>>();

  static GoRouter router(BuildContext context) {
    return GoRouter(
      initialLocation: '/${SplashScreen.route}',
      navigatorKey: rootNavigatorKey,
      routes: [
        GoRoute(
            path: '/${SplashScreen.route}',
            builder: (BuildContext context, GoRouterState state) {
              return const SplashScreen();
            }),
      ],
      observers: [
        routeObserver,
      ],
      // redirect: (context, state) {
      //   final loggedIn = authStateListenable.value;

      //   if (loggedIn == null) {
      //     return null;
      //   }

      //   final isInLogin =
      //       state.matchedLocation.contains('/${LoginScreen.route}');
      // final isInLiveMapScreen =
      //     state.matchedLocation.contains('/${LiveMapScreen.route}');
      // final isInSchedulesScreen =
      //     state.matchedLocation.contains('/${SchedulesScreen.route}');
      // appContainer
      //     ?.read(mainLiveMapNavigationNotifier.notifier)
      //     .setIsSelected(isInLiveMapScreen);

      // appContainer
      //     ?.read(mainSchedulesNavigationNotifier.notifier)
      //     .setIsSelected(isInSchedulesScreen);

      //   final isInSplash =
      //       state.matchedLocation.contains('/${SplashScreen.route}');
      //   if (!loggedIn) {
      //     return '/${LoginScreen.route}';
      //   }
      //   if (loggedIn && (isInLogin || isInSplash)) {
      //     return '/${HomeScreen.route}';
      //   }
      //   return null;
      // },
      // refreshListenable: authStateListenable,
      debugLogDiagnostics: true,
    );
  }
}
