import 'package:flutter/material.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/presentation/main/select_jenre.dart';

class PhotoSliderScreen extends StatefulWidget {
  const PhotoSliderScreen({Key? key}) : super(key: key);

  @override
  State<PhotoSliderScreen> createState() => _PhotoSliderScreenState();
}

class _PhotoSliderScreenState extends State<PhotoSliderScreen> {
  final PageController controller = PageController(initialPage: 0);
  int indexDot = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 69,
          top: 16,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Visibility(
                visible: indexDot == 0 ?false:true,
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    child: Text(
                      'Өткізу',
                      style: TextStyle(
                        color: Color(0xFF3D3DD8),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'CeraPro',
                        fontSize: 13,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JenreScreen(
                              index_month: 0,
                              list: ['Бизнес', 'Классика', 'Развитие', 'Фантастика'],
                            )
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: indexDot == 0 ? 50: 70,
              ),
              Container(
                height: 450,
                child: PageView(
                  // physics: NeverScrollableScrollPhysics(),
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      indexDot = index;
                    });
                  },
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/MugalimLogo.png',
                          fit: BoxFit.cover,
                        ),
                        Column(
                          children: [
                            Text(
                              'Mugalim мобильді',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                height: 1.3,
                                fontFamily: 'CeraPro',
                              ),
                            ),
                            Text(
                              'қосымшасына қош келдіңіз!',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                height: 1.3,
                                fontFamily: 'CeraPro',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/page1.png',
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 85,
                        ),
                        Text(
                          'Онлайн курстар',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'CeraPro',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Болашақ мұғалімге арналған арнайы',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'CeraPro',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF767676),
                          ),
                        ),
                        Text(
                          'онлайн курстар',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'CeraPro',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF767676),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/page2.png',
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 85,
                        ),
                        Text(
                          'Кітаптар',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'CeraPro',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Эксперттер таңдаған кітаптар',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'CeraPro',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF767676),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/page3.png',
                          fit: BoxFit.cover,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 80,
                            ),
                            Text(
                              'Статистика',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'CeraPro',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Өз үлгеріміңді жақсарт!',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'CeraPro',
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF767676),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: indexDot == 0 ? 40 : 6,
                    height: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: indexDot == 0
                          ? Color(0xFF1A1A1A)
                          : Color(0xFF767676),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    width: indexDot == 1 ? 40 : 6,
                    height: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: indexDot == 1
                          ? Color(0xFF1A1A1A)
                          : Color(0xFF767676),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    width: indexDot == 2 ? 40 : 6,
                    height: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: indexDot == 2
                          ? Color(0xFF1A1A1A)
                          : Color(0xFF767676),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    width: indexDot == 3 ? 40 : 6,
                    height: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: indexDot == 3
                          ? Color(0xFF1A1A1A)
                          : Color(0xFF767676),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  if(indexDot == 3){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JenreScreen(
                            index_month: 0,
                            list: ['Бизнес', 'Классика', 'Развитие', 'Фантастика'],
                          )
                      ),
                    );
                  }else{
                    setState(() {
                      indexDot = indexDot+1;
                      print('Page number is $indexDot');
                      controller.jumpToPage(indexDot);
                    });
                  }

                },
                child: Text(
                  indexDot == 3 ?'Алға!':'Әрі қарай >',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'CeraPro',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(343, 48),
                  primary: Color(0xFF3D3DD8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
