import 'package:flutter/material.dart';
import 'package:mugalim/presentation/main/select_jenre.dart';

import '../../core/const/const_color.dart';

class ChoosenPage extends StatelessWidget {
  const ChoosenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>  Scaffold(
    backgroundColor: ColorStyles.neutralsPageBackgroundColor,
    body: Stack(
      children: [
        Center(
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
                  AssetImage("assets/icons/Icon.png"),
                  color: Color(0xff3C8505),
                )
              ),
              const SizedBox(height: 22),
              const Text(
                'Книги выбраны',
                style: TextStyle(
                  color: Color(0xff1A1A1A),
                  fontSize: 31,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'font/Cera Pro Black.ttf',
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    'Ожидайте завершения голосования, после ваши книги для чтения в этом семестре будут доступны!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height:1.5,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1A1A1A),
                        fontSize: 16,
                        fontFamily: 'font/Cera Pro Black.ttf',
                    ),
                  ),
                ),



            ]
          ),
        ),
        Positioned(
          bottom: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0),
            child: Column(
              children: [
                TextButton(
                  child: Text(
                    "На главную",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'CeraPro',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    primary: Color(0xFFE0E0E0),
                    backgroundColor: Color(0xff3D3DD8),
                    elevation: 3,
                    minimumSize: Size(
                        MediaQuery.of(context).size.width-32, 48
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed:() {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => JenreScreen(index_month: 0,list: ['Сентября', 'Октября', 'Ноября','Декабря'],)
                    //   ),
                    // );
                  },
                ),
                SizedBox(height: 20,),
                const Text('Изменить', style: TextStyle(color: Color(0xff3D3DD8), fontStyle: FontStyle.normal, fontWeight: FontWeight.w500),)
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
