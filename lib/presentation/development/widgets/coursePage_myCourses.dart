import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';

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
    },
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
    },
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
            backgroundColor: Colors.white,
            bottom: TabBar(
              indicatorColor: ColorStyles.primaryBorderColor,
              indicatorPadding:
                  const EdgeInsets.only(left: 15, right: 15, bottom: 9),
              labelColor: Colors.black,
              unselectedLabelColor: unselected
                  ? ColorStyles.primarySurfaceHoverColor
                  : Colors.black,
              labelStyle: TextStyles.mediumStyle.copyWith(
                fontSize: 16,
              ),
              indicatorWeight: 2,
              tabs: const [
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
            sizedBoxHeight16(),
            Container(
              height: 630,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      'Ваши курсы',
                      style: TextStyles.mediumStyle.copyWith(
                        fontSize: 20,
                        color: ColorStyles.neutralsTextPrimaryColor,
                      ),
                    ),
                  ),
                  sizedBoxHeight8(),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      'Старайтесь своевремнно заканчивать курсы, ведь они влияют на вашу итоговую оценку! 🤓',
                      style: TextStyles.regularStyle.copyWith(
                        fontSize: 13,
                        color: ColorStyles.neutralsTextPrimaryColor,
                      ),
                    ),
                  ),
                  sizedBoxHeight8(),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: TextFormField(
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                          isDense: true,
                          iconColor: ColorStyles.primarySurfaceHoverColor,
                          hintText: 'Поиск',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(14.5),
                            child: SvgPicture.asset(
                                'assets/icons/Search Icon.svg'),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                          filled: true,
                          hintStyle: TextStyles.regularStyle.copyWith(
                            color: ColorStyles.primarySurfaceHoverColor,
                            fontSize: 16,
                          ),
                          contentPadding: const EdgeInsets.all(8)),
                      controller: Search,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    height: 487,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: listsofCourses.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xffD5D7F6),
                            width: 1,
                          ),
                        ),
                        width: 286,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                width: 270,
                                height: 156,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  image: const DecorationImage(
                                      image: ExactAssetImage(
                                          'assets/images/Rectangle 1425.png'),
                                      fit: BoxFit.fitHeight,
                                      opacity: 0.5),
                                  color: Colors.black,
                                  border: Border.all(
                                    color: const Color(0xff42236A),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    sizedBoxHeight16(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 16),
                                      child: Text(
                                        listsofCourses[index]['title'],
                                        maxLines: 2,
                                        style: TextStyles.mediumStyle.copyWith(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    sizedBoxHeight4(),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        sizedBoxWidth16(),
                                        Text(
                                          listsofCourses[index]['percentage'],
                                          style:
                                              TextStyles.mediumStyle.copyWith(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                        sizedBoxWidth4(),
                                        Text(
                                          '•',
                                          style:
                                              TextStyles.mediumStyle.copyWith(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                        sizedBoxWidth4(),
                                        Text(
                                          listsofCourses[index]['lessons'],
                                          style:
                                              TextStyles.regularStyle.copyWith(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                        sizedBoxWidth4(),
                                        Text(
                                          '•',
                                          style:
                                              TextStyles.mediumStyle.copyWith(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                        sizedBoxWidth4(),
                                        Text(
                                          listsofCourses[index]['tests'],
                                          style:
                                              TextStyles.regularStyle.copyWith(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, top: 16),
                                      child: ClipRRect(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 15, sigmaY: 13),
                                          child: Container(
                                            width: 123,
                                            height: 32,
                                            decoration: BoxDecoration(
                                                gradient:
                                                    const RadialGradient(colors: [
                                                  Color.fromRGBO(
                                                      255, 255, 255, 0),

                                                  Color.fromRGBO(
                                                      255, 255, 255, 0.4),
                                                ]),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.white
                                                    .withOpacity(0.5)),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'Продолжить',
                                                    style: TextStyles
                                                        .mediumStyle
                                                        .copyWith(
                                                      fontSize: 13,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                const Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: Colors.white),
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
                            SizedBox(
                              width: 280,
                              height: 52,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  sizedBoxWidth8(),
                                  Container(
                                    width: 92,
                                    height: 52,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      image: const DecorationImage(
                                        image: ExactAssetImage(
                                            'assets/images/Rectangle 1425.png'),
                                      ),
                                    ),
                                  ),
                                  sizedBoxWidth8(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 170,
                                        height: 32,
                                        child: Text(
                                          listsofCourses[index]['firstLesson'],
                                          maxLines: 2,
                                          style:
                                              TextStyles.mediumStyle.copyWith(
                                            fontSize: 13,
                                            color: ColorStyles
                                                .neutralsTextPrimaryColor,
                                          ),
                                        ),
                                      ),
                                      sizedBoxHeight4(),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/time.svg',
                                            color: ColorStyles
                                                .primarySurfaceHoverColor,
                                            width: 13.33,
                                            height: 13.33,
                                          ),
                                          const SizedBox(width: 5.33),
                                          Text(
                                            listsofCourses[index]
                                                ['firstLessonDuration'],
                                            style: TextStyles.regularStyle
                                                .copyWith(
                                              fontSize: 13,
                                              color: ColorStyles
                                                  .primarySurfaceHoverColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            sizedBoxHeight8(),
                            SizedBox(
                              width: 280,
                              height: 52,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  sizedBoxWidth8(),
                                  Container(
                                    width: 92,
                                    height: 52,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        image: const DecorationImage(
                                            image: ExactAssetImage(
                                                'assets/images/Rectangle 1425.png'))),
                                  ),
                                  sizedBoxWidth8(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 170,
                                        height: 32,
                                        child: Text(
                                          listsofCourses[index]
                                              ['firstLessonTest'],
                                          maxLines: 2,
                                          style:
                                              TextStyles.mediumStyle.copyWith(
                                            fontSize: 13,
                                            color: ColorStyles
                                                .neutralsTextPrimaryColor,
                                          ),
                                        ),
                                      ),
                                      sizedBoxHeight4(),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/tasks.svg',
                                            color: ColorStyles.primarySurfaceHoverColor,
                                            width: 13.33,
                                            height: 13.33,
                                          ),
                                          const SizedBox(width: 5.33),
                                          Text(
                                            listsofCourses[index]
                                                ['firstLessonQuestions'],
                                            style: TextStyles.regularStyle
                                                .copyWith(
                                              fontSize: 13,
                                              color: ColorStyles
                                                  .primarySurfaceHoverColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            sizedBoxHeight8(),
                            SizedBox(
                              width: 280,
                              height: 52,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  sizedBoxWidth8(),
                                  Container(
                                    width: 92,
                                    height: 52,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      image: const DecorationImage(
                                        image: ExactAssetImage(
                                            'assets/images/Rectangle 1425.png'),
                                      ),
                                    ),
                                  ),
                                  sizedBoxWidth8(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 170,
                                        height: 32,
                                        child: Text(
                                          listsofCourses[index]['secondLesson'],
                                          maxLines: 2,
                                          style:
                                              TextStyles.mediumStyle.copyWith(
                                            fontSize: 13,
                                            color: ColorStyles
                                                .neutralsTextPrimaryColor,
                                          ),
                                        ),
                                      ),
                                      sizedBoxHeight4(),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/time.svg',
                                            color: ColorStyles.primarySurfaceHoverColor,
                                            width: 13.33,
                                            height: 13.33,
                                          ),
                                          const SizedBox(width: 5.33),
                                          Text(
                                            listsofCourses[index]
                                                ['secondLessonDuration'],
                                            style: TextStyles.regularStyle
                                                .copyWith(
                                              fontSize: 13,
                                              color: ColorStyles
                                                  .primarySurfaceHoverColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            sizedBoxHeight8(),
                            SizedBox(
                              width: 280,
                              height: 52,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  sizedBoxWidth8(),
                                  Container(
                                    width: 92,
                                    height: 52,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      image: const DecorationImage(
                                        image: ExactAssetImage(
                                            'assets/images/Rectangle 1425.png'),
                                      ),
                                    ),
                                  ),
                                  sizedBoxWidth8(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 170,
                                        height: 32,
                                        child: Text(
                                          listsofCourses[index]
                                              ['secondLessonTest'],
                                          maxLines: 2,
                                          style:
                                              TextStyles.mediumStyle.copyWith(
                                            fontSize: 13,
                                            color: ColorStyles
                                                .neutralsTextPrimaryColor,
                                          ),
                                        ),
                                      ),
                                      sizedBoxHeight4(),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/tasks.svg',
                                            color: ColorStyles
                                                .primarySurfaceHoverColor,
                                            width: 13.33,
                                            height: 13.33,
                                          ),
                                          const SizedBox(width: 5.33),
                                          Text(
                                            listsofCourses[index]
                                                ['secondLessonQuestions'],
                                            style: TextStyles.regularStyle
                                                .copyWith(
                                              fontSize: 13,
                                              color: ColorStyles
                                                  .primarySurfaceHoverColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            sizedBoxHeight16(),
                            Center(
                              child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Показать все',
                                  style: TextStyles.mediumStyle.copyWith(
                                    fontSize: 13,
                                    color: ColorStyles.primaryBorderColor,
                                  ),
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
            ),
          ],
        ),
      );

  Widget FinishedPage() => SingleChildScrollView(
        child: Column(
          children: [
            sizedBoxHeight16(),
            Container(
              height: double.maxFinite,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      'Так держать!',
                      style: TextStyles.mediumStyle.copyWith(
                        fontSize: 20,
                        color: ColorStyles.neutralsTextPrimaryColor,
                      ),
                    ),
                  ),
                  sizedBoxHeight8(),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      'Вы закончили эти курсы, желаем успехов на других тоже 😘',
                      style: TextStyles.regularStyle.copyWith(
                        fontSize: 13,
                        color: ColorStyles.neutralsTextPrimaryColor,
                      ),
                    ),
                  ),
                  sizedBoxHeight8(),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: TextFormField(
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                          isDense: true,
                          iconColor: ColorStyles.primarySurfaceHoverColor,
                          hintText: 'Поиск',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(14.5),
                            child: SvgPicture.asset(
                                'assets/icons/Search Icon.svg'),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                          filled: true,
                          hintStyle: TextStyles.regularStyle.copyWith(
                            color: ColorStyles.primarySurfaceHoverColor,
                            fontSize: 16,
                          ),
                          contentPadding: const EdgeInsets.all(8)),
                      controller: Search,
                    ),
                  ),
                  sizedBoxHeight8(),
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
                                color: const Color(0xffD5D7F6), width: 1),
                          ),
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
                                        fontSize: 13,
                                        color: ColorStyles
                                            .neutralsTextPrimaryColor,
                                      ),
                                    ),
                                  ),
                                  sizedBoxWidth4(),
                                  Text(
                                    '•',
                                    style: TextStyles.mediumStyle.copyWith(
                                      fontSize: 14,
                                      color:
                                          ColorStyles.neutralsTextPrimaryColor,
                                    ),
                                  ),
                                  sizedBoxWidth4(),
                                  Text(
                                    listsofCourses[index]['tests'],
                                    style: TextStyles.regularStyle.copyWith(
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
                              sizedBoxHeight4(),
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
                              sizedBoxHeight8(),
                              Center(
                                child: Container(
                                  width: double.infinity,
                                  height: 16,
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Посмотреть',
                                      style: TextStyles.mediumStyle.copyWith(
                                        fontSize: 13,
                                        color: ColorStyles.primaryBorderColor,
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
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
