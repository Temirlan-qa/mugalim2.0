import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mugalim/core/routes/routes_const.dart';
import 'package:mugalim/presentation/books/screens/selectBook/myChoice.dart';
import 'package:mugalim/presentation/development/screens/development_screen.dart';
import '../../logic/book/bloc/book_bloc.dart';
import '../../logic/home/bloc/home_bloc.dart';
import '../../presentation/books/screens/bookMain/main_book_screen.dart';
import '../../presentation/books/screens/selectBook/select_book.dart';
import '../../presentation/books/screens/selectBook/select_jenre.dart';
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
          builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider<HomeBloc>(
                  create: (_) => sl<HomeBloc>()..add(GetPostsList()),
                ),
              ],
              child: const MainScreen()
          ),
        );
      case JenreRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => JenreScreen(
            indexMonth: (0),
            list: list,
          ),
        );
      case CourseRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => const CoursePage(),
        );
      case DevelopmentRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => const DevelopmentScreen(),
        );
      case ChoiceRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => const MyChoiceScreen(),
        );
      case MainBookRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => const BookScreen(),
        );
      case SelectBookRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) =>
              BlocProvider(
                create: (context) => sl<BookBloc>()..add(GetBookList((routeSettings.arguments as Map)['id'])),
                child: SelectBookScreen(indexMonth: (routeSettings.arguments as Map)['indexMonth'],list: (routeSettings.arguments as Map)['list'], selectIndex: (routeSettings.arguments as Map)['selectIndex'],selectId: (routeSettings.arguments as Map)['selectId'],),
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
