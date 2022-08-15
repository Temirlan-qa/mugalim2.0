import 'package:hive/hive.dart';

initHiveAdapters() {
  // Hive.registerAdapter(AddressesModelAdapter());
}

initHiveBoxes() async {
  await Hive.openBox('onBoarding');
  await Hive.openBox('pinCode');
  await Hive.openBox('tokens');
}
