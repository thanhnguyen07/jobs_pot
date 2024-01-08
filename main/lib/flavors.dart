import 'package:jobs_pot/config/app_configs.dart';

enum Flavor {
  production,
  dev,
}

class FLAVER {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.production:
        return 'Jobs Post';
      case Flavor.dev:
        return 'Jobs Post Dev';
      default:
        return 'title';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.production:
        return AppConfigs.productionUrl;
      case Flavor.dev:
        return AppConfigs.localUrl;
      default:
        return AppConfigs.productionUrl;
    }
  }
}
