import 'package:flutter/material.dart';

class ChoosenPage extends StatelessWidget {
  const ChoosenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>  Scaffold(
    backgroundColor: const Color(0xffE5E5E5),
    body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 182),
          Container(
            height: 60, width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4)
            ),
            child: const ImageIcon(
              AssetImage("icon/Icon.png"),
              color: Color(0xff3C8505),
            )
          ),
          const SizedBox(height: 22),
          const Text('Книги выбраны', style: TextStyle(color: Color(0xff1A1A1A), fontSize: 31,fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, fontFamily: 'font/Cera Pro Black.ttf')),
          const SizedBox(height: 8),
          const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text('Ожидайте завершения голосования, после ваши книги для чтения в этом семестре будут доступны!', textAlign: TextAlign.center,style: TextStyle(height:1.5,fontWeight: FontWeight.w500, color: Color(0xff1A1A1A), fontSize: 16,  fontFamily: 'font/Cera Pro Black.ttf')
              ),
            ),
          const SizedBox(height: 219),
          Container(height: 48, width: 343, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xff3D3DD8)),
            child: const Center(child: Text('На главную', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, fontFamily: 'font/Cera Pro Black.ttf')))),
          const SizedBox(height: 20),
          const Text('Изменить', style: TextStyle(color: Color(0xff3D3DD8), fontStyle: FontStyle.normal, fontWeight: FontWeight.w500),)


        ]
   ),
    ),
  );
}
