import 'package:flutter/material.dart';
import 'package:mugalim/presentation/main/select_book.dart';
import 'package:mugalim/presentation/main/select_jenre.dart';

import 'core/routes/routes.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => InnLabRouter.generateRoute(settings),
      home: const BookScreen(),
    );
  }
}