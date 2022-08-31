import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/presentation/books/screens/done.dart';
import 'package:mugalim/presentation/books/screens/select_book.dart';
import '../../../core/const/const_color.dart';

class JenreScreen extends StatefulWidget {
  JenreScreen({
    Key? key,
    required this.index_month,
    required this.list,
  }) : super(key: key);
  int index_month;
  List list;

  @override
  State<JenreScreen> createState() => _JenreScreenState();
}

class _JenreScreenState extends State<JenreScreen> {
  int index_month = 0;
  List list = ['Сентября', 'Октября', 'Ноября', 'Декабря'];
  List selectList = ['Бизнес', 'Классика', 'Развитие', 'Фантастика'];
  List array = [];
  int indexGrid = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
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
                          'Книга ${list[widget.index_month.toInt()]} :',
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
                child: gridView(),
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
                    int index = indexGrid;
                    // int size = widget.list.length;
                    String selectIndex = widget.list[index];
                    print(index);
                    if (widget.index_month.toInt() >= 4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChoosenPage()),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => BookScreen(
                            index_month: widget.index_month,
                            select_index: selectIndex,
                            list: widget.list,
                          ),
                        ),
                      );
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
      ),
    );
  }

  GridView gridView() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (MediaQuery.of(context).size.width - 40) / 2 / 120,
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4),
      itemCount: widget.list.length,
      itemBuilder: (BuildContext ctx, index) {
        return GestureDetector(
          onTap: () {
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.list[index]}',
                  style: TextStyles.mediumStyle.copyWith(
                    fontSize: 16,
                    color: Colors.white,
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
      },
    );
  }
}
