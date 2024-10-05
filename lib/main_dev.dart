import 'package:my_template/injection.dart';

import 'flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  configureDependencies(Flavor.dev.name);
  F.appFlavor = Flavor.dev;
  await runner.main();
}
