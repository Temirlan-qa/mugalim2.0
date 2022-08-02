import 'package:flutter/material.dart';
import 'package:mugalim/presentation/main/photo_slider_screen.dart';
import 'package:mugalim/presentation/main/select_jenre.dart';
import 'package:mugalim/presentation/main/info_screen.dart';
import 'core/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: PhotoSliderScreen(),
      // home: JenreScreen(
      //   index_month: 0,
      //   list: list,
      // ),
    );
  }
}
