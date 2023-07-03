import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/config/app_configs.dart';
import 'package:jobs_pot/config/providers.dart';
import 'package:jobs_pot/routes/route_providers.dart';

late ProviderContainer appContainer;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  appContainer = await appProviderContainer();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        AppConfigs.appLanguageEn,
        AppConfigs.appLanguageVi
      ],
      path: AppConfigs.pathLanguage,
      fallbackLocale: AppConfigs.appLanguageEn,
      child: UncontrolledProviderScope(
        container: appContainer,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    EasyLoading.instance.maskType = EasyLoadingMaskType.black;
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.light;

    return MaterialApp.router(
      builder: EasyLoading.init(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: appContainer.read(routeControllerProvider)?.config(),
    );
  }
}
