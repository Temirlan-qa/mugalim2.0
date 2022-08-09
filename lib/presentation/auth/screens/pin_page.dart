import 'package:flutter/material.dart';
import 'package:mugalim/presentation/main/done.dart';
import 'package:mugalim/presentation/main/select_jenre.dart';
import 'package:mugalim/presentation/auth/screens/success.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'dart:async';
import 'dart:math';

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
  void next_step(){

  }
  String? row_color;
  int pin_page = 0;
  @override
  void dispose() {
    // TODO: implement dispose
    controllerPin1.dispose();
    controllerPin2.dispose();
    controllerPin3.dispose();
    controllerPin4.dispose();
    super.dispose();
  }

  var hasError = true;
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
                // Text('1111 is ur password'),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Container(
                //       width: 46,
                //       height: 56,
                //       decoration: BoxDecoration(
                //         color: Color(0xffE0E0E0),
                //         borderRadius: BorderRadius.circular(5),
                //       ),
                //       child: TextFormField(
                //         textInputAction: TextInputAction.next,
                //         maxLength: 1,
                //         keyboardType: TextInputType.number,
                //         autofocus: true,
                //         controller: controllerPin1,
                //         textAlign: TextAlign.center,
                //         decoration: const InputDecoration(
                //           hintText: '•',
                //           counterText: "",
                //           border: InputBorder.none,
                //           hintStyle: TextStyle(
                //             height: 1.3,
                //             fontSize: 29,
                //             fontWeight: FontWeight.w700,
                //             fontStyle: FontStyle.normal,
                //             color: Color(0xFF767676),
                //             fontFamily: 'font/Cera Pro Black.ttf',
                //           ),
                //         ),
                //         style: TextStyle(
                //           height: 1.3,
                //           fontSize: 29,
                //           fontWeight: FontWeight.w700,
                //           fontStyle: FontStyle.normal,
                //           color: !hasError ? Color(0xFFE71D36) : Color(0xff3D3DD8),
                //           fontFamily: 'font/Cera Pro Black.ttf',
                //         ),
                //
                //       ),
                //     ),
                //     SizedBox(
                //       width: 16,
                //     ),
                //     Container(
                //       width: 46,
                //       height: 56,
                //       decoration: BoxDecoration(
                //         color: Color(0xffE0E0E0),
                //         borderRadius: BorderRadius.circular(5),
                //       ),
                //       child: TextFormField(
                //         textInputAction: TextInputAction.next,
                //         maxLength: 1,
                //         keyboardType: TextInputType.number,
                //         autofocus: true,
                //         controller: controllerPin2,
                //         textAlign: TextAlign.center,
                //         decoration: InputDecoration(
                //           hintText: '•',
                //           counterText: "",
                //           border: InputBorder.none,
                //           hintStyle: TextStyle(
                //             height: 1.3,
                //             fontSize: 29,
                //             fontWeight: FontWeight.w700,
                //             fontStyle: FontStyle.normal,
                //             color: Color(0xFF767676),
                //             fontFamily: 'font/Cera Pro Black.ttf',
                //           ),
                //         ),
                //         style: TextStyle(
                //           height: 1.3,
                //           fontSize: 29,
                //           fontWeight: FontWeight.w700,
                //           fontStyle: FontStyle.normal,
                //           color:
                //               !hasError ? Color(0xFFE71D36) : Color(0xff3D3DD8),
                //           fontFamily: 'font/Cera Pro Black.ttf',
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 16,
                //     ),
                //     Container(
                //       width: 46,
                //       height: 56,
                //       decoration: BoxDecoration(
                //         color: Color(0xffE0E0E0),
                //         borderRadius: BorderRadius.circular(5),
                //       ),
                //       child: TextFormField(
                //         textInputAction: TextInputAction.next,
                //         maxLength: 1,
                //         keyboardType: TextInputType.number,
                //         autofocus: true,
                //         controller: controllerPin3,
                //         textAlign: TextAlign.center,
                //         decoration: InputDecoration(
                //           hintText: '•',
                //           counterText: "",
                //           border: InputBorder.none,
                //           hintStyle: TextStyle(
                //             height: 1.3,
                //             fontSize: 29,
                //             fontWeight: FontWeight.w700,
                //             fontStyle: FontStyle.normal,
                //             color: Color(0xFF767676),
                //             fontFamily: 'font/Cera Pro Black.ttf',
                //           ),
                //         ),
                //         style: TextStyle(
                //           height: 1.3,
                //           fontSize: 29,
                //           fontWeight: FontWeight.w700,
                //           fontStyle: FontStyle.normal,
                //           color:
                //               !hasError ? Color(0xFFE71D36) : Color(0xff3D3DD8),
                //           fontFamily: 'font/Cera Pro Black.ttf',
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 16,
                //     ),
                //     Container(
                //       width: 46,
                //       height: 56,
                //       decoration: BoxDecoration(
                //         color: Color(0xffE0E0E0),
                //         borderRadius: BorderRadius.circular(5),
                //       ),
                //       child: TextFormField(
                //         textInputAction: TextInputAction.done,
                //         maxLength: 1,
                //         keyboardType: TextInputType.number,
                //         autofocus: true,
                //         controller: controllerPin4,
                //         onEditingComplete: (){
                //           if (pin_page == 0) {
                //             setState(() {
                //               startTimer();
                //               pin_page = 1;
                //               print(pin_page);
                //             });
                //           } else if(pin_page == 1){
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => JenreScreen(
                //                   index_month: 0,
                //                   list: [
                //                     'Бизнес',
                //                     'Классика',
                //                     'Развитие',
                //                     'Фантастика'
                //                   ],
                //                 ),
                //               ),
                //             );
                //           }
                //         },
                //         textAlign: TextAlign.center,
                //         decoration: InputDecoration(
                //           hintText: '•',
                //           counterText: "",
                //           border: InputBorder.none,
                //           hintStyle: TextStyle(
                //             height: 1.3,
                //             fontSize: 29,
                //             fontWeight: FontWeight.w700,
                //             fontStyle: FontStyle.normal,
                //             color: Color(0xFF767676),
                //             fontFamily: 'font/Cera Pro Black.ttf',
                //           ),
                //         ),
                //         style: TextStyle(
                //           height: 1.3,
                //           fontSize: 29,
                //           fontWeight: FontWeight.w700,
                //           fontStyle: FontStyle.normal,
                //           color:
                //               !hasError ? Color(0xFFE71D36) : Color(0xff3D3DD8),
                //           fontFamily: 'font/Cera Pro Black.ttf',
                //         ),
                //
                //       ),
                //     ),
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Container(
                //       height: 1,
                //       width: 46,
                //       color: controllerPin1.text == null
                //           ? Color(0xff3D3DD8)
                //           : Color(0xFF767676),
                //     ),
                //     SizedBox(
                //       width: 16,
                //     ),
                //     Container(
                //       height: 1,
                //       width: 46,
                //       color: controllerPin2.text == null
                //           ? Color(0xff3D3DD8)
                //           : Color(0xFF767676),
                //     ),
                //     SizedBox(
                //       width: 16,
                //     ),
                //     Container(
                //       height: 1,
                //       width: 46,
                //       color: controllerPin3.text == null
                //           ? Color(0xff3D3DD8)
                //           : Color(0xFF767676),
                //     ),
                //     SizedBox(
                //       width: 16,
                //     ),
                //     Container(
                //       height: 1,
                //       width: 46,
                //       color: controllerPin4.text == null
                //           ? Color(0xff3D3DD8)
                //           : Color(0xFF767676),
                //     ),
                //   ],
                // ),

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
                        color: !hasError ? Color(0xFFE71D36):Color(0xff3D3DD8),
                        fontFamily: 'font/Cera Pro Black.ttf'),
                    onTextChanged: (text) {
                      if(controllerPin.text.toString() != '1111'){
                        setState(() {
                          hasError = true;
                          this.hasError = true;
                        });
                        print(text);
                      }
                      setState(() {
                        row_color =text;
                      });
                    },
                    // Error
                    hasError: hasError,
                    errorBorderColor: Color(0xFFE71D36),
                    onDone: (value) {
                      if (pin_page == 0 && controllerPin.text.toString() == '1111') {
                        setState(() {
                          startTimer();
                          pin_page = 1;
                          print(pin_page);
                        });
                      } else if(pin_page == 1 && controllerPin.text.toString() == '1111'){
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
                      }else if(controllerPin.text.toString() != '1111'){
                        setState(() {
                          hasError = true;
                          this.hasError = true;
                        });
                      }
                    },
                ),
              ],
            ),
    );
  }
}
