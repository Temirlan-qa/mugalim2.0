import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';

class CoursePageDetailed extends StatefulWidget {
  const CoursePageDetailed({Key? key}) : super(key: key);

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
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Курсы',
          style: TextStyles.boldStyle.copyWith(
            fontSize: 23,
            color: ColorStyles.neutralsTextPrimaryColor,
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/cancel.svg'),
            color: ColorStyles.primaryBorderColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        bottom: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 1,
            title: SizedBox(
              width: double.maxFinite,
              child: TextFormField(
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                    isDense: true,
                    iconColor: ColorStyles.primarySurfaceHoverColor,
                    hintText: 'Поиск',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(14.5),
                      child: SvgPicture.asset('assets/icons/Search Icon.svg'),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none),
                    ),
                    filled: true,
                    hintStyle: TextStyles.regularStyle.copyWith(
                      color: ColorStyles.primarySurfaceHoverColor,
                      fontSize: 16,
                    ),
                    contentPadding: const EdgeInsets.all(8)),
                controller: Search,
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizedBoxHeight16(),
            Container(
              height: 260,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Ваши последние курсы',
                      style: TextStyles.mediumStyle.copyWith(
                        fontSize: 20,
                        color: ColorStyles.neutralsTextPrimaryColor,
                      ),
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
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image:
                                  ExactAssetImage('assets/images/Banner.png'),
                              fit: BoxFit.fill,
                              opacity: 0.5),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black,
                        ),
                        width: 270.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sizedBoxHeight16(),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                listsofCourses[index]['title'],
                                style: TextStyles.mediumStyle.copyWith(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            sizedBoxHeight4(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                sizedBoxWidth16(),
                                Text(
                                  listsofCourses[index]['percentage'],
                                  style: TextStyles.mediumStyle.copyWith(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                sizedBoxWidth4(),
                                Text(
                                  '•',
                                  style: TextStyles.mediumStyle.copyWith(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                                sizedBoxWidth4(),
                                Text(
                                  listsofCourses[index]['lessons'],
                                  style: TextStyles.regularStyle.copyWith(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                                sizedBoxWidth4(),
                                Text(
                                  '•',
                                  style: TextStyles.mediumStyle.copyWith(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                                sizedBoxWidth4(),
                                Text(
                                  listsofCourses[index]['tests'],
                                  style: TextStyles.regularStyle.copyWith(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 16),
                              child: ClipRRect(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 15, sigmaY: 13),
                                  child: Container(
                                    width: 123,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      gradient: const RadialGradient(colors: [
                                        Color.fromRGBO(255, 255, 255, 0),
                                        Color.fromRGBO(255, 255, 255, 0.4),
                                      ]),
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Продолжить',
                                            style:
                                                TextStyles.mediumStyle.copyWith(
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const Icon(
                                          Icons.chevron_right_rounded,
                                          color: Colors.white,
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 127),
                            child: SizedBox(
                              width: 101,
                              height: 16,
                              child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  ('Посмотреть все'),
                                  style: TextStyles.mediumStyle.copyWith(
                                    color: ColorStyles.primaryBorderColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            )),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.chevron_right_outlined,
                          color: ColorStyles.primaryBorderColor,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            sizedBoxHeight8(),
            Container(
              height: 528,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBoxHeight16(),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Доступные вам курсы',
                      style: TextStyles.mediumStyle.copyWith(
                        fontSize: 20,
                        color: ColorStyles.neutralsTextPrimaryColor,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  sizedBoxHeight16(),
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
                              color: Colors.white,
                              border: Border.all(
                                  color: const Color(0xffD5D7F6), width: 1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  height: 73,
                                  width: 168,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      image: const DecorationImage(
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
                                    child: Text(
                                      listsofCourses[index]['lessons'],
                                      style: TextStyles.regularStyle.copyWith(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 13,
                                          color: ColorStyles
                                              .neutralsTextPrimaryColor),
                                    ),
                                  ),
                                  sizedBoxWidth4(),
                                  Text(
                                    '•',
                                    style: TextStyles.mediumStyle.copyWith(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      color:
                                          ColorStyles.neutralsTextPrimaryColor,
                                    ),
                                  ),
                                  sizedBoxWidth4(),
                                  Text(
                                    listsofCourses[index]['tests'],
                                    style: TextStyles.regularStyle.copyWith(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 13,
                                      color:
                                          ColorStyles.neutralsTextPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              sizedBoxHeight4(),
                              Padding(
                                padding: const EdgeInsets.only(left: 11),
                                child: Text(
                                  listsofCourses[index]['title'],
                                  maxLines: 2,
                                  style: TextStyles.mediumStyle.copyWith(
                                    wordSpacing: 0.9,
                                    fontSize: 14,
                                    color: ColorStyles.neutralsTextPrimaryColor,
                                  ),
                                ),
                              ),
                              //sizedBoxHeight4(),
                              Padding(
                                padding: const EdgeInsets.only(left: 11),
                                child: Text(
                                  listsofCourses[index]['author'],
                                  maxLines: 1,
                                  style: TextStyles.regularStyle.copyWith(
                                    fontSize: 13,
                                    color: ColorStyles.primarySurfaceHoverColor,
                                  ),
                                ),
                              ),
                              sizedBoxHeight16(),
                              Center(
                                child: Container(
                                  width: double.maxFinite,
                                  height: 16,
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Начать',
                                      style: TextStyles.mediumStyle.copyWith(
                                          fontSize: 13,
                                          color:
                                              ColorStyles.primaryBorderColor),
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
            )
          ],
        ),
      ),
    );
  }
}
