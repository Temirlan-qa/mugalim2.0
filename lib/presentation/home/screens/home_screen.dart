import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/const/sizedBox.dart';
import 'package:mugalim/presentation/home/widgets/post_list_screen.dart';
import 'package:mugalim/presentation/home/widgets/search_widget.dart';
import '../../../core/const/const_color.dart';
import '../../../core/injection_container.dart';
import '../../../logic/home/bloc/home_bloc.dart';
import '../../../logic/home/data/datasources/home_datasources.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String str =
      'Нельзя без последствий для здоровья изо дня в день проявлять себя противно тому, что чувствуешь; распинаться перед тем, чего не любишь, радоваться тому, что приносит несчастье. Наша нервная система не пустой звук, не выдумка. Она — состоящее из волокон физическое тело. Наша душа занимает место в пространстве и помещается в нас как зубы во рту. Ее нельзя без конца насиловать безнаказанно.\n\nБорис Пастернак, «Доктор Живаго»';
  String title =
      "Нельзя без последствий для здоровья изо дня в день проявлять себя противно тому, что чувствуешь; распинаться перед тем, чего не любишь, радоваться тому, что приносит несчастье. Наша нервная систем";
  String gonna = "";

  // Initial Selected Value
  String dropdownvalue = 'Новости ';

  bool run = true;

  // List of items in our dropdown menu
  var items = [
    'Новости',
    'Регион',
    'Город',
  ];
  bool search = false;
  TextEditingController searchEditingController = TextEditingController();
  bool buttonDown = false;
  int tabIndex = 0;
  int dropDownindex = 0;
  int votePPL1 = 45;
  int votePPL2 = 45;
  int voteProcent1 = 90;
  int voteProcent2 = 90;
  String voteAnswer1 = 'Да, пойду truyytyit guyvuiiio ihihuig78tf';
  String voteAnswer2 = 'Нет, не пойду';
  String votetitle = 'Пойдете ли в горы вместе с группой?';

  final HomeDatasource homeDatasource = sl();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      initialIndex: tabIndex,
      length: 3,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: ColorStyles.neutralsPageBackgroundColor,
            appBar: AppBar(
              leading: !search
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            search = !search;
                          });
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: ColorStyles.primaryBorderColor,
                        ),
                      ),
                    ),
              leadingWidth: !search ? 30 : 50,
              actions: <Widget>[
                Visibility(
                  visible: !search,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        search = !search;
                      });
                    },
                    child: !search
                        ? SvgPicture.asset(
                            'assets/icons/search.svg',
                            width: 21,
                            height: 21,
                          )
                        : const SizedBox(),
                  ),
                ),
                !search
                    ? const SizedBox(
                        width: 24,
                      )
                    : const Offstage(),
                Visibility(
                  visible: !search,
                  child: GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/bell.svg',
                        color: ColorStyles.primaryBorderColor,
                        height: 23.33,
                        width: 21,
                      )),
                ),
                !search
                    ? const SizedBox(
                        width: 16,
                      )
                    : const Offstage(),
              ],
              centerTitle: true,
              titleSpacing: 0,
              backgroundColor: Colors.white,
              title: !search
                  ? Text(
                      'Главная',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        color: ColorStyles.neutralsTextPrimaryColor,
                        fontFamily: 'CeraPro',
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: SearchWidget(hintText: '123'),
                    ),
              elevation: 0,
              bottom: TabBar(
                labelColor: ColorStyles.primaryBorderColor,
                unselectedLabelColor: ColorStyles.primarySurfaceHoverColor,
                indicatorColor: ColorStyles.primaryBorderColor,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                      color: ColorStyles.primaryBorderColor, width: 2),
                  insets: const EdgeInsets.symmetric(horizontal: 16),
                ),
                onTap: (index) {
                  setState(() {
                    dropDownindex = index;
                    if (dropDownindex == 1 || dropDownindex == 2) {
                      buttonDown = false;
                    }
                  });
                },
                isScrollable: true,
                tabs: [
                  SizedBox(
                    width: width / 3 - 30,
                    child: Tab(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            'Новости',
                            style: TextStyles.mediumStyle.copyWith(
                              fontSize: 16,
                              color: dropDownindex == 0
                                  ? Colors.black
                                  : ColorStyles.primarySurfaceHoverColor,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                buttonDown = !buttonDown;
                              });
                            },
                            child: Visibility(
                              visible: dropDownindex == 0,
                              child: Icon(
                                buttonDown
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                //Icons.keyboard_arrow_up,
                                size: 16,
                                color: ColorStyles.primaryBorderColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 3 - 50,
                    child: Tab(
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        'Тренды',
                        style: TextStyles.mediumStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 3 - 20,
                    child: Tab(
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        'Сохраненныe',
                        style: TextStyles.mediumStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                dropdownvalue == 'Новости '
                    ? BlocProvider(
                        create: (context) =>
                            sl<HomeBloc>()..add(GetPostsList()),
                        child: const PostListScreen(fromPage: "Новости"),
                      )
                    : dropdownvalue == 'Регион '
                        ? const Center(child: Text('Регион '))
                        : const Center(child: Text('Город ')),
                BlocProvider(
                  create: (context) =>
                      sl<HomeBloc>()..add(GetTrendingPostsList()),
                  child: const PostListScreen(fromPage: "Тренды"),
                ),
                BlocProvider(
                  create: (context) => sl<HomeBloc>()..add(GetSavedPostsList()),
                  child: const PostListScreen(fromPage: "Сохраненные"),
                ),
              ],
            ),
          ),
          Visibility(
            visible: buttonDown,
            child: Positioned(
              top: 110 + MediaQuery.of(context).padding.top,
              left: 15,
              child: AnimatedContainer(
                duration: const Duration(seconds: 5),
                curve: Curves.easeInQuint,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.16),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                height: 110,
                width: 110,
                padding: const EdgeInsets.only(top: 12, bottom: 12, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          buttonDown = false;
                          dropdownvalue = 'Новости ';
                        });
                      },
                      child: Text(
                        'Общие',
                        style: TextStyles.mediumStyle.copyWith(
                          fontSize: 13,
                          color: const Color(0xFF1A1A1A),
                          height: 1.2,
                        ),
                      ),
                    ),
                    sizedBoxHeight16(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          buttonDown = false;
                          dropdownvalue = 'Регион ';
                        });
                      },
                      child: Text(
                        'Мой регион',
                        style: TextStyles.mediumStyle.copyWith(
                          fontSize: 13,
                          color: const Color(0xFF1A1A1A),
                          height: 1.2,
                        ),
                      ),
                    ),
                    sizedBoxHeight16(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          buttonDown = false;
                          dropdownvalue = 'Город ';
                        });
                      },
                      child: Text(
                        'Мой город',
                        style: TextStyles.mediumStyle.copyWith(
                          fontSize: 13,
                          color: const Color(0xFF1A1A1A),
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
