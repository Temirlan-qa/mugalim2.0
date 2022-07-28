import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mugalim/presentation/main/book_description_screen.dart';
import 'package:mugalim/presentation/main/done.dart';

import '../../core/const/const_color.dart';

class JenreScreen extends StatefulWidget {
  const JenreScreen({Key? key}) : super(key: key);

  @override
  State<JenreScreen> createState() => _JenreScreenState();
}

class _JenreScreenState extends State<JenreScreen> {
  bool select1 = false;
  bool select2 = false;
  bool select3 = false;
  bool select4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(
                  'Выберите жанр ',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'CeraPro',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8,),
                Text(
                  'От этого зависит какую книгу вы будете \nчитать в текущем учебном году ',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'CeraPro',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8,),
                Text(
                  'Книга Сентября:',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'CeraPro',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 125,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                            select1 = !select1;
                            select2 = false;
                            select3 = false;
                            select4 = false;
                          });
                        print('Бизнес == $select1');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          border: Border.all(
                            color: select1 ?Color(0xFF3D3DD8) : Colors.grey,
                            width: 3.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        height: 120,
                        width: 167,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Бизнес',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'CeraPro',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                                ),
                              ),
                            Spacer(),
                            select1

                                ?Image.asset('assets/icons/Check.png')
                                :Container(height: 24,width: 24,color: Colors.grey,),
                          ],
                        ),
                        ),
                      ),
                    SizedBox(width: 8,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          select1 = false;
                          select3 = false;
                          select4 = false;

                          select2 = !select2;
                        });

                        print('Классика == $select2');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          border: Border.all(
                            color: select2 ?Color(0xFF3D3DD8) : Colors.grey,
                            width: 3.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        height: 120,
                        width: 167,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                    'Классика',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'CeraPro',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white
                                    ),
                                  ),
                            Spacer(),
                            select2

                                ?Image.asset('assets/icons/Check.png')
                                :Container(height: 24,width: 24,color: Colors.grey,),
                          ],
                        ),
                              // Icon(Icons.check),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                           select1 = false;
                           select2 = false;
                           select4 = false;
                           select3 = !select3;
                        });

                        print('Развитие == $select3');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          border: Border.all(
                            color: select3 ?Color(0xFF3D3DD8) : Colors.grey,
                            width: 3.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        height: 120,
                        width: 167,
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Развитие',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'CeraPro',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                              ),
                              Spacer(),
                              select3

                                  ?Image.asset('assets/icons/Check.png')
                                  :Container(height: 24,width: 24,color: Colors.grey,),
                            ],
                          ),
                        ),
                      ),

                    SizedBox(width: 8,),
                    InkWell(
                      onTap: (){
                        setState(() {
                           select1 = false;
                           select2 = false;
                           select3 = false;
                           select4 = !select4;
                        });
                        print('Фантастика == $select4');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          border: Border.all(
                            color: select4 ?Color(0xFF3D3DD8) : Colors.grey,
                            width: 3.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        height: 120,
                        width: 167,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Фантастика',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'CeraPro',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                              ),
                            Spacer(),
                            select4

                                ?Image.asset('assets/icons/Check.png')
                                :Container(height: 24,width: 24,color: Colors.grey,),
                          ],
                        ),
                        ),
                      ),

                  ],
                ),
                SizedBox(height: 160,),
                TextButton(
                  child: Text(
                    "Далее",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'CeraPro',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Color(0xFFE0E0E0),
                    elevation: 0,
                    minimumSize: Size(
                        343, 48
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BookDescriptionScreen()),
                      );
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
