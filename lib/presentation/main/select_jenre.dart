import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mugalim/presentation/main/book_description_screen.dart';
import 'package:mugalim/presentation/main/done.dart';
import 'package:mugalim/presentation/main/select_book.dart';

import '../../core/const/const_color.dart';

class JenreScreen extends StatefulWidget {
  JenreScreen({Key? key, required this.index_month,required this.list}) : super(key: key);
  int index_month;
  List list;

  @override
  State<JenreScreen> createState() => _JenreScreenState();
}

class _JenreScreenState extends State<JenreScreen> {

  List list = ['Сентября', 'Октября', 'Ноября','Декабря'];
  List array = [];
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
                SizedBox(height: 16,),
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
                  'Книга ${list[widget.index_month.toInt()]} :',
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
                    Visibility(
                      visible: widget.list.contains('Сентября') ? true : false,
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(!array.contains(0)){
                              array.clear();
                              array.add(0);
                            }
                            else if(array.contains(0)){
                              array.clear();
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            border: Border.all(color: array.contains(0) ? Color(0xff3D3DD8) : ColorStyles.neutralsPageBackgroundColor,width: 2),
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
                              array.contains(0)

                                  ?Image.asset('assets/icons/Check.png')
                                  :Container(height: 24,width: 24,color: Colors.grey,),
                            ],
                          ),
                          ),
                        ),
                    ),
                    SizedBox(width: 8,),
                    Visibility(
                      visible: widget.list.contains('Октября') ? true : false,
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(!array.contains(1)){
                              array.clear();
                              array.add(1);
                            }
                            else if(array.contains(1)){
                              array.clear();
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            border: Border.all(color: array.contains(1) ? Color(0xff3D3DD8) : ColorStyles.neutralsPageBackgroundColor,width: 2),
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
                              array.contains(1)

                                  ?Image.asset('assets/icons/Check.png')
                                  :Container(height: 24,width: 24,color: Colors.grey,),
                            ],
                          ),
                                // Icon(Icons.check),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: widget.list.contains('Ноября') ? true : false,
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(!array.contains(2)){
                              array.clear();
                              array.add(2);
                            }
                            else if(array.contains(2)){
                              array.clear();
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            border: Border.all(color: array.contains(2) ? Color(0xff3D3DD8) : ColorStyles.neutralsPageBackgroundColor,width: 2),
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
                                array.contains(2)

                                    ?Image.asset('assets/icons/Check.png')
                                    :Container(height: 24,width: 24,color: Colors.grey,),
                              ],
                            ),
                          ),
                        ),
                    ),

                    SizedBox(width: 8,),
                    Visibility(
                      visible: widget.list.contains('Декабря') ? true : false,
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(!array.contains(3)){
                              array.clear();
                              array.add(3);
                            }
                            else if(array.contains(3)){
                              array.clear();
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            border: Border.all(color: array.contains(3) ? Color(0xff3D3DD8) : ColorStyles.neutralsPageBackgroundColor,width: 2),
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
                              array.contains(3)
                                  ?Image.asset('assets/icons/Check.png')
                                  :Container(height: 24,width: 24,color: Colors.grey,),
                            ],
                          ),
                          ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                TextButton(
                  child: Text(
                    "Далее",
                    style: TextStyle(
                      color: !array.isEmpty ? Colors.white:Colors.black,
                      fontSize: 16,
                      fontFamily: 'CeraPro',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    // primary: Colors.black,
                    backgroundColor: !array.isEmpty ? Color(0xFF3D3DD8):Color(0xFFE0E0E0),
                    //backgroundColor: Color(0xFFE0E0E0),
                    elevation: 0,
                    minimumSize: Size(
                        343, 48
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                    onPressed: () {
                      if(!list.isEmpty) {
                        int index = array.contains(0) ? 0 : array.contains(1)
                            ? 1
                            : array.contains(2) ? 2 : 3;
                        // int size = widget.list.length;
                        String select_index = list[index];
                        print(select_index);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookScreen(
                            index_month: widget.index_month,
                            select_index: select_index,
                            list: widget.list,)),
                        );
                      }
                    }
                ),
                SizedBox(height: 16,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
