import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mugalim/core/const/sizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/presentation/books/screens/selectBook/book_detailed_screen.dart';
import 'package:mugalim/presentation/books/screens/selectBook/select_jenre.dart';
import 'package:dio/dio.dart';
import '../../../../core/injection_container.dart';
import '../../../../logic/book/bloc/book_bloc.dart';
import '../../../../logic/book/data/datasources/book_datasources.dart';
import 'done.dart';


// ignore: must_be_immutable
class SelectBookScreen extends StatefulWidget {
  SelectBookScreen(
      {Key? key,
      required this.indexMonth,
      required this.selectIndex,
      required this.list,
        required this.selectId}
      )
      : super(key: key);
  int indexMonth;
  String selectIndex;
  List list;
  String selectId;
  @override
  State<SelectBookScreen> createState() => _SelectBookScreenState();
}

class _SelectBookScreenState extends State<SelectBookScreen> {
  List list = [];
  late String resultOptionId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if(state is BookListSuccess){
            return Stack(
              children: [
                SingleChildScrollView(
                  child: SafeArea(
                    child: Container(
                      color: ColorStyles.neutralsPageBackgroundColor,
                      child: Column(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(46, 16, 47, 0),
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    Text(
                                      'Выберите книгу',
                                      style: TextStyles.boldStyle.copyWith(
                                        fontSize: 32,
                                        color: ColorStyles.neutralsTextPrimaryColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    sizedBoxHeight8(),
                                    Text(
                                      'От этого зависит какую книгу вы будете читать в текущем учебном году ',
                                      style: TextStyles.mediumStyle.copyWith(
                                        fontSize: 14,
                                        color: ColorStyles.neutralsTextPrimaryColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: 5,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (!list.contains(index)) {
                                        list.clear();
                                        list.add(index);
                                      } else if (list.contains(index)) {
                                        list.clear();
                                      }
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width - 32,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: list.contains(index)
                                                ? ColorStyles.primaryBorderColor
                                                : ColorStyles
                                                .neutralsPageBackgroundColor,
                                            width: 2),
                                        color: ColorStyles.primarySurfaceColor,
                                        // color: Colors.gre,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Row(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(6.0),
                                                child:
                                                Image.asset(
                                                  'assets/images/bookImage1.png',
                                                  width: 88,
                                                  height: 134,
                                                )
                                            ),
                                            sizedBoxWidth16(),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    state.votes[index].name!,
                                                    style: TextStyles.mediumStyle.copyWith(
                                                        fontSize: 16,
                                                        color: list.contains(index)
                                                            ? ColorStyles
                                                            .neutralsTextPrimaryColor
                                                            : ColorStyles
                                                            .primarySurfaceHoverColor,
                                                        height: 1.5),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  sizedBoxHeight4(),
                                                  Text(
                                                    state.votes[index].authors[0]!.fio!,
                                                    style: TextStyles.regularStyle
                                                        .copyWith(
                                                      fontSize: 14,
                                                      color: list.contains(index)
                                                          ? ColorStyles
                                                          .neutralsTextPrimaryColor
                                                          : ColorStyles
                                                          .primarySurfaceHoverColor,
                                                      height: 1.5,
                                                    ),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  const SizedBox(
                                                    height: 12,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 8),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  BookDescriptionScreen(
                                                                    indexMonth: widget
                                                                        .indexMonth,
                                                                    list: widget.list,
                                                                    selectIndex: widget
                                                                        .selectIndex,
                                                                    selectId: widget.selectId,
                                                                    model: state.votes[index],
                                                                  )
                                                          ),
                                                        );
                                                      },
                                                      child: Text(
                                                        'Подробнее',
                                                        style: TextStyles.mediumStyle
                                                            .copyWith(
                                                          fontSize: 13,
                                                          color: ColorStyles
                                                              .primaryBorderColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 16,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(100),
                                                border: Border.all(
                                                    color: list.contains(index)
                                                        ? ColorStyles
                                                        .primaryBorderColor
                                                        : ColorStyles
                                                        .neutralsTextPrimaryColor,
                                                    width:
                                                    list.contains(index) ? 5 : 1
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              ),
                          const SizedBox(
                            height: 200,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 106,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: (list.isEmpty)
                              ? ColorStyles.neutralsTextPrimaryColor
                              : const Color(0xFFE0E0E0),
                          backgroundColor: (list.isEmpty)
                              ? const Color(0xFFE0E0E0)
                              : ColorStyles.primaryBorderColor,
                          elevation: 3,
                          minimumSize: const Size(343, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: () async{
                          // print(list[0]);
                          if (list.isNotEmpty) {
                            if (widget.indexMonth.toInt() >= 3) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ChoosenPage()),
                              );
                            }
                            if (list.isNotEmpty && widget.indexMonth.toInt() < 3)  {
                              widget.list.remove(widget.selectIndex);
                              final BookDatasource bookDatasource = sl();
                              Response response = await bookDatasource.postVote(widget.selectId,state.votes[list[0]].id!);
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => JenreScreen(
                                    indexMonth: widget.indexMonth.toInt() + 1,
                                    list: widget.list,
                                  ),
                                ),
                              );
                            }
                          }
                        },
                        child: Text(
                          "Выбрать книгу",
                          style: TextStyles.mediumStyle.copyWith(
                            fontSize: 16,
                            color: (list.isEmpty)
                                ? ColorStyles.neutralsTextPrimaryColor
                                : const Color(0xFFE0E0E0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: ColorStyles.primaryBorderColor,
                          backgroundColor: ColorStyles.neutralsPageBackgroundColor,
                          elevation: 3,
                          minimumSize: const Size(343, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Обратно к жанрам",
                          style: TextStyles.mediumStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 34,
                      color: ColorStyles.backgroundColor,
                    )
                ),
              ],
            );
          }
          return const Center(child : Text('no loaded'));
        },
      ),
    );
  }
}
