import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CoursePageDetailed extends StatefulWidget {
  @override
  State<CoursePageDetailed> createState() => _CoursePageDetailedState();
}

class _CoursePageDetailedState extends State<CoursePageDetailed> {
  final Search = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Search.dispose();
  }
  List<Map<String, dynamic>> listsofCourses = [
    {
      'image': 'assets/images/Banner.png',
      'lessons': '34 уроков',
      'tests': '2 теста',
      'title': 'Изменить других можно! Как помочь...',
      'author': 'М. Изимбетов',
      'percentage': '45%',
      'firstLesson': 'Первый урок: Как меняться самому',
      'firstLessonDuration': '356',
      'firstLessonTest': 'Первый тест: Как меняться самому',
      'firstLessonQuestions': '5',
      'secondLesson': 'Второй урок: Как меняться самому',
      'secondLessonDuration': '12',
      'secondLessonTest': 'Второй тест: Как меняться самому',
      'secondLessonQuestions': '23'
    },
    {
      'image': 'assets/images/Rectangle 1425.png',
      'lessons': '41 урока',
      'tests': '5 теста',
      'title': 'fdsdaffdaafdfdafdaaaaaaaadfffffffffqfqqf',
      'author': 'Aybolali',
      'percentage': '133%',
      'firstLesson': 'weovguxujexdvbovuebwvewbguevwbguewvgwegv',
      'firstLessonDuration': '123',
      'firstLessonTest': 'wgrfvergwewgfqwfqeffeqefqeqf',
      'firstLessonQuestions': '14',
      'secondLesson': 'qfeefeorvwibirwjhibhbriwophvnwrovhbg',
      'secondLessonDuration': '43',
      'secondLessonTest': 'fwdsfcfwedqaefqaecdefqaqfe',
      'secondLessonQuestions': '12'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        bottom: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            title: Container(
              width: double.maxFinite,
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
                    hintStyle: TextStyle(
                        color: Color(0xff767676),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'assets/fonts/CeraPro-Regular.ttf'),
                    contentPadding: EdgeInsets.all(8)),
                controller: Search,
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            Container(
              height: 260,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xffFFFFFF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Ваши последние курсы',
                      style: TextStyle(
                          fontFamily: 'assets/fonts/CeraPro-Regular.ttf',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Color(0xff1A1A1A)),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                    height: 156,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: listsofCourses.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  ExactAssetImage('assets/images/Banner.png'),
                              fit: BoxFit.fill,
                              opacity: 0.5),
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xff000000),
                        ),
                        width: 270.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16),
                            Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Text(
                                  listsofCourses[index]['title'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20,
                                    fontFamily: 'assets/fonts/CeraPro-Bold.ttf',
                                    color: Color(0x0ffFFFFFF)),
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                padding: EdgeInsets.only(left: 16, top: 16),
                                child: ClipRRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 15, sigmaY: 13),
                                    child: Container(
                                      width: 123,
                                      height: 32,
                                      decoration: BoxDecoration(
                                          gradient: RadialGradient(colors: [
                                            Color.fromRGBO(255, 255, 255, 0),
                                            Color.fromRGBO(255, 255, 255, 0.4),
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
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      fontFamily:
                                                          'assets/fonts/CeraPro-Bold.ttf',
                                                      color:
                                                          Color(0x0ffFFFFFF)),
                                                )),
                                            Icon(Icons.chevron_right_rounded,
                                                color: Color(0x0ffFFFFFF))
                                          ]),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 127),
                            child: Container(
                              width: 101,
                              height: 16,
                              child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  ('Посмотреть все'),
                                  style: TextStyle(
                                    color: Color(0xff3D3DD8),
                                    fontStyle: FontStyle.normal,
                                    fontSize: 13,
                                    fontFamily: 'assets/fonts/CeraPro-Bold.ttf',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(width: 10),
                        Icon(
                          Icons.chevron_right_outlined,
                          color: Color(0xff3D3DD8),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 528,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xffFFFFFF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Доступные вам курсы',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color(0xff1a1a1a),
                        fontStyle: FontStyle.normal,
                        fontFamily: 'assets/fonts/CeraPro-Bold.ttf',
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, left: 16, top: 8),
                    child: GridView.count(
                      childAspectRatio: 167 / 190,
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
                                width: double.maxFinite,
                                height: 16,
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Начать',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        fontStyle: FontStyle.normal,
                                        fontFamily:
                                            'assets/fonts/CeraPro-Regular.ttf',
                                        color: Color(0xff3d3dd8)),
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
