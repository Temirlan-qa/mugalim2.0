import 'package:flutter/material.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';

import '../../../logic/book/bloc/book_bloc.dart';
import '../screens/bookMain/book_description.dart';
import 'book_widget.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({
    Key? key, required this.state,
  }) : super(key: key);
   final MyReadBookListSuccess state;
  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {

  List<String> list = ['assets/images/bookImage1.png','assets/images/bookImage2.png','assets/images/bookImage3.png','assets/images/bookImage4.png'];
  String title = 'Изменить других можно! Как помочь';
  List textMonth = ['Сентябрь','Октябрь','Ноябрь','Декабрь'];
  String author = 'Натан Ф., Джефф Д., Клейтон К.';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height) / 1.95;
    final double itemWidth = size.width - 175;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,16,16,0),
      child: GridView.count(
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        childAspectRatio: (itemWidth / itemHeight),
        crossAxisCount: 2,
        children: List.generate(widget.state.list.length, (index) {
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
                          img: '${widget.state.list[index].bookListModel?.avatarId}',
                          textMonth: getMonthName((DateTime.parse(
                              '${widget.state.list[index].startedAt}')
                              .month)),
                          name: '${widget.state.list[index].bookListModel?.name}',
                          authors: widget.state.list[index].bookListModel!.authors,
                          haveDay: false,
                          description: '${widget.state.list[index].bookListModel?.description}',
                          id: '${widget.state.list[index].bookId}',
                          haveReviewAndFinishedContainer: false,
                        ),
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
                          child: BookWidget(img: widget.state.list[index].bookListModel?.avatarId, textMonth: getMonthName((DateTime.parse(
                              '${widget.state.list[index].startedAt}')
                              .month)),),
                        ),
                        const SizedBox(height: 8,),
                        Text(
                          widget.state.list[index].bookListModel!.name!,
                          style: TextStyles.mediumStyle.copyWith(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          widget.state.list[index].bookListModel!.authors[0]!.fio!,
                          style: TextStyles.regularStyle.copyWith(
                            fontSize: 13,
                            color: const Color(0xff767676),
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 4,),
                      ],
                    ),
                  )
              ),
            ),
          );
        }),
      ),
    );
  }

  String getMonthName(int index) {
    String month = '';
    switch (index) {
      case 1:
        month = "Январь";
        break;
      case 2:
        month = "Февраль";
        break;
      case 3:
        month = "Март";
        break;
      case 4:
        month = "Апрель";
        break;
      case 5:
        month = "Май";
        break;
      case 6:
        month = "Июнь";
        break;
      case 7:
        month = "Июль";
        break;
      case 8:
        month = "Август";
        break;
      case 9:
        month = "Сентябрь";
        break;
      case 10:
        month = "Октябрь";
        break;
      case 11:
        month = "Ноябрь";
        break;
      case 12:
        month = "Декабрь";
        break;
      default:
        break;
    }
    return month;
  }
}
