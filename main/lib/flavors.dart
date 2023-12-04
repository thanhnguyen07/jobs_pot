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
        return 'https://server-jobs-pot.vercel.app/';
      case Flavor.dev:
        return 'http://localhost:7002/';
      default:
        return 'https://server-jobs-pot.vercel.app/';
    }
  }
}
