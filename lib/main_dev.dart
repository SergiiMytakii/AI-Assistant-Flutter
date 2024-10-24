import 'flavors.dart';

import 'main.dart' as runner;
import 'dart:developer' as developer;

void main() {
  developer.log('This is main.dev');

  F.appFlavor = Flavor.dev;
  runner.main();
}
