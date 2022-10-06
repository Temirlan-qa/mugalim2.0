// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:mugalim/presentation/main/done_pin.dart';

class PINCode extends StatefulWidget {
  const PINCode({Key? key}) : super(key: key);

  @override
  State<PINCode> createState() => _PINCodeState();
}

class _PINCodeState extends State<PINCode> {
  TextEditingController controllerPin = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    controllerPin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                height: 37,
                width: 295,
                padding: const EdgeInsets.only(left: 16, top: 10),
                child: const Text(
                  'Жедел авторландыру',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'font/Cera Pro Black.ttf',
                      color: Color(0xff1A1A1A),
                      letterSpacing: 0.2),
                ),
              ),
              const SizedBox(width: 59),
              Container(
                height: 27,
                width: 27,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: IconButton(
                    color: const Color(0xff3D3DD8),
                    onPressed: () {},
                    icon: const Icon(Icons.cancel_outlined)),
              )
            ],
          ),
          const SizedBox(height: 96),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 37),
              IconButton(
                  color: const Color(0xff3D3DD8),
                  onPressed: () {},
                  icon: const Icon(Icons.keyboard_arrow_left)),
              const Text(
                'PIN-кодын қайта жазыңыз',
                style: TextStyle(
                    color: Color(0xff1A1A1A),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    fontFamily: 'font/Cera Pro Black.ttf'),
              )
            ],
          ),
          const SizedBox(height: 8),
          const SizedBox(
              width: 296,
              height: 40,
              child: Text(
                'Жеке деректердің қауіпсіздігі үшін PIN-кодын қайта жазыңыз',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'font/Cera Pro Black.ttf',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: Color(0xff767676)),
              )),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(left: 67, right: 67),
            child: PinCodeTextField(
                controller: controllerPin,
                pinBoxHeight: 58,
                pinBoxWidth: 46,
                maxLength: 4,
                hasUnderline: true,
                hasTextBorderColor:const Color(0xff3D3DD8),
                wrapAlignment: WrapAlignment.spaceEvenly,
                pinBoxBorderWidth: 0.0001,
                highlightPinBoxColor: const Color(0xffE0E0E0),
                highlightColor: const Color(0xffE0E0E0),
                highlight: true,
                pinBoxOuterPadding: const EdgeInsets.only(left: 8, right: 8),
                defaultBorderColor: const Color(0xffE0E0E0),
                pinBoxColor: const Color(0xffE0E0E0),
                pinBoxRadius: 4,
                keyboardType: TextInputType.number,
                pinTextStyle: const TextStyle(
                    fontSize: 29.0,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    color: Color(0xff3D3DD8),
                    fontFamily: 'font/Cera Pro Black.ttf'),
                onDone: (value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DoneCheckPin()));
                }),
          )
        ],
      ),
    );
  }
}
