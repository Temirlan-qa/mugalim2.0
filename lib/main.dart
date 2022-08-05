import 'package:flutter/material.dart';
import 'package:mugalim/presentation/main/select_jenre.dart';
import 'package:mugalim/presentation/welcome_screen/screens/info_screen.dart';
import 'core/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => InnLabRouter.generateRoute(settings),
      home: IntroScreen(),
    );
  }
}
