import 'package:flutter/material.dart';
import 'package:mugalim/presentation/books/screens/bookMain/timer_screen.dart';
import 'package:mugalim/presentation/books/screens/selectBook/select_jenre.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/routes/routes_const.dart';

import '../../../../core/const/const_color.dart';

class ChoosenPage extends StatelessWidget {
  const ChoosenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorStyles.neutralsPageBackgroundColor,
        body: Stack(
          children: [
            Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 182),
                    Lottie.asset(
                      repeat: false,
                      'assets/animations/success.json',
                      width: 72,
                      height: 72,
                      fit: BoxFit.fill,
                    ),
                    // Container(
                    //     height: 60,
                    //     width: 60,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(4)),
                    //     child: const ImageIcon(
                    //       AssetImage("assets/icons/Icon.png"),
                    //       color: Color(0xff3C8505),
                    //     )),
                    const SizedBox(height: 22),
                    const Text(
                      'Книги выбраны',
                      style: TextStyle(
                        color: Color(0xff1A1A1A),
                        fontSize: 31,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'font/Cera Pro Black.ttf',
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        'Ожидайте завершения голосования, после ваши книги для чтения в этом семестре будут доступны!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1A1A1A),
                          fontSize: 16,
                          fontFamily: 'font/Cera Pro Black.ttf',
                        ),
                      ),
                    ),
                  ]),
            ),
            Positioned(
              bottom: 56,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Column(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: const Color(0xFFE0E0E0),
                          backgroundColor: const Color(0xff3D3DD8),
                          elevation: 3,
                          minimumSize: const Size(343, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const TimerScreen()),
                          // );
                          Navigator.of(context, rootNavigator: true)
                              .pushNamed(TimerRoute);
                        },
                        child: const Text(
                          "На главную",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'CeraPro',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: const Color(0xff3D3DD8),
                          backgroundColor:
                              ColorStyles.neutralsPageBackgroundColor,
                          minimumSize: const Size(343, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GenreScreen(
                                      indexMonth: 0,
                                      list: const [
                                        'Бизнес',
                                        'Классика',
                                        'Развитие',
                                        'Фантастика'
                                      ],
                                    )),
                          );
                        },
                        child: const Text(
                          "Изменить",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'CeraPro',
                            fontWeight: FontWeight.w500,
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
      );
}
