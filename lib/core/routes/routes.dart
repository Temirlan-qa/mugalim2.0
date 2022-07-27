import 'package:flutter/cupertino.dart';


class InnLabRouter {

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final parts = routeSettings.name!.split('?');

    switch (parts[0]) {
    // case RegistrationRoute:
    //   return CupertinoPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => RegistrationScreen(bloc: routeSettings.arguments),
    //   );
      default:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) =>
              CupertinoPageScaffold(
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