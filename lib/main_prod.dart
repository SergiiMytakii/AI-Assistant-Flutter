import 'package:my_template/injection.dart';

import 'flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  configureDependencies(Flavor.prod.name);
  F.appFlavor = Flavor.prod;
  await runner.main();
}
