import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mugalim/logic/book/bloc/book_bloc.dart';
import '../../../../core/const/const_color.dart';
import '../../../../core/const/text_style_const.dart';
import '../../../../core/routes/routes_const.dart';
import '../../../../logic/book/data/models/readBookList_model.dart';
import '../../widgets/bookList_widget.dart';

class HomeBookScreen extends StatefulWidget {
  final BuildContext devScreenContext;
  const HomeBookScreen({Key? key, required this.devScreenContext}) : super(key: key);

  @override
  State<HomeBookScreen> createState() => _HomeBookScreenState();
}

class _HomeBookScreenState extends State<HomeBookScreen> {
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
              onTap: () {
                Navigator.pop(widget.devScreenContext);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12, right: 14),
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
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black12,
                ),
                height: 1.0,
              )),
        ),
        body: BlocBuilder<BookBloc, BookState>(
          builder: (context, state) {
            if (state is MyReadBookListSuccess) {
              List<ReadBookListModel> list = [];
              state.list.sort((a, b) => a.startedAt!.compareTo(b.startedAt!));
              print('length state list ${state.list.length}');
              for(var i = 0; i < state.list.length; i++) {
                print(state.list[i].bookListModel?.name);
              }
              var currentMonth = DateTime.now().month;
              for (var i = 0; i < state.list.length; i++) {
                if (DateTime.parse('${state.list[i].startedAt}').month <=
                    currentMonth) {
                  list.add(state.list[i]);
                }
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: ColorStyles.backgroundColor),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Книга этого месяца',
                                    style: TextStyles.mediumStyle.copyWith(
                                      fontSize: 20,
                                      color:
                                          ColorStyles.neutralsTextPrimaryColor,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  //BookDescriptionScreen
                                  Navigator.pushNamed(
                                    context, BookDescriptionRoute, arguments: {
                                    'img' : '${list[list.length - 1].bookListModel!.avatarId}',
                                    'textMonth' : getMonthName((DateTime.parse(
                                          '${list[list.length - 1].startedAt}')
                                          .month)),
                                    'name' : '${list[list.length - 1].bookListModel?.name}',
                                    'authors' :list[list.length - 1]
                                            .bookListModel!
                                            .authors,
                                    'haveDay' : true,
                                    'description' : '${list[list.length-1].bookListModel?.description}',
                                    'id' : list[list.length-1].bookId,
                                  }
                                    // MaterialPageRoute(
                                    //   builder: (context) =>
                                    //       BookDescriptionScreen(
                                    //     img: '${list[list.length - 1].bookListModel!.avatarId}',
                                    //     textMonth: getMonthName((DateTime.parse(
                                    //         '${list[list.length - 1].startedAt}')
                                    //         .month)),
                                    //     name: '${list[list.length - 1].bookListModel?.name}',
                                    //     authors: list[list.length - 1]
                                    //         .bookListModel!
                                    //         .authors,
                                    //     haveDay: true,
                                    //     description: '${list[list.length-1].bookListModel?.description}',
                                    //   ),
                                    // ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    BookListWidget(
                                      img:
                                          '${list[list.length - 1].bookListModel!.avatarId}',
                                      haveDays: true,
                                      textMonth: getMonthName((DateTime.parse(
                                              '${list[list.length - 1].startedAt}')
                                          .month)),
                                      name:
                                          '${list[list.length - 1].bookListModel?.name}',
                                      authors: list[list.length - 1]
                                          .bookListModel!
                                          .authors,
                                      description: '${list[list.length-1].bookListModel?.description}',
                                      bookId: '${list[list.length-1].bookId}',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: ColorStyles.backgroundColor
                      ),
                      child: (list.length > 1) ? Column(
                        children: [
                          const SizedBox(height: 16,),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Прошедшие месяца',
                                style: TextStyles.mediumStyle.copyWith(
                                  fontSize: 20,
                                  color: ColorStyles.neutralsTextPrimaryColor,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          ListView.builder(
                              itemCount: list.length - 1,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context,index){
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        //BookDescriptionScreen
                                        Navigator.pushNamed(
                                          context, BookDescriptionRoute, arguments: {
                                          'img' : '${list[index].bookListModel?.avatarId}',
                                          'textMonth' : getMonthName((DateTime.parse(
                                                    '${list[index].startedAt}')
                                                    .month)),
                                          'name' : '${list[index].bookListModel?.name}',
                                          'authors' : list[index].bookListModel!.authors,
                                          'haveDay' : false,
                                          'description' : '${list[index].bookListModel?.description}',
                                          'id' : list[index].bookId,
                                        }
                                          // MaterialPageRoute(
                                          //   builder: (context) =>
                                          //       BookDescriptionScreen(
                                          //         img: '${list[index].bookListModel?.avatarId}',
                                          //         textMonth: getMonthName((DateTime.parse(
                                          //             '${list[index].startedAt}')
                                          //             .month)),
                                          //         name: '${list[index].bookListModel?.name}',
                                          //         authors: list[index].bookListModel!.authors,
                                          //         haveDay: false,
                                          //         description: '${list[list.length-1].bookListModel?.description}',
                                          //       ),
                                          // ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: (DateTime.parse('${list[index].startedAt}').month != DateTime.now().month) ?
                                        BookListWidget(
                                          img: '${list![index].bookListModel!.avatarId}',
                                          haveDays: false,
                                          textMonth: getMonthName((DateTime.parse('${list[index].startedAt}').month)),
                                          name: '${list[index].bookListModel?.name}',
                                          authors: list[index].bookListModel!.authors,
                                          description: '${list[index].bookListModel?.description}',
                                          bookId: '${list[index].bookId}',
                                        ) : const Offstage(),
                                      ),
                                    ),
                                    index != 1 ? const Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Divider(height: 1,),
                                    ) : const Offstage(),
                                  ],
                                );
                              }
                          ),
                        ],
                      ) : const Offstage(),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              );
            }

            return const Offstage();
          },
        ));
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
