import 'package:flutter/cupertino.dart';
import 'package:mugalim/core/routes/routes_const.dart';
import 'package:mugalim/main.dart';
import 'package:mugalim/presentation/books/screens/select_book.dart';

import '../../presentation/books/screens/select_jenre.dart';

class InnLabRouter {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    List list = ['Бизнес', 'Классика', 'Развитие', 'Фантастика'];
    final parts = routeSettings.name!.split('?');

    switch (parts[0]) {
      case MainRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => MyApp(),
        );
      case JenreRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => JenreScreen(
            index_month: (0),
            list: list,
          ),
        );
      // case BookRoute:
      //   return CupertinoPageRoute(
      //     settings: routeSettings,
      //     builder: (_) => BookScreen(
      //       index_month: (routeSettings.arguments as Map),
      //       select_index: (routeSettings.arguments as Map),
      //       list: (routeSettings.arguments as Map),
      //     ),
      //   );
      default:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => CupertinoPageScaffold(
            child: Center(
              child: Text(
                'Ошибка, роут для ${routeSettings.name} не найден',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
    }
  }
}
