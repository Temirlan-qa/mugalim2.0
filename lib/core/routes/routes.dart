import 'package:flutter/cupertino.dart';
import 'package:mugalim/core/routes/routes_const.dart';
import 'package:mugalim/main.dart';
import 'package:mugalim/presentation/main/select_book.dart';
import 'package:mugalim/presentation/main/select_jenre.dart';

class InnLabRouter {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
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
            index_month: routeSettings.arguments as dynamic,
            list: routeSettings.arguments as dynamic,
          ),
        );
      case BookRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => BookScreen(
            index_month: routeSettings.arguments as dynamic,
            select_index: routeSettings.arguments as dynamic,
            list: routeSettings.arguments as dynamic,
          ),
        );
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
