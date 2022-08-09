import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mugalim/presentation/auth/screens/verify_phone.dart';
import 'package:mugalim/presentation/main/select_jenre.dart';
import 'package:mugalim/presentation/welcome_screen/screens/info_screen.dart';
import 'core/injection_container.dart';
import 'core/utils/hive/hive_init.dart';
import 'core/routes/routes.dart';
import 'logic/auth/bloc/auth_bloc.dart';

Future<void> main() async {
  await Hive.initFlutter();
  initHiveAdapters();
  await initHiveBoxes();
  initGetIt();
  runApp( MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  var onBoarding = Hive.box('onBoarding');
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => sl(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (settings) => InnLabRouter.generateRoute(settings),
        home: onBoarding.containsKey('show')
            ? VerifyScreen() : IntroScreen(),
      ),

    );
  }
}
