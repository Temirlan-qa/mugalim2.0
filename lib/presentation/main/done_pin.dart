import 'package:flutter/material.dart';

class DoneCheckPin extends StatelessWidget {
  const DoneCheckPin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
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
            const SizedBox(height: 134),
            Container(
                height: 53,
                width: 53,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: const ImageIcon(
                  AssetImage("assets/icons/Icon.png"),
                  color: Color(0xff3C8505),
                )),
            const SizedBox(height: 13.34),
            const Text(
              'Сәтті аяқталды!',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 23,
                  color: Color(0xff1A1A1A),
                  letterSpacing: 0.2),
            )
          ],
        ),
      );
}
