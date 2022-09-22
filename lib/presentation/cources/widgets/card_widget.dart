import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/const/sizedBox.dart';
import '../../../core/const/const_color.dart';
import '../../../core/const/text_style_const.dart';

class CourseCardWidget extends StatelessWidget {
  const CourseCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedBoxHeight16(),
        Padding(
          padding:
              const EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 16),
          child: GridView.count(
            childAspectRatio: 167 / 211,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            crossAxisCount: 2,
            children: List.generate(
              listsofCourses.length,
              (index) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0xffD5D7F6), width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        height: 84,
                        width: 168,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            image: const DecorationImage(
                                image: ExactAssetImage(
                                    'assets/images/cardBackground.png'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            listsofCourses[index]['lessons'],
                            style: TextStyles.regularStyle.copyWith(
                                fontStyle: FontStyle.normal,
                                fontSize: 13,
                                color: ColorStyles.neutralsTextPrimaryColor),
                          ),
                        ),
                        sizedBoxWidth4(),
                        Text(
                          '•',
                          style: TextStyles.mediumStyle.copyWith(
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: ColorStyles.neutralsTextPrimaryColor,
                          ),
                        ),
                        sizedBoxWidth4(),
                        Text(
                          listsofCourses[index]['tests'],
                          style: TextStyles.regularStyle.copyWith(
                            fontStyle: FontStyle.normal,
                            fontSize: 13,
                            color: ColorStyles.neutralsTextPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    sizedBoxHeight4(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
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
                      padding: const EdgeInsets.symmetric(horizontal: 8),
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
                                color: ColorStyles.primaryBorderColor),
                          ),
                        ),
                      ),
                    ),
                    sizedBoxHeight8(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
