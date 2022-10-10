import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../core/const/const_color.dart';
import '../../../../core/injection_container.dart';
import '../../../../core/routes/routes.dart';
import '../../../../logic/book/bloc/book_bloc.dart';
import '../../../books/widgets/book_navBar_widget.dart';
import 'home_book_screen.dart';
import 'myBook_screen.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
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
              navigatorKey: Get.nestedKey(7),
              navigatorObservers: [GetObserver((_) {}, Get.routing)],
              onGenerateRoute: (settings) =>
                  InnLabRouter.generateRoute(settings),
              builder: (_) => BlocProvider(
                create: (context) => sl<BookBloc>()..add(GetMyReadBookList()),
                child:  HomeBookScreen(devScreenContext: context,),
              )
            ),
            CupertinoTabView(
              navigatorKey: Get.nestedKey(8),
              navigatorObservers: [GetObserver((_) {}, Get.routing)],
              onGenerateRoute: (settings) =>
                  InnLabRouter.generateRoute(settings),
              builder: (_) => BlocProvider(
                create: (context) => sl<BookBloc>()..add(GetMyReadBookList()),
                child: MyBookScreen(devScreenContext: context,),
              ),
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
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: BookNavBarItemWidget(
                      'assets/icons/bookHomeIcon.svg', currentPage, 'Главная',
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: BookNavBarItemWidget(
                        'assets/icons/myBookIcon.svg', currentPage, 'Мои книги'),
                  ),]),
          ),
        ),
      ),

    ]);
  }
}
