import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mugalim/core/routes/routes_const.dart';
import 'package:mugalim/logic/profile/bloc/profile_bloc.dart';
import 'package:mugalim/main.dart';
import 'package:mugalim/presentation/books/screens/myChoice.dart';
import 'package:mugalim/presentation/books/screens/select_book.dart';
import 'package:mugalim/presentation/development/screens/development_screen.dart';
import 'package:mugalim/presentation/home/screens/home_screen.dart';
import 'package:mugalim/presentation/profile/screens/aboutApplication_screen.dart';

import '../../logic/home/bloc/home_bloc.dart';
import '../../presentation/books/screens/select_jenre.dart';
import '../../presentation/cources/screens/coursePage.dart';
import '../../presentation/main/widgets/main_screen.dart';
import '../injection_container.dart';

class InnLabRouter {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    List list = ['Бизнес', 'Классика', 'Развитие', 'Фантастика'];
    final parts = routeSettings.name!.split('?');

    switch (parts[0]) {
      case MainRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider<HomeBloc>(
              create: (_) => sl<HomeBloc>()..add(HomeLoad()),
            ),
            BlocProvider<HomeBloc>(
              create: (_) => sl<HomeBloc>()..add(HomeLoad()),
            ),
            BlocProvider<HomeBloc>(
              create: (_) => sl<HomeBloc>()..add(HomeLoad()),
            ),
            BlocProvider<HomeBloc>(
              create: (_) => sl<HomeBloc>()..add(HomeLoad()),
            ),
            BlocProvider<HomeBloc>(
              create: (_) => sl<HomeBloc>()..add(HomeLoad()),
            ),
          ], child: MainScreen()),
        );
      case JenreRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => JenreScreen(
            index_month: (0),
            list: list,
          ),
        );
      case CourseRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => CoursePage(),
        );
      case DevelopmentRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => DevelopmentScreen(),
        );
      case ChoiceRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => MyChoiceScreen(),
        );
      case AboutApp:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => AboutApplicationScreen(),
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
