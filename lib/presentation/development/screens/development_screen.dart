import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart';
import 'package:mugalim/core/const/sizedBox.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import '../../../core/const/const_color.dart';
import '../../../core/routes/routes_const.dart';
import '../../../logic/book/bloc/book_bloc.dart';
import '../../books/screens/bookMain/voteNotStartedScreen.dart';
import '../widgets/gesture_widget.dart';

class DevelopmentScreen extends StatefulWidget {
  const DevelopmentScreen({Key? key}) : super(key: key);

  @override
  State<DevelopmentScreen> createState() => _DevelopmentScreenState();
}

class _DevelopmentScreenState extends State<DevelopmentScreen> {
  Box genres = Hive.box('genres');
  @override
  Widget build(BuildContext context) {
    bool isVotingNotStarted = false;
    bool isVotedAndShowDeadline = false;
    bool isNotVotedAndShowGenre = false;
    bool isCompleted = false;
    bool isGenreVoted = false;
    bool isNotGroup = false;
    // BlocBuilder<BookBloc,BookState>(
    //     builder: (context,state){
    //       print(state);
    //       if(state is DeadlineSuccess){
    //         if (state.deadlineModel.status ==
    //             null ||
    //             (DateTime.now().compareTo(
    //                 DateTime.parse(state
    //                     .deadlineModel
    //                     .startDate!)) <
    //                 0)
    //         // (DateTime.now().compareTo(DateTime.parse('2022-09-30 21:00:00')) < 0)
    //         )
    //         {
    //           isNotVotedAny = true;
    //         }
    //         else if (state
    //             .deadlineModel.status ==
    //             'CONFLICT' ||
    //             state.deadlineModel.status ==
    //                 'TAKING_PLACE')
    //         {
    //           isVoted = true;
    //         }
    //         else if (state
    //             .deadlineModel.status ==
    //             'COMPLETED') {
    //           isCompleted = true;
    //         }
    //       }
    //       return const Offstage();
    //     }
    // );
    // bool isGenreVoted = true;
    // BlocBuilder<BookBloc,BookState>(
    //     builder: (context,state){
    //       print(state);
    //       if(state is VoteListSuccess) {
    //         for (int i = 0; i < 4; i++) {
    //           if (state.votes[i].voted ==
    //               false) {
    //             isGenreVoted = false;
    //           }
    //         }
    //       }
    //       return const Offstage();
    //     }
    // );
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<BookBloc,BookState>(
            builder: (context, state) {
              if (kDebugMode) {
                print(state);
              }
              if(state is DeadlineSuccess){
                return Stack(
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
                                              Navigator.of(context,
                                                  rootNavigator: true)
                                                  .pushNamed(CourseRoute);
                                            },
                                            title: 'Курсы',
                                            path: 'assets/images/courseIcon.png',
                                          ),
                                          const Spacer(),
                                          GestureWidget(
                                            onTap: (){
                                              if(state.list.isEmpty) {
                                                isGenreVoted = false;
                                              } else {
                                                for (int i = 0; i < 4; i++) {
                                                  if (state.list[i].voted ==
                                                      true) {
                                                    isGenreVoted = true;
                                                  }
                                                }
                                              }


                                              if(state.deadlineModel.bookGroupId == null) {
                                                isNotGroup = true;
                                              }
                                              if ((state.deadlineModel.status == null ||
                                                  (DateTime.now().compareTo(DateTime.parse(state.deadlineModel.startDate!)) < 0) ||
                                                  (state.deadlineModel.status == 'CONFLICT' && (DateTime.now().compareTo(DateTime.parse(state.deadlineModel.startDate!)) < 0)) ||
                                                  (state.deadlineModel.status == 'TAKING_PLACE' && (DateTime.now().compareTo(DateTime.parse(state.deadlineModel.startDate!)) < 0))
                                              // (DateTime.now().compareTo(DateTime.parse('2022-09-30 21:00:00')) < 0)
                                              ) && !isNotGroup)
                                              {
                                                isVotingNotStarted = true;
                                              }
                                              else if (((state.deadlineModel.status == 'CONFLICT' && isGenreVoted) ||
                                                  (state.deadlineModel.status == 'CONFLICT' && (DateTime.now().compareTo(DateTime.parse(state.deadlineModel.endDate!)) > 0)) ||
                                                  (state.deadlineModel.status == 'TAKING_PLACE' && (DateTime.now().compareTo(DateTime.parse(state.deadlineModel.endDate!)) > 0)) ||
                                                  (state.deadlineModel.status == 'TAKING_PLACE' && isGenreVoted)
                                              ) && !isNotGroup)
                                              //  if (state
                                              //     .deadlineModel.status ==
                                              //     'CONFLICT' ||
                                              //     state.deadlineModel.status ==
                                              //         'TAKING_PLACE')
                                              {
                                                isVotedAndShowDeadline = true;
                                              }
                                              else if((((state.deadlineModel.status == 'CONFLICT') && (DateTime.now().compareTo(DateTime.parse(state.deadlineModel.endDate!)) < 0) && (DateTime.now().compareTo(DateTime.parse(state.deadlineModel.startDate!)) > 0) && !isGenreVoted) ||
                                              ((state.deadlineModel.status == 'TAKING_PLACE') && (DateTime.now().compareTo(DateTime.parse(state.deadlineModel.endDate!)) < 0) && (DateTime.now().compareTo(DateTime.parse(state.deadlineModel.startDate!)) > 0) && !isGenreVoted)
                                              ) && !isNotGroup)
                                              {
                                                isNotVotedAndShowGenre = true;
                                              }
                                              else if ((state.deadlineModel.status == 'COMPLETED') && !isNotGroup) {
                                                isCompleted = true;
                                              }

                                              if(isCompleted) {
                                                Navigator.of(
                                                    context, rootNavigator: true)
                                                    .pushNamed(MainBookRoute);
                                              }
                                              else if(isVotedAndShowDeadline){
                                                Navigator.of(context, rootNavigator: true).pushNamed(TimerRoute);
                                              }
                                              else if(isNotVotedAndShowGenre) {
                                                Navigator.of(context, rootNavigator: true).popAndPushNamed(JenreRoute);
                                              }
                                              else if(isVotingNotStarted || isNotGroup){
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                      const VoteNotStartedScreen()),
                                                );
                                              }
                                              else if(isNotGroup){
                                                Navigator.of(context, rootNavigator: true).pushNamed(ReadBooksRoute);
                                              }
                                              
                                            },
                                            title: 'Книги',
                                            path: 'assets/images/newBookIcon.png',
                                          ),
                                          const Spacer(),
                                          GestureWidget(
                                            onTap: () {},
                                            title: 'M Passport',
                                            path:'assets/images/passportIcon.png',
                                          ),
                                          const Spacer(),
                                          GestureWidget(
                                            onTap: () {},
                                            title: 'Статистика',
                                            path:'assets/images/statisticsIcon.png',
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
                                                  style: TextStyles.boldStyle.copyWith(
                                                    fontSize: 24,
                                                    color: Colors.black,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                sizedBoxHeight8(),
                                                Text(
                                                  'КУРСОВ',
                                                  style: TextStyles.boldStyle.copyWith(
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
                                                  style: TextStyles.boldStyle.copyWith(
                                                    fontSize: 24,
                                                    color: Colors.black,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                sizedBoxHeight8(),
                                                Text(
                                                  'КНИГ',
                                                  style: TextStyles.boldStyle.copyWith(
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
                                                  style: TextStyles.boldStyle.copyWith(
                                                    fontSize: 24,
                                                    color: Colors.black,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                sizedBoxHeight8(),
                                                Text(
                                                  'ЗАДАНИЙ',
                                                  style: TextStyles.boldStyle.copyWith(
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
                                          padding: const EdgeInsets.fromLTRB(12, 8, 16, 8),
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
                                                                  child: Image.asset(
                                                                    'assets/images/avataricon1.png',
                                                                    // color: Colors.red,
                                                                  )),
                                                            ),
                                                            Positioned(
                                                              left: 18,
                                                              child: ClipOval(
                                                                child: CircleAvatar(
                                                                    radius: 12,
                                                                    child: Image.asset(
                                                                        'assets/images/avataricon2.png')),
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 36,
                                                              child: ClipOval(
                                                                child: CircleAvatar(
                                                                  backgroundColor:
                                                                  const Color(
                                                                      0xff3D3DD8),
                                                                  radius: 12,
                                                                  child: Text(
                                                                    '+21',
                                                                    style: TextStyles
                                                                        .regularStyle
                                                                        .copyWith(
                                                                      fontSize: 13,
                                                                      color: Colors
                                                                          .white,
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
                                                          color: const Color(0xFF767676),
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
                                          padding: const EdgeInsets.fromLTRB(12, 8, 16, 8),
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
                                                                color: Color(0xff767676),
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
                );
              }
              return const Offstage();
            },
          )
        ),
      ),
    );
  }
}