import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:mugalim/presentation/main/done_pin.dart';

class PINCode extends StatefulWidget {
  const PINCode({Key? key}) : super(key: key);

  @override
  State<PINCode> createState() => _PINCodeState();
}

class _PINCodeState extends State<PINCode> {
  TextEditingController controllerPin = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    focusNode.dispose();
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
              SizedBox(width: 59),
              Container(
                height: 27,
                width: 27,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: IconButton(
                    color: Color(0xff3D3DD8),
                    onPressed: () {},
                    icon: Icon(Icons.cancel_outlined)),
              )
            ],
          ),
          const SizedBox(height: 96),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 37),
              IconButton(
                  color: Color(0xff3D3DD8),
                  onPressed: () {},
                  icon: Icon(Icons.keyboard_arrow_left)),
              Text(
                'PIN-кодын қайта жазыңыз',
                style: TextStyle(
                    color: Color(0xff1A1A1A),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    fontFamily: 'font/Cera Pro Black.ttf'),
              )
            ],
          ),
          SizedBox(height: 8),
          Container(
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
          SizedBox(height: 32),
          PinCodeFields(

            controller: controllerPin,
            focusNode: focusNode,
            length: 4,
            fieldBorderStyle: FieldBorderStyle.Square,
            responsive: false,
            fieldHeight:56.0,
            fieldWidth: 48.0,
            borderColor: Color(0XFFE0E0E0),
            borderRadius: BorderRadius.circular(4),
            keyboardType: TextInputType.number,
            autoHideKeyboard: false,
            activeBackgroundColor: Color(0XFFE0E0E0),
            fieldBackgroundColor: Color(0XFFE0E0E0),
            activeBorderColor: Color(0XFFE0E0E0),
            autofocus: false,
            textStyle: TextStyle(
              fontSize: 29.0,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              color: Color(0xff3D3DD8),
                fontFamily: 'font/Cera Pro Black.ttf'
            ),

            onComplete: (output) {
              // Your logic with pin code
              print(output);
              Navigator.push(context, MaterialPageRoute(builder: (context) => DoneCheckPin()));
            },
          ),
        ],
      ),
    );
  }
}
