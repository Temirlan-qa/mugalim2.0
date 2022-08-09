import 'package:flutter/material.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/presentation/main/select_jenre.dart';
import 'dart:async';
import 'dart:math';


class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {

  int start = 0;
  bool wait = true;
  late Timer timer;
  void startTimer() {
    start = 1;
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
      body: Stack(
        children: [
          Center(
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
          ),
        ],
      ),
    );
  }
}
