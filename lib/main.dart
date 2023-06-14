import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/config/app_configs.dart';
import 'package:jobs_pot/routes/route_config.dart';
import 'resources/i18n/generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        AppConfigs.appLanguageEn,
        AppConfigs.appLanguageVi
      ],
      path: 'resources/i18n/langs',
      fallbackLocale: AppConfigs.appLanguageEn,
      assetLoader: const CodegenLoader(),
      child: const ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: RouteConfig.router(context),
    );
  }
}
