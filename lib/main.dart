import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mugalim/presentation/auth/screens/verify_phone.dart';
import 'package:mugalim/presentation/main/select_jenre.dart';
import 'package:mugalim/presentation/welcome_screen/screens/info_screen.dart';
import 'core/utils/hive/hive_init.dart';
import 'core/routes/routes.dart';

Future<void> main() async {
  await Hive.initFlutter();
  initHiveAdapters();
  await initHiveBoxes();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  var onBoarding = Hive.box('onBoarding');
  @override
  Widget build(BuildContext context) {
    List list = ['Бизнес', 'Классика', 'Развитие', 'Фантастика'];
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: (settings) => InnLabRouter.generateRoute(settings),
          home: onBoarding.containsKey('show')
              ? VerifyScreen() : IntroScreen(),
    );
  }
}
