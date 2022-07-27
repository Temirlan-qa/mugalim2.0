import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/const/const_color.dart';

class JenreScreen extends StatefulWidget {
  const JenreScreen({Key? key}) : super(key: key);

  @override
  State<JenreScreen> createState() => _JenreScreenState();
}

class _JenreScreenState extends State<JenreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.surfacePrimaryColor,
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
                SizedBox(
                  height: 125,
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                        height: 120,
                        width: 167,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Бизнес',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'CeraPro',
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                        height: 120,
                        width: 167,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Классика',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'CeraPro',
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                        height: 120,
                        width: 167,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Развитие',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'CeraPro',
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                        height: 120,
                        width: 167,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Фантастика',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'CeraPro',
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                            ),
                          ),
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
                  ),
                  onPressed:() {

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
