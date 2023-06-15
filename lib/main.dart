import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_pot/config/app_configs.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/login_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/onboarding_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/splash_screen.dart';
import 'package:jobs_pot/resources/i18n/generated/codegen_loader.g.dart';
import 'package:jobs_pot/routes/route_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        AppConfigs.appLanguageEn,
        AppConfigs.appLanguageVi
      ],
      path: 'lib/resources/i18n/langs',
      fallbackLocale: AppConfigs.appLanguageEn,
      assetLoader: const CodegenLoader(),
      child: ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _route = GoRouter(
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: routeConfig,
    );
  }
}
