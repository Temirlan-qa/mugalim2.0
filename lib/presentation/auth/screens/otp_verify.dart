import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/presentation/auth/screens/pin_page.dart';

import '../../../core/const/const_color.dart';
import '../../../core/const/text_style_const.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key,required this.loginEditingControllerText,}) : super(key: key);
  final String loginEditingControllerText;
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  int start = 0;
  bool wait = true;
  late Timer timer;
  void startTimer() {
    start = 60;
    if(wait == true) wait = false;
    const onsec = Duration(seconds: 1);
    timer = Timer.periodic(onsec, (timer) {
      if (start <= 0) {
        setState(() {
          wait = true;
          timer.cancel();
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }


  bool obscureText = true;
  List list = ['Бизнес', 'Классика', 'Развитие', 'Фантастика'];
  TextEditingController loginEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  bool validation = false;
  bool loading = false;
  bool wrongPassOrLog = false;
  bool emptyText = true;
  bool otp = false;
  int count = 0;
  String pinCode = "";
  @override
  Widget build(BuildContext context) {
    var random = new Random();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    String randomNum(){
      count++;
      String pinCode1 = "";
      for(int i = 0; i < 4; i++){
        int a = random.nextInt(9);
        pinCode1 += a.toString();
      }
      return pinCode1;
    }
    if(count == 0) {
      pinCode = randomNum();
    }
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: new DecorationImage(image: AssetImage('assets/images/home-2.png'),fit: BoxFit.cover,),
            ),
          ),
          Positioned(
            top: 92,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: (width-343)/2),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.75),
                  borderRadius: BorderRadius.circular(12),
                ),
                width: 343,
                // height: 316,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          if(count > 1) timer.cancel();
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back_ios_new),
                            SizedBox(width: 28,),
                            Text(
                              'SMS-кодты енгізіңіз',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontFamily: 'CeraPro',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Телефон нөмірі, pinCode = $pinCode',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'CeraPro',
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        // obscureText: true,
                        readOnly: true,
                        onChanged: (value) {
                          setState(() {
                            validation = false;
                            wrongPassOrLog = false;
                            emptyText = false;
                          });
                        },
                        style: TextStyles.mediumStyle.copyWith(fontSize: 14, color: ColorStyles.neutralsTextPrimaryColor),
                        obscuringCharacter: '*',
                        textAlignVertical: TextAlignVertical.bottom,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: '${widget.loginEditingControllerText}',
                          hintStyle: TextStyles.mediumStyle.copyWith(fontSize: 16, color: Color(0xff767676)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: ColorStyles.neutralsBorderColor,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: ColorStyles.primaryBorderColor,
                            ),
                          ),
                          constraints: BoxConstraints(
                              maxHeight: 48
                          ),
                          // contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 6),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        'SMS-код',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'CeraPro',
                        ),
                      ),
                      SizedBox(height: 8,),
                      TextFormField(

                        controller: loginEditingController,
                        // obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            validation = false;
                            wrongPassOrLog = false;
                            emptyText = false;
                          });
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                        ],
                        style: TextStyles.mediumStyle.copyWith(
                          fontSize: 16,
                          color: ColorStyles.neutralsTextPrimaryColor,
                          letterSpacing: obscureText ? 3.0 : 0,
                        ),
                        obscuringCharacter: '•',
                        obscureText: obscureText,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: validation ? ColorStyles.errorBorderColor : ColorStyles.neutralsBorderColor,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: validation ? ColorStyles.errorBorderColor : ColorStyles.primaryBorderColor,
                            ),
                          ),
                          constraints: BoxConstraints(
                              maxHeight: 48
                          ),
                          suffixIcon: CupertinoButton(
                            minSize: 0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            child: !validation ? Icon(
                              obscureText ? Icons.visibility_off_outlined :
                              Icons.visibility_outlined,
                              size: 24,
                              color: Color(0xff3D3DD8),
                            ) :
                            SvgPicture.asset('assets/icons/errorIcon.svg'),
                          ),
                          // contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 6),
                        ),
                      ),
                      validation ? SizedBox(height: 8,) : Offstage(),
                      validation ?
                      Text(
                        "Қате SMS-коды",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'CeraPro',
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.errorBorderColor,
                        ),
                      )
                      : Offstage(),
                      SizedBox(height: 20,),
                      TextButton(
                        child: Text(
                          "Кіру",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'CeraPro',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: loginEditingController.text == '' ?  Color(0xff1A1A1A) : Colors.white,
                          backgroundColor: loginEditingController.text == '' ? Color(0xffE0E0E0) : Color(0xff3D3DD8),
                          minimumSize: Size(343, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: () {
                          if(count > 1) timer.cancel();
                          setState(() {
                            start = 0;
                          });

                          if(loginEditingController.text == pinCode && loginEditingController.text != ''){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PinPage()
                              ),
                            );
                          }
                          else{
                            setState(() {
                              validation = true;
                            });
                          }
                        },
                      ),
                      SizedBox(height: 8,),
                      start != 0 ? TextButton(
                        child: Text(
                          start != null ?
                          "SMS-кодты қайта жіберу ${start}" : "SMS-кодты қайта жіберу",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'CeraPro',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: Color(0xffE0E0E0),
                          minimumSize: Size(343, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: () {

                        },
                      ) :
                      TextButton(
                        child: Text(
                          "SMS-кодты қайта жіберу",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'CeraPro',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Color(0xff3D3DD8),
                          minimumSize: Size(343, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: () {
                          startTimer();
                          setState(() {
                            pinCode = randomNum();
                            print(pinCode);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
