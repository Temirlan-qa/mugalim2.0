import 'package:flutter/material.dart';
import 'package:mugalim/presentation/main/done.dart';
import 'package:mugalim/presentation/main/select_jenre.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class PinPage extends StatefulWidget {
  PinPage({Key? key}) : super(key: key);

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  TextEditingController controllerPin = TextEditingController();
  List list = ['Бизнес', 'Классика', 'Развитие', 'Фантастика'];
  @override
  void dispose() {
    // TODO: implement dispose
    controllerPin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
              onPressed: () {},
              icon: Icon(Icons.cancel_outlined)),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 96),
          Align(
            alignment: Alignment.center,
            child: const Text(
              'PIN-кодын қайта жазыңыз',
              style: TextStyle(
                  color: Color(0xff1A1A1A),
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  fontFamily: 'font/Cera Pro Black.ttf'),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Жеке деректердің қауіпсіздігі үшін\n PIN-кодын қайта жазыңыз',
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
          Stack(children: [
            Visibility(
              visible: controllerPin == null ,
                child: Container()
            ),
            PinCodeTextField(
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
              pinTextStyle: const TextStyle(
                  height: 1.3,
                  fontSize: 29,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  color: Color(0xff3D3DD8),
                  fontFamily: 'font/Cera Pro Black.ttf'),
              onDone: (value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => JenreScreen(index_month: 0, list: list)));
              },
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 1,
                width: 46,
                color: controllerPin.text.isNotEmpty
                    ? Color(0xFF767676)
                    : Color(0xff3D3DD8),
              ),
              SizedBox(
                width: 16,
              ),
              Container(
                height: 1,
                width: 46,
                color: controllerPin.text == '' || controllerPin.text.isEmpty
                    ? Color(0xFF767676)
                    : Color(0xff3D3DD8),
              ),
              SizedBox(
                width: 16,
              ),
              Container(
                height: 1,
                width: 46,
                color: controllerPin.text == ''
                    ? Color(0xFF767676)
                    : Color(0xff3D3DD8),
              ),
              SizedBox(
                width: 16,
              ),
              Container(
                height: 1,
                width: 46,
                color: controllerPin.text == ''
                    ? Color(0xFF767676)
                    : Color(0xff3D3DD8),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
