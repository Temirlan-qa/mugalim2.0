import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import '../../../core/const/const_color.dart';
import '../../../core/const/text_style_const.dart';
import 'auth_gmail.dart';
import 'otp_verify.dart';


class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {

  Box accessToken = Hive.box('tokens');
  TextEditingController EditingController = TextEditingController();
  bool validation = false;
  bool loading = false;
  bool wrongPassOrLog = false;
  bool emptyText = true;
  bool otp = false;
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                      Text(
                        'Қош келдіңіздер!',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontFamily: 'CeraPro',
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Телефон нөмірін енгізіңіз',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: 'CeraPro',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Телефон нөмірі',
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
                        controller: EditingController,
                        // obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            validation = false;
                            wrongPassOrLog = false;
                            emptyText = false;
                          });
                        },
                        style: TextStyles.regularStyle.copyWith(fontSize: 14, color: ColorStyles.neutralsTextPrimaryColor),
                        obscuringCharacter: '*',
                        textAlignVertical: TextAlignVertical.bottom,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          prefix: Text('+7 '),
                          hintStyle: TextStyles.regularStyle.copyWith(fontSize: 14, color: ColorStyles.neutralsTextTertiaryColor),
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
                          // contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 6),
                        ),
                      ),

                      SizedBox(height: 20,),
                      TextButton(
                        child: Text(
                          "SMS-кодты жіберу",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'CeraPro',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: EditingController.text != ''  ? Colors.white : Color(0xff1A1A1A),
                          backgroundColor: EditingController.text != '' ? Color(0xff3D3DD8) : Color(0xffE0E0E0),
                          minimumSize: Size(343, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            if(EditingController.text != '') otp = true;
                          });
                          if(otp == true && EditingController.text != '') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OTPScreen(loginEditingControllerText: EditingController.text,)
                              ),
                            );
                          }
                          print(EditingController.text);
                        },
                      ),
                      SizedBox(height: 8,),
                      TextButton(
                        child: Text(
                          "Пошта арқылы кіру",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'CeraPro',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Color(0xff3D3DD8),
                          // backgroundColor: Colors.white.withOpacity(0.5),
                          minimumSize: Size(343, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AuthGmailScreen()
                            ),
                          );
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
