import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/routes/routes.dart';
import 'package:mugalim/logic/home/bloc/home_bloc.dart';
import 'package:mugalim/logic/profile/bloc/profile_bloc.dart';
import 'package:mugalim/presentation/development/screens/development_screen.dart';
import 'package:mugalim/presentation/home/screens/home_screen.dart';
import 'package:mugalim/presentation/main/widgets/nav_bar_item_widget.dart';
import 'package:mugalim/presentation/profile/screens/profile_screen.dart';
import 'package:mugalim/presentation/rating/screens/rating_screen.dart';
import 'package:mugalim/presentation/timetable/screens/timetable_screen.dart';

import '../../../core/injection_container.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentView = 0;

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    return Stack(
      children: [
        Scaffold(
            backgroundColor: brightness == Brightness.dark
                ? ColorStyles.darkthemePageBackgroundColor
                : Colors.white,
            body: IndexedStack(
              index: _currentView,
              children: <Widget>[
                CupertinoTabView(
                  navigatorKey: Get.nestedKey(0),
                  navigatorObservers: [GetObserver((_) {}, Get.routing)],
                  onGenerateRoute: (settings) =>
                      InnLabRouter.generateRoute(settings),
                  // builder: (_) => HomeScreen(),
                  builder: (_) => HomeScreen(),
                ),
                CupertinoTabView(
                  navigatorKey: Get.nestedKey(1),
                  navigatorObservers: [GetObserver((_) {}, Get.routing)],
                  onGenerateRoute: (settings) =>
                      InnLabRouter.generateRoute(settings),
                  builder: (_) => const DevelopmentScreen(),
                ),
                CupertinoTabView(
                  navigatorKey: Get.nestedKey(2),
                  navigatorObservers: [GetObserver((_) {}, Get.routing)],
                  onGenerateRoute: (settings) =>
                      InnLabRouter.generateRoute(settings),
                  builder: (_) => const TimetableScreen(),
                ),
                CupertinoTabView(
                  navigatorKey: Get.nestedKey(3),
                  navigatorObservers: [GetObserver((_) {}, Get.routing)],
                  onGenerateRoute: (settings) =>
                      InnLabRouter.generateRoute(settings),
                  builder: (_) => const RatingScreen(),
                ),
                CupertinoTabView(
                  navigatorKey: Get.nestedKey(4),
                  navigatorObservers: [GetObserver((_) {}, Get.routing)],
                  onGenerateRoute: (settings) =>
                      InnLabRouter.generateRoute(settings),
                  builder: (_) => BlocProvider(
                    create: (context) => sl<ProfileBloc>()..add(ProfileLoad()),
                    child: ProfileScreen(
                    ),
                  ),
                )
              ],
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: brightness == Brightness.dark
                    ? ColorStyles.darkthemePageBackgroundColor
                    : Colors.white,
                border: Border(
                    top: BorderSide(width: 0.5, color: Color(0xffE2E3E4))),
                boxShadow: [
                  BoxShadow(
                    color: brightness == Brightness.dark
                        ? ColorStyles.darkthemePageBackgroundColor
                        : Colors.white,
                    spreadRadius: 0,
                    blurRadius: 0,
                    offset: Offset(0, 0.5), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(

                child: CupertinoTabBar(
                  backgroundColor: brightness == Brightness.dark ? ColorStyles.darkthemePageBackgroundColor: Colors.white,
                  border: Border(top: BorderSide(color: Colors.transparent)),
                  onTap: (int index) {
                    setState(() {
                      _currentView = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: NavBarItemWidget(
                        'assets/icons/feed.svg', _currentView, 'Главная',
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: NavBarItemWidget(
                          'assets/icons/zap.svg', _currentView, 'Развитие'),

                    ),
                    BottomNavigationBarItem(
                      icon: NavBarItemWidget('assets/icons/mcalendar.svg',
                          _currentView, 'Расписание'),

                    ),
                    BottomNavigationBarItem(
                      icon: NavBarItemWidget(
                          'assets/icons/arrow-up-circle.svg',
                          _currentView,
                          'Рейтинг'),

                    ),
                    BottomNavigationBarItem(
                      icon: NavBarItemWidget(
                          'assets/icons/user.svg', _currentView, 'Профиль'),

                    ),
                  ],
                ),
              ),
              ),
            ),
      ],
    );
  }
}
