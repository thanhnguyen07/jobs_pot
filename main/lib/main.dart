import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/config/app_configs.dart';
import 'package:jobs_pot/app_providers.dart';
import 'package:jobs_pot/routes/route_providers.dart';
import 'package:jobs_pot/utils/utils.dart';

late ProviderContainer appProvider;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  appProvider = await appProviderContainer();

  String defaultLanguage = await Utils.localStorage.get.defaultLanguage();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        AppConfigs.appLanguageEn,
        AppConfigs.appLanguageVi
      ],
      startLocale: Locale(defaultLanguage),
      path: AppConfigs.pathLanguage,
      fallbackLocale: AppConfigs.appLanguageEn,
      child: UncontrolledProviderScope(
        container: appProvider,
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
    EasyLoading.instance
      ..userInteractions = false
      ..maskType = EasyLoadingMaskType.none
      ..loadingStyle = EasyLoadingStyle.custom
      ..toastPosition = EasyLoadingToastPosition.bottom
      ..backgroundColor = AppColors.purpleColor
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..progressColor = Colors.white;

    return MaterialApp.router(
      builder: EasyLoading.init(builder: FToastBuilder()),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: appProvider.read(routeControllerProvider)?.config(),
    );
  }
}
