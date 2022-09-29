import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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
  TextEditingController phoneEditingController = TextEditingController();
  bool validation = false;
  bool loading = false;
  bool wrongPassOrLog = false;
  bool emptyText = true;
  bool otp = false;

  var maskFormatter = MaskTextInputFormatter(
      mask: '+7 ### ### ## ##',
      filter: { "#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home-2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 92,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: (width - 343) / 2),
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
                      const Text(
                        'Қош келдіңіздер!',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontFamily: 'CeraPro',
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Телефон нөмірін енгізіңіз',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: 'CeraPro',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Телефон нөмірі',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'CeraPro',
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: phoneEditingController,
                        // obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            validation = false;
                            wrongPassOrLog = false;
                            emptyText = false;
                          });
                        },
                        inputFormatters: [maskFormatter],
                        style: TextStyles.mediumStyle.copyWith(
                            fontSize: 16,
                            color: ColorStyles.neutralsTextPrimaryColor),
                        textAlignVertical: TextAlignVertical.bottom,
                        // keyboardType: TextInputType.number,
                        // inputFormatters:[
                        //   // LengthLimitingTextInputFormatter(11),
                        //   CardFormatter(separator: ' ', sample: 'xx xxx xxx xx xx'),
                        // ],
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyles.mediumStyle.copyWith(
                              fontSize: 16,
                              color: ColorStyles.neutralsTextTertiaryColor),
                          hintText: '+7',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: validation
                                  ? ColorStyles.errorBorderColor
                                  : ColorStyles.neutralsBorderColor,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: validation
                                  ? ColorStyles.errorBorderColor
                                  : ColorStyles.primaryBorderColor,
                            ),
                          ),
                          constraints: const BoxConstraints(maxHeight: 48),
                          // contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 6),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: phoneEditingController.text != ''  ? Colors.white : const Color(0xff1A1A1A),
                          backgroundColor: phoneEditingController.text != '' ? const Color(0xff3D3DD8) : const Color(0xffE0E0E0),
                          minimumSize: const Size(343, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: () {
                          if(phoneEditingController.text != '' && phoneEditingController.text.length == 16) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OTPScreen(loginEditingControllerText: phoneEditingController.text,)
                              ),
                            );
                          } else {
                            setState(() {
                              validation = true;
                            });
                          }
                        },
                        child:  const Text(
                          "SMS-кодты жіберу",
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
                          // backgroundColor: Colors.white.withOpacity(0.5),
                          minimumSize: const Size(343, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthGmailScreen()),
                          );
                        },
                        child: const Text(
                          "Пошта арқылы кіру",
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
          ),
        ],
      ),
    );
  }
}

class CardFormatter extends TextInputFormatter{

  final String separator;
  final String sample;
  CardFormatter({required this.separator,required this.sample});
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > sample.length) return oldValue;
        if (newValue.text.length < sample.length &&
            sample[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text: '${oldValue.text}$separator${newValue.text.substring(
                newValue.text.length-1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
