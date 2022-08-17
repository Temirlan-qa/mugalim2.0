import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/const/const_color.dart';
import '../../books/screens/select_jenre.dart';

class DevelopmentScreen extends StatefulWidget {
  const DevelopmentScreen({Key? key}) : super(key: key);

  @override
  State<DevelopmentScreen> createState() => _DevelopmentScreenState();
}

class _DevelopmentScreenState extends State<DevelopmentScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
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
                        child: Image.asset('assets/images/devImg2.png')
                    ),
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
                              ]
                          ),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.7), width: 4)
                      ),
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                SizedBox(height: 24,),
                                Text(
                                  'Добрый день, Мухаммед!',
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    fontFamily: 'CeraPro',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Сегодня прекрасный день для развития',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontFamily: 'CeraPro',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 24,),
                                Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: Column(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/courseIcon.svg'),
                                          SizedBox(height: 8,),
                                          Text(
                                            'Курсы',
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontFamily: 'CeraPro',
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => JenreScreen(
                                              index_month: 0,
                                              list: list,
                                            ),
                                          ),
                                        );
                                      },
                                      child: SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Column(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icons/bookIcon.svg'),
                                            SizedBox(height: 8,),
                                            Text(
                                              'Книги',
                                              style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontFamily: 'CeraPro',
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: Column(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/passportIcon.svg'),
                                          SizedBox(height: 8,),
                                          Text(
                                            'M Passport',
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontFamily: 'CeraPro',
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: Column(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/statisticsIcon.svg'),
                                          SizedBox(height: 8,),
                                          Text(
                                            'Статистика',
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontFamily: 'CeraPro',
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24,),
                                Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Text(
                                            '57',
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontFamily: 'CeraPro',
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 8,),
                                          Text(
                                            'КУРСОВ',
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontFamily: 'CeraPro',
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: Column(
                                        children: [
                                          Text(
                                            '207',
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontFamily: 'CeraPro',
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 8,),
                                          Text(
                                            'КНИГ',
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontFamily: 'CeraPro',
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: Column(
                                        children: [
                                          Text(
                                            '93',
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontFamily: 'CeraPro',
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 8,),
                                          Text(
                                            'ЗАДАНИЙ',
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontFamily: 'CeraPro',
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
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
                              ]
                          ),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.7), width: 4)
                      ),
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
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontFamily: 'CeraPro',
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  height: 68,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        12, 8, 16, 8),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Жүзу',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontFamily: 'CeraPro',
                                              ),
                                            ),
                                            SizedBox(height: 4,),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 70,
                                                  child: Stack(
                                                    children: [
                                                      ClipOval(
                                                        child: CircleAvatar(
                                                            radius: 12,
                                                            child: SvgPicture.asset('assets/icons/avatar1.svg',color: Colors.red,)
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 18,
                                                        child: ClipOval(
                                                          child: CircleAvatar(
                                                              radius: 12,
                                                              child: SvgPicture.asset('assets/icons/avatar2.svg')
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 36,
                                                        child: ClipOval(
                                                          child: CircleAvatar(
                                                              radius: 12,
                                                              child: SvgPicture.asset('assets/icons/mugalim_logo.png')
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  '120 человек выполнили!',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFF767676),
                                                    fontFamily: 'CeraPro',
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Spacer(),
                                        Icon(
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
                    SizedBox(height: 8,),
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
                              ]
                          ),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.7), width: 4)
                      ),
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
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontFamily: 'CeraPro',
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  height: 68,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        12, 8, 16, 8),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                             Row(
                                              children: [
                                                Image.asset('assets/images/courseImage.png'),
                                                SizedBox(width: 8,),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Figma: начало работы',
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.black,
                                                        fontFamily: 'CeraPro',
                                                      ),
                                                    ),
                                                    SizedBox(height: 20,),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.access_time,size: 15,color: Color(0xff767676),),
                                                        SizedBox(width: 4,),
                                                        Text(
                                                          '1 ч 21 м',
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight: FontWeight.w400,
                                                            color: Color(0xFF767676),
                                                            fontFamily: 'CeraPro',
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
                                        Spacer(),
                                        Icon(
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
                    )
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
