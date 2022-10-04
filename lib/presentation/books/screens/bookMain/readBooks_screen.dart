// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mugalim/logic/book/bloc/book_bloc.dart';
import 'package:mugalim/presentation/books/widgets/book_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/const/const_color.dart';
import '../../../../core/const/text_style_const.dart';
class ReadBooks extends StatefulWidget {
  const ReadBooks({Key? key}) : super(key: key);

  @override
  State<ReadBooks> createState() => _ReadBooksState();
}

class _ReadBooksState extends State<ReadBooks> {
  Box tokensBox = Hive.box('tokens');
  String author = 'Натан Ф., Джефф Д., Клейтон К.';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Книги',
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
      ),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if(state is MyReadBookListSuccess) {
            return state.list.isNotEmpty ? ListView.builder(
              shrinkWrap: true,
              itemCount: state.list.length,
                itemBuilder: (context, index) {
                  String authors = '';
                  for(var i = 0; i < state.list[index].bookListModel!.authors.length; i++) {
                    authors += '${state.list[i].bookListModel!.authors[i]?.initialName} ';
                  }
                  var time = DateTime.parse('${state.list[index].startedAt}');
                  String month = getMonthName(time.month);
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8,16,16,16),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ColorStyles.neutralsPageBackgroundColor,
                            ),
                            child: BookWidget(img: '${state.list[index].bookListModel?.avatarId}', textMonth: month,),
                          ),
                          const SizedBox(width: 8,),
                          Expanded(
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${state.list[index].bookListModel?.name}',
                                  style: TextStyles.mediumStyle.copyWith(
                                    fontSize: 14,
                                    color: Colors.black,
                                    height: 20/14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                Text(
                                  authors,
                                  style: TextStyles.regularStyle.copyWith(
                                    fontSize: 13,
                                    color: ColorStyles.primarySurfaceHoverColor,
                                    height: 16/13,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                const SizedBox(height: 8,),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                }) :
            const Center(child: Text('Текущих книг нету'));
          }
          return const Offstage();
        },
      ),
    );
  }

  String getMonthName(int index) {
    String month = '';
    switch(index) {
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
