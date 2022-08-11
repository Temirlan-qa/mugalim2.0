import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/routes/routes.dart';
import 'package:mugalim/presentation/auth/screens/verify_phone.dart';
import 'package:mugalim/presentation/home/home.dart';
import 'package:mugalim/presentation/main/widgets/nav_bar_item_widget.dart';
import 'package:mugalim/presentation/welcome_screen/screens/info_screen.dart';

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
            backgroundColor: brightness == Brightness.dark ? ColorStyles.darkthemePageBackgroundColor: Colors.white,
            body: IndexedStack(
              index: _currentView,
              children: <Widget>[
                CupertinoTabView(
                  navigatorKey: Get.nestedKey(0),
                  navigatorObservers: [GetObserver((_) {}, Get.routing)],
                  onGenerateRoute: (settings) =>
                      InnLabRouter.generateRoute(settings),
                  builder: (_) => HomeScreen(),
                ),
                CupertinoTabView(
                  navigatorKey: Get.nestedKey(1),
                  navigatorObservers: [GetObserver((_) {}, Get.routing)],
                  onGenerateRoute: (settings) => InnLabRouter.generateRoute(settings),
                  builder: (_) => VerifyScreen(),
                ),
                CupertinoTabView(
                    navigatorKey: Get.nestedKey(2),
                    navigatorObservers: [GetObserver((_) {}, Get.routing)],
                    onGenerateRoute: (settings) => InnLabRouter.generateRoute(settings),
                  builder: (_) => IntroScreen(),
                ),
                CupertinoTabView(
                  navigatorKey: Get.nestedKey(3),
                  navigatorObservers: [GetObserver((_) {}, Get.routing)],
                  onGenerateRoute: (settings) =>
                      InnLabRouter.generateRoute(settings),
                  builder: (_) => HomeScreen(),
                ),
                CupertinoTabView(
                  navigatorKey: Get.nestedKey(4),
                  navigatorObservers: [GetObserver((_) {}, Get.routing)],
                  onGenerateRoute: (settings) => InnLabRouter.generateRoute(settings),
                  builder: (_) => HomeScreen(),
                )
              ],
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: brightness == Brightness.dark ? ColorStyles.darkthemePageBackgroundColor: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: 0.5,
                        color: Color(0xffE2E3E4)
                    )
                ),
                boxShadow: [
                  BoxShadow(
                    color: brightness == Brightness.dark ? ColorStyles.darkthemePageBackgroundColor: Colors.white,
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
                          'assets/icons/feed.svg',  _currentView, 'feed'),
                    ),
                    BottomNavigationBarItem(
                      icon: NavBarItemWidget(
                          'assets/icons/zap.svg', _currentView, 'zap'),
                    ),
                    BottomNavigationBarItem(
                      icon: NavBarItemWidget(
                          'assets/icons/mcalendar.svg', _currentView, 'mcalendar'),
                    ),
                    BottomNavigationBarItem(
                        icon: NavBarItemWidget(
                            'assets/icons/arrow-up-circle.svg', _currentView, 'arrow-up-circle')
                    ),
                    BottomNavigationBarItem(
                        icon: NavBarItemWidget(
                            'assets/icons/user.svg', _currentView, 'user')
                    ),
                  ],
                ),
              ),
            )
        ),
      ],
    );
  }
}