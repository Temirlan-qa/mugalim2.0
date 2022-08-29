import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/presentation/development/screens/mPassword_screen.dart';
import 'package:mugalim/presentation/development/screens/statistic_screen.dart';
import '../../../core/const/const_color.dart';
import '../../../core/routes/routes_const.dart';
import '../../books/screens/select_jenre.dart';
import '../widgets/gesture_widget.dart';

class DevelopmentScreen extends StatefulWidget {
  const DevelopmentScreen({Key? key}) : super(key: key);

  @override
  State<DevelopmentScreen> createState() => _DevelopmentScreenState();
}

class _DevelopmentScreenState extends State<DevelopmentScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    List list = ['Бизнес', 'Классика', 'Развитие', 'Фантастика'];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                color: ColorStyles.neutralsPageBackgroundColor,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset('assets/images/devImg3.png'),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset('assets/images/devImg2.png')),
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset('assets/images/devImg1.png'),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 56,
                child: Column(
                  children: [
                    Container(
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.4),
                            Colors.white.withOpacity(0),
                          ],
                        ),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.7), width: 4),
                      ),
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                sizedBoxHeight24(),
                                Text(
                                  'Добрый день, Мухаммед!',
                                  style: TextStyles.boldStyle.copyWith(
                                    fontSize: 23,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                sizedBoxWidth8(),
                                Text(
                                  'Сегодня прекрасный день для развития',
                                  style: TextStyles.mediumStyle.copyWith(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                sizedBoxHeight24(),
                                Row(
                                  children: [
                                    GestureWidget(
                                      onTap: () {

                                        Navigator.of(context, rootNavigator: true).pushNamed(CourseRoute);
                                      }, title: 'Курсы', path: 'assets/images/courseIcon.png',
                                    ),
                                    const Spacer(),
                                    GestureWidget(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(ChoiceRoute);

                                      }, title: 'Книги', path: 'assets/images/newBookIcon.png',
                                    ),
                                    const Spacer(),
                                    GestureWidget(
                                      onTap: () {

                                      }, title: 'M Passport', path: 'assets/images/passportIcon.png',
                                    ),
                                    const Spacer(),
                                    GestureWidget(
                                      onTap: () {

                                      },
                                      title: 'Статистика', path: 'assets/images/statisticsIcon.png',
                                    ),
                                  ],
                                ),
                                sizedBoxHeight24(),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '57',
                                            style:
                                                TextStyles.boldStyle.copyWith(
                                              fontSize: 24,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          sizedBoxHeight8(),
                                          Text(
                                            'КУРСОВ',
                                            style:
                                                TextStyles.boldStyle.copyWith(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: Column(
                                        children: [
                                          Text(
                                            '207',
                                            style:
                                                TextStyles.boldStyle.copyWith(
                                              fontSize: 24,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          sizedBoxHeight8(),
                                          Text(
                                            'КНИГ',
                                            style:
                                                TextStyles.boldStyle.copyWith(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: Column(
                                        children: [
                                          Text(
                                            '93',
                                            style:
                                                TextStyles.boldStyle.copyWith(
                                              fontSize: 24,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          sizedBoxHeight8(),
                                          Text(
                                            'ЗАДАНИЙ',
                                            style:
                                                TextStyles.boldStyle.copyWith(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                sizedBoxHeight24(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    sizedBoxHeight8(),
                    Container(
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withOpacity(0.4),
                                Colors.white.withOpacity(0),
                              ]),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.7), width: 4)),
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Продолжите задания',
                                  style: TextStyles.mediumStyle.copyWith(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                sizedBoxHeight8(),
                                Container(
                                  height: 68,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(12, 8, 16, 8),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Жүзу',
                                              style: TextStyles.mediumStyle
                                                  .copyWith(
                                                fontSize: 16,
                                                color: Colors.black,
                                              ),
                                            ),
                                            sizedBoxHeight4(),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 70,
                                                  child: Stack(
                                                    children: [
                                                      ClipOval(
                                                        child: CircleAvatar(
                                                            radius: 12,
                                                            child: Image
                                                                .asset(
                                                              'assets/images/avataricon1.png',
                                                              // color: Colors.red,
                                                            )),
                                                      ),
                                                      Positioned(
                                                        left: 18,
                                                        child: ClipOval(
                                                          child: CircleAvatar(
                                                              radius: 12,
                                                              child: Image
                                                                  .asset(
                                                                  'assets/images/avataricon2.png')),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 36,
                                                        child: ClipOval(
                                                          child: CircleAvatar(
                                                            backgroundColor: Color(0xff3D3DD8),
                                                              radius: 12,
                                                              child: Text(
                                                                '+21',
                                                                style: TextStyles.regularStyle
                                                                    .copyWith(
                                                                  fontSize: 13,
                                                                  color:
                                                                  Colors.white,
                                                                ),
                                                              ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  '120 человек выполнили!',
                                                  style: TextStyles.regularStyle
                                                      .copyWith(
                                                    fontSize: 13,
                                                    color:
                                                        const Color(0xFF767676),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.arrow_forward_ios,
                                          size: 18,
                                          color: Color(0xff3D3DD8),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    sizedBoxHeight8(),
                    Container(
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withOpacity(0.4),
                                Colors.white.withOpacity(0),
                              ]),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.7), width: 4)),
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Продолжите курс',
                                  style: TextStyles.mediumStyle.copyWith(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                sizedBoxHeight8(),
                                Container(
                                  height: 68,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(12, 8, 16, 8),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                    'assets/images/courseImage.png',
                                                  fit: BoxFit.cover,
                                                  width: 92,
                                                  height: 52,
                                                ),
                                                sizedBoxWidth8(),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Figma: начало работы',
                                                      style: TextStyles
                                                          .mediumStyle
                                                          .copyWith(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.access_time,
                                                          size: 15,
                                                          color:
                                                              Color(0xff767676),
                                                        ),
                                                        sizedBoxWidth4(),
                                                        Text(
                                                          '1 ч 21 м',
                                                          style: TextStyles
                                                              .regularStyle
                                                              .copyWith(
                                                            fontSize: 13,
                                                            color: const Color(
                                                                0xFF767676),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.arrow_forward_ios,
                                          size: 18,
                                          color: Color(0xff3D3DD8),
                                        ),
                                      ],
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
        ),
      ),
    );
  }
}
