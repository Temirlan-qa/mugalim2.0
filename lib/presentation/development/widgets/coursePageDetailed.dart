import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/widgets/textform_widget.dart';

import '../../../core/routes/routes_const.dart';
import '../../cources/widgets/card_widget.dart';

class CoursePageDetailed extends StatefulWidget {
  final BuildContext devScreenContext;
  const CoursePageDetailed({Key? key, required this.devScreenContext}) : super(key: key);

  @override
  State<CoursePageDetailed> createState() => _CoursePageDetailedState();
}

class _CoursePageDetailedState extends State<CoursePageDetailed> {
  final Search = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
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
          GestureDetector(
            onTap: (){
              Navigator.pop(widget.devScreenContext);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 12,bottom: 12,right: 14),
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  //color: Colors.black
                  color: const Color(0xFFF9F9F9),
                ),
                child: Icon(
                  CupertinoIcons.clear,
                  color: ColorStyles.primaryBorderColor,
                ),
              ),
            ),
          ),
          // IconButton(
          //   icon: SvgPicture.asset('assets/icons/cancel.svg'),
          //   color: ColorStyles.primaryBorderColor,
          //   onPressed: () {
          //     // Navigator.pushReplacementNamed(context, CourseRoute);
          //     Navigator.pop(widget.devScreenContext);
          //   },
          // ),
        ],
        bottom: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 1,
            title: const SizedBox(
              width: double.maxFinite,
              child: TextFormFieldWidget(),
            ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizedBoxHeight16(),
            Container(
              height: 262,
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
                    height: 165,
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
                              fit: BoxFit.cover,
                              opacity: 0.5
                          ),
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
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                width: 123,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: const RadialGradient(
                                      colors: [
                                    Color.fromRGBO(255, 255, 255, 0),

                                    Color.fromRGBO(255, 255, 255, 0.4),
                                  ]),
                                  color: Colors.white.withOpacity(0.5),
                                  //   border: Border.all(
                                  //       color: Colors.white.withOpacity(0.5), width: 0),
                                ),

                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Продолжить',
                                          style:
                                              TextStyles.mediumStyle.copyWith(
                                            fontSize: 13,
                                            color: Colors.white,
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
                  const CourseCardWidget(),
                ],
              ),
            )
            // SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }
}
