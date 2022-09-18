import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:mugalim/presentation/auth/screens/verify_phone.dart';

import 'package:mugalim/presentation/welcome_screen/widgets/transformer.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroScreen> with TickerProviderStateMixin {
  IndexController? indexController;
  Duration? _duration;

  int currentPage = 0;
  var onBoarding = Hive.box('onBoarding');
  @override
  void initState() {
    indexController = IndexController();
    _duration = const Duration(milliseconds: 600);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    List<Map<String, dynamic>> splashData = [
      {
        "text": 'Mugalim мобильді\n қосымшасына қош келдіңіз!',
        'subtext': '',
        "image": "assets/images/MugalimLogo.png",
        "opacity": false,
      },
      {
        "text": 'Онлайн курстар',
        'subtext': 'Болашақ мұғалімге арналған арнайы\n онлайн курстар',
        "image": "assets/images/page1.png",
        "opacity": true,
      },
      {
        "text": 'Кітаптар',
        "image": "assets/images/page2.png",
        'subtext': 'Эксперттер таңдаған кітаптар',
        "opacity": true,
      },
      {
        "text": 'Статистика',
        "image": "assets/images/page3.png",
        'subtext': 'Өз үлгеріміңді жақсарт!',
        "opacity": true,
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              TransformerPageView(
                duration: _duration!,
                controller: indexController!,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value!;
                  });
                },
                transformer: CustomTransformer(),
                itemCount: splashData.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(
                              height: screenHeight / 2,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Image.asset(
                                  splashData[index]['image'],
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              Positioned(
                bottom: 0,
                child: Column(
                  children: <Widget>[
                    IgnorePointer(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            splashData[currentPage]['text'],
                            style: const TextStyle(
                                fontSize: 20,
                                height: 1.2,
                                fontFamily: 'CeraPro',
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    IgnorePointer(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            splashData[currentPage]['subtext'],
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              fontFamily: 'CeraPro',
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF767676),
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 70),
                    SizedBox(
                      height: 12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                              (index) => buildDot(index: index),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 32,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          if (currentPage == 0) {
                            setState(() {
                              indexController?.move(1);
                            });
                          } else if (currentPage == 1) {
                            setState(() {
                              indexController?.move(2);
                            });
                          } else if (currentPage == 2) {
                            setState(
                                  () {
                                indexController?.move(3);
                              },
                            );
                          }
                          else{
                            onBoarding.put('show', true);
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const VerifyScreen(),
                                ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(343, 48),
                          primary: const Color(0xFF3D3DD8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation.drive(
                                Tween<double>(begin: 0.0, end: 1.0).chain(
                                  CurveTween(
                                    curve: const Interval(0.0, 0.5,
                                        curve: Curves.easeIn),
                                  ),
                                ),
                              ),
                              child: FadeTransition(
                                opacity: animation.drive(
                                  Tween<double>(begin: 0.0, end: 1.0).chain(
                                    CurveTween(
                                      curve: const Interval(0.5, 1.0,
                                          curve: Curves.easeIn),
                                    ),
                                  ),
                                ),
                                child: child,
                              ),
                            );
                          },
                          child: Text(
                            currentPage == 3 ? 'Алға!' : 'Әрі қарай >',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'CeraPro',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SafeArea(
                      bottom: false,
                      top: false,
                      child: SizedBox(
                        height: 32,
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: currentPage == 0 ? false : true,
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    child: const Text(
                      'Өткізу',
                      style: TextStyle(
                        color: Color(0xFF3D3DD8),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'CeraPro',
                        fontSize: 13,
                      ),
                    ),
                    onPressed: () {
                      onBoarding.put('show', true);
                      Navigator.push(
                          context,

                          MaterialPageRoute(builder: (context) => const VerifyScreen(),),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.only(right: 4),
      height: 2,
      width: currentPage == index ? 40 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? const Color(0xFF1A1A1A) : const Color(0xFF767676),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
