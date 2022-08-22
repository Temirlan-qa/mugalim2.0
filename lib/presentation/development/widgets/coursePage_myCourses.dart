import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CourseMyCourses extends StatefulWidget {
  const CourseMyCourses({Key? key}) : super(key: key);

  @override
  State<CourseMyCourses> createState() => _CourseMyCoursesState();
}

class _CourseMyCoursesState extends State<CourseMyCourses> {
  final Search = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Search.dispose();
  }
  bool unselected = true;
  List<Map<String, dynamic>> listsofCourses = [
    {
      'image': 'assets/images/Banner.png',
      'lessons': '34 уроков',
      'tests': '2 теста',
      'title': 'Изменить других можно! Как помочь...',
      'author': 'М. Изимбетов',
      'percentage': '45%',
      'firstLesson': 'Первый урок: Как меняться самому',
      'firstLessonDuration': '356 м',
      'firstLessonTest': 'Первый тест: Как меняться самому',
      'firstLessonQuestions': '5 вопросов',
      'secondLesson': 'Второй урок: Как меняться самому',
      'secondLessonDuration': '12 м',
      'secondLessonTest': 'Второй тест: Как меняться самому',
      'secondLessonQuestions': '23 вопросов'
    },
    {
      'image': 'assets/images/Rectangle 1425.png',
      'lessons': '41 урока',
      'tests': '5 теста',
      'title': 'fdsdaffdaafdfdafdaaaaaaaadfffffffffqfqqf',
      'author': 'Aybolali',
      'percentage': '133%',
      'firstLesson': 'weovguxujexdvbovuebwvewbguevwbguewvgwegv',
      'firstLessonDuration': '123 м',
      'firstLessonTest': 'wgrfvergwewgfqwfqeffeqefqeqf',
      'firstLessonQuestions': '14 вопросов',
      'secondLesson': 'qfeefeorvwibirwjhibhbriwophvnwrovhbg',
      'secondLessonDuration': '43 м',
      'secondLessonTest': 'fwdsfcfwedqaefqaecdefqaqfe',
      'secondLessonQuestions': '12 вопросов'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            elevation: 0.3,
            centerTitle: true,
            title: Text(
              'Курсы',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1A1A1A),
                  fontStyle: FontStyle.normal,
                  fontFamily: 'assets/fonts/CeraPro-Regular.ttf'),
            ),
            actions: [
              IconButton(
                icon: SvgPicture.asset('assets/icons/cancel.svg'),
                color: Color(0xff3D3DD8),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
            backgroundColor: Colors.white,
            bottom: TabBar(
              indicatorColor: Color(0xff3D3DD8),
              indicatorPadding: EdgeInsets.only(left: 15, right: 15, bottom: 9),
              labelColor: Colors.black,
              unselectedLabelColor:
                  unselected ? Color(0xff767676) : Colors.black,
              labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'assets/fonts/CeraPro-Regular.ttf'),
              indicatorWeight: 2,
              tabs: [
                Tab(
                  text: 'Текущие',
                ),
                Tab(
                  text: 'Завершённые',
                )
              ],
            )),
        body: TabBarView(
          children: [CurrentPage(), FinishedPage()],
        ),
      ),
    );
  }

  Widget CurrentPage() => SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            Container(
              height: 630,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xffFFFFFF)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      'Ваши курсы',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'assets/fonts/CeraPro-Bold.ttf',
                          color: Color(0xff1a1a1a)),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      'Старайтесь своевремнно заканчивать курсы, ведь они влияют на вашу итоговую оценку! 🤓',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'assets/fonts/CeraPro-Medium.ttf',
                          color: Color(0xff1a1a1a)),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: TextFormField(
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                          isDense: true,
                          iconColor: Color(0xff767676),
                          hintText: 'Поиск',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(14.5),
                            child: SvgPicture.asset('assets/icons/Search Icon.svg'),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              BorderSide(width: 0, style: BorderStyle.none)),
                          filled: true,
                          hintStyle: TextStyle(color: Color(0xff767676), fontSize: 16, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontFamily: 'assets/fonts/CeraPro-Regular.ttf' ),
                          contentPadding: EdgeInsets.all(8)
                      ),
                      controller: Search,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    height: 487,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: listsofCourses.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffFFFFFF),
                          border:
                              Border.all(color: Color(0xffD5D7F6), width: 1),
                        ),
                        width: 286,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                width: 270,
                                height: 156,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    image: DecorationImage(
                                        image: ExactAssetImage(
                                            'assets/images/Rectangle 1425.png'),
                                        fit: BoxFit.fitHeight,
                                        opacity: 0.5),
                                    color: Color(0xff000000),
                                    border:
                                        Border.all(color: Color(0xff42236A))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 16),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16, right: 16),
                                      child: Text(
                                        listsofCourses[index]['title'],
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 20,
                                            fontFamily:
                                                'assets/fonts/CeraPro-Bold.ttf',
                                            color: Color(0x0ffFFFFFF)),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(width: 16),
                                        Text(
                                          listsofCourses[index]['percentage'],
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xffffffff),
                                              fontFamily:
                                                  'assets/fonts/CeraPro-Bold.ttf'),
                                        ),
                                        SizedBox(width: 4),
                                        Text('•',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 13,
                                                fontFamily:
                                                    'assets/fonts/CeraPro-Bold.ttf',
                                                color: Color(0x0ffFFFFFF))),
                                        SizedBox(width: 4),
                                        Text(
                                          listsofCourses[index]['lessons'],
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily:
                                                  'assets/fonts/CeraPro-Bold.ttf',
                                              color: Color(0x0ffFFFFFF),
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(width: 4),
                                        Text('•',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 13,
                                                fontFamily:
                                                    'assets/fonts/CeraPro-Bold.ttf',
                                                color: Color(0x0ffFFFFFF))),
                                        SizedBox(width: 4),
                                        Text(
                                          listsofCourses[index]['tests'],
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily:
                                                  'assets/fonts/CeraPro-Bold.ttf',
                                              color: Color(0x0ffFFFFFF),
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                        padding:
                                            EdgeInsets.only(left: 16, top: 16),
                                        child: ClipRRect(
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 15, sigmaY: 13),
                                            child: Container(
                                              width: 123,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                  gradient:
                                                      RadialGradient(colors: [
                                                    Color.fromRGBO(
                                                        255, 255, 255, 0),
                                                    Color.fromRGBO(
                                                        255, 255, 255, 0.4),
                                                  ]),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Color(0xffffffff)
                                                      .withOpacity(0.5)),
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                        onPressed: () {},
                                                        child: Text(
                                                          'Продолжить',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 13,
                                                              fontFamily:
                                                                  'assets/fonts/CeraPro-Bold.ttf',
                                                              color: Color(
                                                                  0x0ffFFFFFF)),
                                                        )),
                                                    Icon(
                                                        Icons
                                                            .chevron_right_rounded,
                                                        color:
                                                            Color(0x0ffFFFFFF))
                                                  ]),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 280,
                              height: 52,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: 8),
                                  Container(
                                    width: 92,
                                    height: 52,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        image: DecorationImage(
                                            image: ExactAssetImage(
                                                'assets/images/Rectangle 1425.png'))),
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 170,
                                        height: 32,
                                        child: Text(
                                          listsofCourses[index]['firstLesson'],
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontFamily:
                                                  'assets/fonts/CeraPro-Bold.ttf',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              fontStyle: FontStyle.normal,
                                              color: Color(0xff1A1A1A)),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/time.svg',
                                            color: Color(0xff767676),
                                            width: 13.33,
                                            height: 13.33,
                                          ),
                                          SizedBox(width: 5.33),
                                          Text(
                                            listsofCourses[index]['firstLessonDuration'],
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff767676),
                                                fontFamily:
                                                    'assets/fonts/CeraPro-Bold.ttf'),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: 280,
                              height: 52,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: 8),
                                  Container(
                                    width: 92,
                                    height: 52,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        image: DecorationImage(
                                            image: ExactAssetImage(
                                                'assets/images/Rectangle 1425.png'))),
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 170,
                                        height: 32,
                                        child: Text(
                                          listsofCourses[index]['firstLessonTest'],
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontFamily:
                                                  'assets/fonts/CeraPro-Bold.ttf',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              fontStyle: FontStyle.normal,
                                              color: Color(0xff1A1A1A)),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/tasks.svg',
                                            color: Color(0xff767676),
                                            width: 13.33,
                                            height: 13.33,
                                          ),
                                          SizedBox(width: 5.33),
                                          Text(
                                            listsofCourses[index]['firstLessonQuestions'],
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff767676),
                                                fontFamily:
                                                    'assets/fonts/CeraPro-Bold.ttf'),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: 280,
                              height: 52,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: 8),
                                  Container(
                                    width: 92,
                                    height: 52,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        image: DecorationImage(
                                            image: ExactAssetImage(
                                                'assets/images/Rectangle 1425.png'))),
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 170,
                                        height: 32,
                                        child: Text(
                                          listsofCourses[index]['secondLesson'],
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontFamily:
                                                  'assets/fonts/CeraPro-Bold.ttf',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              fontStyle: FontStyle.normal,
                                              color: Color(0xff1A1A1A)),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/time.svg',
                                            color: Color(0xff767676),
                                            width: 13.33,
                                            height: 13.33,
                                          ),
                                          SizedBox(width: 5.33),
                                          Text(
                                            listsofCourses[index]['secondLessonDuration'],
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff767676),
                                                fontFamily:
                                                    'assets/fonts/CeraPro-Bold.ttf'),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: 280,
                              height: 52,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: 8),
                                  Container(
                                    width: 92,
                                    height: 52,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        image: DecorationImage(
                                            image: ExactAssetImage(
                                                'assets/images/Rectangle 1425.png'))),
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 170,
                                        height: 32,
                                        child: Text(
                                          listsofCourses[index]['secondLessonTest'],
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontFamily:
                                                  'assets/fonts/CeraPro-Bold.ttf',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              fontStyle: FontStyle.normal,
                                              color: Color(0xff1A1A1A)),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/tasks.svg',
                                            color: Color(0xff767676),
                                            width: 13.33,
                                            height: 13.33,
                                          ),
                                          SizedBox(width: 5.33),
                                          Text(
                                            listsofCourses[index]['secondLessonQuestions'],
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff767676),
                                                fontFamily:
                                                    'assets/fonts/CeraPro-Bold.ttf'),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 16),
                            Center(
                              child: GestureDetector(onTap: (){},
                                child: Text(
                                  'Показать все',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      fontStyle: FontStyle.normal,
                                      fontFamily:
                                      'assets/fonts/CeraPro-Regular.ttf',
                                      color: Color(0xff3d3dd8)),
                                ),),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  Widget FinishedPage() => SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 16),
          Container(
              height: double.maxFinite,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xffFFFFFF)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      'Так держать!',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'assets/fonts/CeraPro-Bold.ttf',
                          color: Color(0xff1a1a1a)),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      'Вы закончили эти курсы, желаем успехов на других тоже 😘',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'assets/fonts/CeraPro-Regular.ttf',
                          color: Color(0xff1a1a1a)),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: TextFormField(
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                          isDense: true,
                          iconColor: Color(0xff767676),
                          hintText: 'Поиск',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(14.5),
                            child: SvgPicture.asset('assets/icons/Search Icon.svg'),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              BorderSide(width: 0, style: BorderStyle.none)),
                          filled: true,
                          hintStyle: TextStyle(color: Color(0xff767676), fontSize: 16, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontFamily: 'assets/fonts/CeraPro-Regular.ttf' ),
                          contentPadding: EdgeInsets.all(8)
                      ),
                      controller: Search,
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, left: 16, top: 8),
                    child: GridView.count(
                      childAspectRatio: 167 / 200,
                      shrinkWrap: true,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      crossAxisCount: 2,
                      children: List.generate(
                        listsofCourses.length,
                        (index) => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xffFFFFFF),
                              border: Border.all(
                                  color: Color(0xffD5D7F6), width: 1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Container(
                                  height: 73,
                                  width: 168,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      image: DecorationImage(
                                          image: ExactAssetImage(
                                              'assets/images/Rectangle 1425.png'),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Text( listsofCourses[index]['lessons'],
                                        style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            fontFamily:
                                                'assets/fonts/CeraPro-Regular.ttf',
                                            color: Color(0xff1a1a1a))),
                                  ),
                                  SizedBox(width: 4),
                                  Text('•',
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontFamily:
                                              'assets/fonts/CeraPro-Regular.ttf',
                                          color: Color(0xff1a1a1a))),
                                  SizedBox(width: 4),
                                  Text( listsofCourses[index]['tests'],
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          fontFamily:
                                              'assets/fonts/CeraPro-Regular.ttf',
                                          color: Color(0xff1a1a1a))),
                                ],
                              ),
                              SizedBox(height: 4),
                              Padding(
                                padding: const EdgeInsets.only(left: 11),
                                child: Text(
                                    listsofCourses[index]['title'],
                                    maxLines: 2,
                                    style: TextStyle(
                                        wordSpacing: 0.9,
                                        fontFamily:
                                            'assets/fonts/CeraPro-Regular.ttf',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Color(0xff1a1a1a))),
                              ),
                              SizedBox(height: 4),
                              Padding(
                                padding: const EdgeInsets.only(left: 11),
                                child: Text(
                                  listsofCourses[index]['author'],
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          'assets/fonts/CeraPro-Regular.ttf',
                                      color: Color(0xff767676)),
                                ),
                              ),
                              SizedBox(height: 16),
                              Center(
                                  child: Container(
                                width: double.infinity,
                                height: 16,
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Посмотреть',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        fontStyle: FontStyle.normal,
                                        fontFamily:
                                            'assets/fonts/CeraPro-Regular.ttf',
                                        color: Color(0xff3d3dd8)),
                                  ),
                                ),
                              ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ],
      ));
}
