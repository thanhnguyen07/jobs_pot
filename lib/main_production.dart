import 'flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  FLAVER.appFlavor = Flavor.production;
  runner.main();
}
