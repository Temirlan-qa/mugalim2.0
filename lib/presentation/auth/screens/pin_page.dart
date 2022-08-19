import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/presentation/books/screens/done.dart';
import 'package:mugalim/presentation/auth/screens/success.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'dart:async';
import 'dart:math';

import '../../../core/const/const_color.dart';
import '../../books/screens/select_jenre.dart';

class PinPage extends StatefulWidget {
  PinPage({Key? key}) : super(key: key);

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  TextEditingController controllerPin = TextEditingController();
  TextEditingController controllerPin1 = TextEditingController();
  TextEditingController controllerPin2 = TextEditingController();
  TextEditingController controllerPin3 = TextEditingController();
  TextEditingController controllerPin4 = TextEditingController();
  List list = ['Бизнес', 'Классика', 'Развитие', 'Фантастика'];

  int start = 0;
  bool wait = true;
  int sec = 60;
  late Timer timer;
  void startTimer() {
    start = 1;
    if (wait == true) wait = false;
    const onsec = Duration(milliseconds: 800);
    timer = Timer.periodic(onsec, (timer) {
      if (start <= 0) {
        setState(() {
          wait = true;
          timer.cancel();
          print('timer bitti');
        });
      } else {
        setState(() {
          start--;
          print('Timer ${start}');
        });
      }
    });
  }
  String? first_pin ;
  String? row_color;
  int pin_page = 0;
  @override
  void dispose() {
    // TODO: implement dispose
    controllerPin.dispose();
    controllerPin1.dispose();
    controllerPin2.dispose();
    controllerPin3.dispose();
    controllerPin4.dispose();
    super.dispose();
  }

  var hasError = true;

  var pinCodeData = Hive.box('pinCode');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Жедел авторландыру',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 23,
              fontStyle: FontStyle.normal,
              fontFamily: 'font/Cera Pro Black.ttf',
              color: Color(0xff1A1A1A),
              letterSpacing: 0.2),
        ),
        actions: [
          IconButton(
              color: const Color(0xff3D3DD8),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.cancel_outlined)),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: start == 1
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 182),
                  Container(
                      height: 60,
                      width: 60,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(4)),
                      child: const ImageIcon(
                        AssetImage("assets/icons/Icon.png"),
                        color: Color(0xff3C8505),
                      )),
                  const SizedBox(height: 22),
                  const Text(
                    'Сәтті сақталды!',
                    style: TextStyle(
                      color: Color(0xff1A1A1A),
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'font/Cera Pro Black.ttf',
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                const SizedBox(height: 96),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    pin_page == 0
                        ? 'PIN-кодын ойлап табыңыз'
                        : 'PIN-кодын қайта жазыңыз',
                    style: TextStyle(
                        color: Color(0xff1A1A1A),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        fontFamily: 'font/Cera Pro Black.ttf'),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  pin_page == 0
                      ? 'Жеке деректердің қауіпсіздігі үшін\n PIN-кодын ойлап табыңыз'
                      : 'Жеке деректердің қауіпсіздігі үшін\n PIN-кодын қайта жазыңыз',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'font/Cera Pro Black.ttf',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      height: 1.4,
                      color: Color(0xff767676)),
                ),
                const SizedBox(height: 32),

                PinCodeTextField(
                  autofocus: true,
                  controller: controllerPin,
                  pinBoxHeight: 58,
                  pinBoxWidth: 46,
                  maxLength: 4,

                  hasTextBorderColor: Color(0xff3D3DD8),
                  wrapAlignment: WrapAlignment.spaceEvenly,
                  pinBoxBorderWidth: 0.0001,
                  pinBoxOuterPadding: EdgeInsets.only(left: 8, right: 8),
                  defaultBorderColor: Color(0xffE0E0E0),
                  pinBoxColor: Color(0xffE0E0E0),
                  pinBoxRadius: 4,
                  pinTextStyle: TextStyle(
                      height: 1.3,
                      fontSize: 29,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: hasError ? Color(0xff3D3DD8) :Color(0xFFE71D36),
                      fontFamily: 'font/Cera Pro Black.ttf'),
                  onTextChanged: (text) {
                    if (pin_page == 1 && controllerPin.text != first_pin) {
                      setState(() {
                        this.hasError = true;
                      });
                    }
                  },
                  // Error
                  hasError: hasError,
                  errorBorderColor: Color(0xFFE71D36),
                  onDone: (value) {
                    if (pin_page == 0 ) {
                      setState(() {
                        first_pin = controllerPin.text;
                        startTimer();
                        pin_page = 1;
                        print(pin_page);
                        controllerPin.clear();
                      });
                    }
                    else if (pin_page == 1 && controllerPin.text == first_pin) {
                      pinCodeData.put('pin_data', first_pin);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JenreScreen(
                            index_month: 0,
                            list: [
                              'Бизнес',
                              'Классика',
                              'Развитие',
                              'Фантастика'
                            ],
                          ),
                        ),
                      );
                    }
                    else{
                      hasError = false;
                      Timer(Duration(seconds: 1), () {
                        controllerPin.clear();
                        setState(() {
                          sec++;
                        });
                      });
                    }
                  },
                ),
              ],
            ),
    );

  }
}
