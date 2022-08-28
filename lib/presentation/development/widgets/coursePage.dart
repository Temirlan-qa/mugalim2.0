import 'dart:core';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/const/const_color.dart';
import '../../../core/routes/routes.dart';
import 'coursePageDetailed.dart';
import 'coursePage_myCourses.dart';
import 'courseWidget.dart';



class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);


  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    return Stack(children: [
      Scaffold(
        backgroundColor: brightness == Brightness.dark
            ? ColorStyles.darkthemePageBackgroundColor
            : Colors.white,
        body: IndexedStack(
          index: currentPage,
          children: <Widget>[
            CupertinoTabView(
              navigatorKey: Get.nestedKey(5),
              navigatorObservers: [GetObserver((_) {}, Get.routing)],
              onGenerateRoute: (settings) =>
                  InnLabRouter.generateRoute(settings),
              builder: (_) => CoursePageDetailed(devScreenContext: context),
            ),
            CupertinoTabView(
              navigatorKey: Get.nestedKey(6),
              navigatorObservers: [GetObserver((_) {}, Get.routing)],
              onGenerateRoute: (settings) =>
                  InnLabRouter.generateRoute(settings),
              builder: (_) => CourseMyCourses(devScreenContext: context),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: brightness == Brightness.dark
                ? ColorStyles.darkthemePageBackgroundColor
                : Colors.white,
            border: const Border(top: BorderSide(width: 0.5, color: Color(0xffE2E3E4))),
            boxShadow: [
              BoxShadow(
                color: brightness == Brightness.dark
                    ? ColorStyles.darkthemePageBackgroundColor
                    : Colors.white,
                spreadRadius: 0,
                blurRadius: 0,
                offset: const Offset(0, 0.5), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            child: CupertinoTabBar(
                backgroundColor: brightness == Brightness.dark ? ColorStyles.darkthemePageBackgroundColor: Colors.white,
                border: const Border(top: BorderSide(color: Colors.transparent)),
                  onTap: (int index) {
                    setState(() {
                      currentPage = index;
                      print(currentPage);
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                    icon: NavBarItemWidget(
                      'assets/icons/Icon.svg', currentPage, 'Главная',
                    ),
                  ),
                    BottomNavigationBarItem(
                      icon: NavBarItemWidget(
                          'assets/icons/Icon1.svg', currentPage, 'Мои курсы'),
                    ),]),
            ),
          ),
        ),

    ]);
  }

  // Widget NavPages() =>
  //     Container(
  //       decoration: BoxDecoration(
  //           color: Colors.white
  //       ),
  //       child: BottomNavigationBar(
  //         selectedIconTheme: IconThemeData(color:  Color(0xff3D3DD8),),
  //         unselectedIconTheme: IconThemeData(color:  Color(0xff1A1A1A),),
  //         type: BottomNavigationBarType.fixed,
  //         selectedItemColor: Color(0xff3D3DD8),
  //         selectedFontSize: 16,
  //         unselectedItemColor: Color(0xff1A1A1A),
  //         iconSize: 20,
  //         selectedLabelStyle: TextStyle(fontFamily: 'assets/fonts/CeraPro-Bold.ttf', fontSize: 11, fontWeight: FontWeight.w700, color: Color(0xff3d3dd8)),
  //         unselectedLabelStyle: TextStyle(fontFamily: 'assets/fonts/CeraPro-Bold.ttf', fontSize: 11, fontWeight: FontWeight.w700, color: Color(0xff1A1A1A)),
  //         onTap: OnTap,
  //         currentIndex: currentPage,
  //         items: [
  //           BottomNavigationBarItem(
  //             label: 'Главная',
  //             icon: Container(
  //               height: 20, width: 18,
  //               child: SvgPicture.asset('assets/icons/Icon.svg'),
  //             ),
  //             ),
  //           BottomNavigationBarItem(
  //               label: 'Мои курсы',
  //               icon: Container(
  //                 height: 20, width: 18,
  //                 child: SvgPicture.asset('assets/icons/Icon1.svg'),
  //               ),
  //              ),
  //         ],
  //       ),
  //
  //     );
  //

}
