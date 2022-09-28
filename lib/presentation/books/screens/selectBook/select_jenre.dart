import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mugalim/core/const/sizedBox.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/presentation/books/screens/selectBook/done.dart';
import '../../../../core/const/const_color.dart';
import '../../../../core/routes/routes_const.dart';
import '../../../../logic/book/bloc/book_bloc.dart';
import '../../widgets/selectJenre_shimmer.dart';

// ignore: must_be_immutable
class GenreScreen extends StatefulWidget {
  GenreScreen({
    Key? key,
    required this.indexMonth,
    required this.list,
    required this.addList,
    required this.choiceList,
  }) : super(key: key);
  int indexMonth;
  List list;
  List addList;
  List<Map<String, String>> choiceList;

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  List list = ['Первая', 'Вторая', 'Третья', 'Четвертая'];
  List selectList = ['Бизнес', 'Классика', 'Развитие', 'Фантастика'];
  List array = [];
  List addList = [];
  int indexGrid = 0;
  int selectIndexGenre = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          addList = widget.addList;
          if(state is VoteListSuccess){
            return SafeArea(
              child: SizedBox(
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
                              sizedBoxHeight8(),
                              Text(
                                '${list[widget.indexMonth.toInt()]} книга:',
                                style: TextStyles.mediumStyle.copyWith(
                                  fontSize: 16,
                                  color: ColorStyles.neutralsTextPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 125,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: gridView(state),
                    ),
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        // primary: Colors.black,
                        backgroundColor: array.isNotEmpty
                            ? ColorStyles.primaryBorderColor
                            : const Color(0xFFE0E0E0),
                        //backgroundColor: Color(0xFFE0E0E0),
                        elevation: 0,
                        minimumSize: const Size(343, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      onPressed: () {
                        if (array.isNotEmpty) {
                          String selectIndex = widget.list[indexGrid];
                          int index = 0;
                          if(selectIndex == 'Бизнес') {
                            index = 0;
                          } else if(selectIndex == 'Классика') {
                            index = 1;
                          } else if(selectIndex == 'Развитие') {
                            index = 2;
                          } else if(selectIndex == 'Фантастика') {
                            index = 3;
                          }
                            if (widget.indexMonth.toInt() >= 4) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChoosenPage(choiceList: widget.choiceList,)),
                            );
                          } else {
                            Navigator.of(context).pushNamed(SelectBookRoute, arguments: {
                              "indexMonth": widget.indexMonth,
                              "id": state.votes[widget.addList[index]].id!,
                              "list": widget.list,
                              "addList": addList,
                              "choiceList": widget.choiceList,
                              "selectIndex": selectIndexGenre
                            });
                          }
                        }
                      },
                      child: Text(
                        "Далее",
                        style: TextStyles.mediumStyle.copyWith(
                          color: array.isNotEmpty
                              ? Colors.white
                              : ColorStyles.neutralsTextPrimaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    sizedBoxHeight16(),
                  ],
                ),
              ),
            );
          }
          else if(state is BookLoading){
            return const SelectGenreShimmer();
          }
          else if(state is BookFailure){
            return const Center(child: Text('error'));
          }
          return const Center(child: Text('no load'));
        },
      ),
    );
  }

  GridView gridView(VoteListSuccess state) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (MediaQuery.of(context).size.width - 40) / 2 / 120,
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4),
      itemCount: widget.addList.length,
      itemBuilder: (BuildContext ctx, index) {
        return GestureDetector(
          onTap: () {
            selectIndexGenre = widget.addList[index];
            setState(() {
              if (!array.contains(widget.list[index])) {
                array.clear();
                array.add(widget.list[index]);
              } else if (array.contains(widget.list[index])) {
                array.clear();
              }
              indexGrid = index;
            });
          },
          child: Container(
            // height: 120,
            // width: (MediaQuery.of(context).size.width -40 )/2,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.all(
                color: array.contains(widget.list[index])
                    ? ColorStyles.primaryBorderColor
                    : ColorStyles.neutralsPageBackgroundColor,
                width: 2,
              ),
            ),

            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 2 - 100,
                  height: 80,
                  child: Text(
                    state.votes[widget.addList[index]].name!,
                    style: TextStyles.mediumStyle.copyWith(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                array.contains(widget.list[index])
                    ? Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorStyles.primaryBorderColor,
                  ),
                  child: const Icon(
                    Icons.done,
                    size: 16,
                    color: Colors.white,
                  ),
                )
                    : Container(
                  height: 24,
                  width: 24,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
