// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';

import '../../../logic/book/bloc/book_bloc.dart';
import '../screens/selectBook/book_detailed_screen.dart';
import 'book_widget.dart';

class GridWidgetMyChoice extends StatefulWidget {
  const GridWidgetMyChoice({
    Key? key,
  }) : super(key: key);

  @override
  State<GridWidgetMyChoice> createState() => _GridWidgetMyChoiceState();
}

class _GridWidgetMyChoiceState extends State<GridWidgetMyChoice> {

  List<String> list = ['assets/images/bookImage1.png','assets/images/bookImage2.png','assets/images/bookImage3.png','assets/images/bookImage4.png'];
  String title = 'Изменить других можно! Как помочь';
  List textMonth = ['Сентябрь','Ноябрь','Октябрь','Декабрь'];
  String author = 'Натан Ф., Джефф Д., Клейтон К.';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height) / 1.95;
    final double itemWidth = size.width - 175;
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Мой выбор',
          style: TextStyles.boldStyle.copyWith(
            fontSize: 23,
            color: ColorStyles.neutralsTextPrimaryColor,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 12,bottom: 12,right: 14),
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  //color: Colors.black
                  color: const Color(0xFFF9F9F9),
                ),
                child: Icon(
                  CupertinoIcons.clear,
                  color: ColorStyles.primaryBorderColor,
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              height: 1,
            )
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8,16,16,0),
        child: GridView.count(
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          childAspectRatio: (itemWidth / itemHeight),
          crossAxisCount: 2,
          children: List.generate(4, (index) {
            return BlocBuilder<BookBloc, BookState>(
              builder: (context, state) {
                if(state is MyChoiceSuccess){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8,left: 8),
                    child: GestureDetector(
                      onTap: (){
                        //BookDescriptionScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BookDescriptionScreen(
                                    id: '',
                                    indexMonth: 0,
                                    list: const [],
                                    model: state.list[index],
                                    addList: const [],
                                    choiceList: const [],
                                    selectIndex: 0,
                                  )
                          ),
                        );
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: ColorStyles.neutralsPageBackgroundColor,
                                  ),
                                  child: BookWidget(img: state.list[index].avatarId, textMonth: 'null',),
                                ),
                                const SizedBox(height: 8,),
                                Text(
                                  state.list[index].name!,
                                  style: TextStyles.mediumStyle.copyWith(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  state.list[index].authors[0]!.fio!,
                                  style: TextStyles.regularStyle.copyWith(
                                    fontSize: 13,
                                    color: const Color(0xff767676),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,

                                ),
                                const SizedBox(height: 4,),
                              ],
                            ),
                          )
                      ),
                    ),
                  );
                }
                return const Offstage();
              },
            );
          }),
        ),
      ),
    );
  }
}
