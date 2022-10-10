import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mugalim/core/routes/routes_const.dart';
import 'package:mugalim/logic/profile/bloc/profile_bloc.dart';
import 'package:mugalim/presentation/books/screens/bookMain/book_description.dart';
import 'package:mugalim/presentation/books/screens/my_review.dart';
import 'package:mugalim/presentation/development/screens/development_screen.dart';
import '../../logic/book/bloc/book_bloc.dart';
import 'package:mugalim/presentation/auth/screens/verify_phone.dart';
import 'package:mugalim/presentation/profile/screens/aboutApplication_screen.dart';
import 'package:mugalim/presentation/profile/screens/aboutProject_screen.dart';
import 'package:mugalim/presentation/profile/screens/settings_screen.dart';
import 'package:mugalim/presentation/profile/screens/write_review_screen.dart';
import '../../logic/home/bloc/home_bloc.dart';
import '../../presentation/books/screens/bookMain/main_book_screen.dart';
import '../../presentation/books/screens/bookMain/readBooks_screen.dart';
import '../../presentation/books/screens/bookMain/timer_screen.dart';
import '../../presentation/books/screens/selectBook/select_book.dart';
import '../../presentation/books/screens/selectBook/select_jenre.dart';
import '../../presentation/books/widgets/grid_widget_forMychoice.dart';
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
          builder: (_) =>
              MultiBlocProvider(
                  providers: [
                    BlocProvider<HomeBloc>(
                      create: (_) =>
                      sl<HomeBloc>()
                        ..add(GetPostsList()),
                    ),
                  ],
                  child: const MainScreen()
              ),
        );
      case MainRouteFromTimer:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) =>
              MultiBlocProvider(
                  providers: [
                    BlocProvider<HomeBloc>(
                      create: (_) =>
                      sl<HomeBloc>()
                        ..add(GetPostsList()),
                    ),
                  ],
                  child: const MainScreen(currentIndex: 1,)
              ),
        );
      case JenreRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => GenreScreen(
            indexMonth: (0),
            list: list,
            choiceList:  [],
            addList:  [0,1,2,3],
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
          builder: (_) => BlocProvider(
            create: (context) => sl<BookBloc>()..add(GetDeadline()),
            child: const DevelopmentScreen(),
          ),
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
                create: (context) =>
                sl<BookBloc>()
                  ..add(GetBookList((routeSettings.arguments as Map)['id'])),
                child: SelectBookScreen(
                  indexMonth: (routeSettings.arguments as Map)['indexMonth'],
                  choiceList: (routeSettings.arguments as Map)['choiceList'],
                  addList: (routeSettings.arguments as Map)['addList'],
                  selectIndex: (routeSettings.arguments as Map)['selectIndex'],
                  list: (routeSettings.arguments as Map)['list'],
                  id: (routeSettings.arguments as Map)['id'],
                ),
              ),
        );
      case TimerRoute:
        return CupertinoPageRoute(
            settings: routeSettings,
            builder: (_) => BlocProvider(
                  create: (context) =>
                      sl<BookBloc>()..add(GetDeadline()),
                  child: const TimerScreen(),
                ));
      case AboutProjectRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => const AboutProjectScreen(),
        );
      case MyChoiceRoute:
        return CupertinoPageRoute(
            settings: routeSettings,
            builder: (_) => BlocProvider(
              create: (context) =>
              sl<BookBloc>()..add(GetMyChoice()),
              child: const GridWidgetMyChoice(),
            )
        );
      case WriteReviewRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => const WriteReviewScreen(),
        );
    //  SettingsRoute
      case SettingsRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => BlocProvider(
            create: (context) => sl<ProfileBloc>()..add(ProfileInfoEdit()),
            child: SettingsScreen(
            ),
          ),
        );
      case AboutAppRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => const AboutApplicationScreen(),
        );
      case AuthRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => const VerifyScreen(),
        );
      case ReadBooksRoute:
        return CupertinoPageRoute(
            settings: routeSettings,
            builder: (_) => BlocProvider(
              create: (context) =>
              sl<BookBloc>()..add(GetMyReadBookList()),
              child: const ReadBooks(),
            ));
      case MyBookReviewRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => MyReviewScreen(
            id : (routeSettings.arguments as Map)['id'],),
        );
      case BookDescriptionRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) =>
              BookDescriptionScreen(
                img: (routeSettings.arguments as Map)['img'],
                textMonth: (routeSettings.arguments as Map)['textMonth'],
                name: (routeSettings.arguments as Map)['name'],
                authors: (routeSettings.arguments as Map)['authors'],
                haveDay: (routeSettings.arguments as Map)['haveDay'],
                description: (routeSettings.arguments as Map)['description'],
                id: (routeSettings.arguments as Map)['id'],
                haveReviewAndFinishedContainer: (routeSettings.arguments as Map)['haveReviewAndFinishedContainer'],
              ),
        );
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
