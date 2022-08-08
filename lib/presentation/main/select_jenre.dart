import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mugalim/presentation/main/book_description_screen.dart';
import 'package:mugalim/presentation/main/done.dart';
import 'package:mugalim/presentation/main/select_book.dart';
import 'package:mugalim/core/routes/routes_const.dart';
import '../../core/const/const_color.dart';

class JenreScreen extends StatefulWidget {
  JenreScreen({Key? key, required this.index_month, required this.list,})
      : super(key: key);
  int index_month;
  List list;


  @override
  State<JenreScreen> createState() => _JenreScreenState();
}

class _JenreScreenState extends State<JenreScreen> {
  int index_month = 0;
  List list = ['Сентября', 'Октября', 'Ноября', 'Декабря'];
  List select_list = ['Бизнес', 'Классика', 'Развитие', 'Фантастика'];
  List array = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(46, 16, 47, 0),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Text(
                          'Выберите жанр',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontFamily: 'CeraPro',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'От этого зависит какую книгу вы будете читать в текущем учебном году ',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontFamily: 'CeraPro',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Книга ${list[widget.index_month.toInt()]} :',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'CeraPro',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 125,
              ),
              widget.list.length == 1
                  ? Container(
                      width: 375,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (!array.contains(0)) {
                                    array.clear();
                                    array.add(0);
                                  } else if (array.contains(0)) {
                                    array.clear();
                                  }
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  border: Border.all(
                                      color: array.contains(0)
                                          ? Color(0xff3D3DD8)
                                          : ColorStyles
                                              .neutralsPageBackgroundColor,
                                      width: 2),
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
                                          color: Colors.white),
                                    ),
                                    Spacer(),
                                    array.contains(0)
                                        ? Container(
                                            height: 24,
                                            width: 24,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFF3D3DD8),
                                            ),
                                            child: Icon(
                                              Icons.done,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          )
                                        : Container(
                                            height: 24,
                                            width: 24,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      width: 375,
                      child: Center(
                        child: Wrap(
                          children: [
                            // Бизнес
                            Visibility(
                              visible:
                                  widget.list.contains('Бизнес') ? true : false,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (!array.contains(0)) {
                                      array.clear();
                                      array.add(0);
                                    } else if (array.contains(0)) {
                                      array.clear();
                                    }
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 4),
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    border: Border.all(
                                        color: array.contains(0)
                                            ? Color(0xff3D3DD8)
                                            : ColorStyles
                                                .neutralsPageBackgroundColor,
                                        width: 2),
                                  ),
                                  height: 120,
                                  width: 167,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Бизнес',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'CeraPro',
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Spacer(),
                                      array.contains(0)
                                          ? Container(
                                              height: 24,
                                              width: 24,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFF3D3DD8),
                                              ),
                                              child: Icon(
                                                Icons.done,
                                                size: 16,
                                                color: Colors.white,
                                              ),
                                            )
                                          : Container(
                                              height: 24,
                                              width: 24,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                            )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Классика
                            Visibility(
                              visible: widget.list.contains('Классика')
                                  ? true
                                  : false,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (!array.contains(1)) {
                                      array.clear();
                                      array.add(1);
                                    } else if (array.contains(1)) {
                                      array.clear();
                                    }
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 4),
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    border: Border.all(
                                        color: array.contains(1)
                                            ? Color(0xff3D3DD8)
                                            : ColorStyles
                                                .neutralsPageBackgroundColor,
                                        width: 2),
                                  ),
                                  height: 120,
                                  width: 167,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Классика',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'CeraPro',
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Spacer(),
                                      array.contains(1)
                                          ? Container(
                                              height: 24,
                                              width: 24,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFF3D3DD8),
                                              ),
                                              child: Icon(
                                                Icons.done,
                                                size: 16,
                                                color: Colors.white,
                                              ),
                                            )
                                          : Container(
                                              height: 24,
                                              width: 24,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                            )
                                    ],
                                  ),
                                  // Icon(Icons.check),
                                ),
                              ),
                            ),
                            // Развитие
                            Visibility(
                              visible: widget.list.contains('Развитие')
                                  ? true
                                  : false,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (!array.contains(2)) {
                                      array.clear();
                                      array.add(2);
                                    } else if (array.contains(2)) {
                                      array.clear();
                                    }
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 4),
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    border: Border.all(
                                        color: array.contains(2)
                                            ? Color(0xff3D3DD8)
                                            : ColorStyles
                                                .neutralsPageBackgroundColor,
                                        width: 2),
                                  ),
                                  height: 120,
                                  width: 167,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Развитие',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'CeraPro',
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Spacer(),
                                      array.contains(2)
                                          ? Container(
                                              height: 24,
                                              width: 24,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFF3D3DD8),
                                              ),
                                              child: Icon(
                                                Icons.done,
                                                size: 16,
                                                color: Colors.white,
                                              ),
                                            )
                                          : Container(
                                              height: 24,
                                              width: 24,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                            )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Фантастика
                            Visibility(
                              visible: widget.list.contains('Фантастика')
                                  ? true
                                  : false,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (!array.contains(3)) {
                                      array.clear();
                                      array.add(3);
                                    } else if (array.contains(3)) {
                                      array.clear();
                                    }
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 4),
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    border: Border.all(
                                        color: array.contains(3)
                                            ? Color(0xff3D3DD8)
                                            : ColorStyles
                                                .neutralsPageBackgroundColor,
                                        width: 2),
                                  ),
                                  height: 120,
                                  width: 167,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Фантастика',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'CeraPro',
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Spacer(),
                                      array.contains(3)
                                          ? Container(
                                              height: 24,
                                              width: 24,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFF3D3DD8),
                                              ),
                                              child: Icon(
                                                Icons.done,
                                                size: 16,
                                                color: Colors.white,
                                              ),
                                            )
                                          : Container(
                                              height: 24,
                                              width: 24,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                            )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              Spacer(),
              TextButton(
                  child: Text(
                    "Далее",
                    style: TextStyle(
                      color: !array.isEmpty ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontFamily: 'CeraPro',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    // primary: Colors.black,
                    backgroundColor:
                        !array.isEmpty ? Color(0xFF3D3DD8) : Color(0xFFE0E0E0),
                    //backgroundColor: Color(0xFFE0E0E0),
                    elevation: 0,
                    minimumSize: Size(343, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed: () {
                    if (!widget.list.isEmpty) {
                      int index = array.contains(0)
                          ? 0
                          : array.contains(1)
                              ? 1
                              : array.contains(2)
                                  ? 2
                                  : 3;
                      // int size = widget.list.length;
                      String select_index = select_list[index];
                      print(select_index);
                      if (widget.index_month.toInt() >= 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChoosenPage()),
                        );
                      } else {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute (
                        //     builder: (BuildContext context) => BookScreen(
                        //       index_month: widget.index_month,
                        //       select_index: select_index,
                        //       list: widget.list,
                        //     ),
                        //   ),
                        // );
                        Navigator.pushReplacementNamed(context, BookRoute,
                            arguments: {
                              index_month: widget.index_month,
                              select_index: select_index,
                              list: widget.list,
                            });
                      }
                    }
                  }),
              SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
