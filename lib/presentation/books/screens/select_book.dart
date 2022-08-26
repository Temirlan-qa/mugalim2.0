import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/presentation/books/screens/book_description_screen.dart';
import 'package:mugalim/presentation/books/screens/select_jenre.dart';

import 'done.dart';

class BookScreen extends StatefulWidget {
  BookScreen(
      {Key? key,
      required this.index_month,
      required this.select_index,
      required this.list}
      )
      : super(key: key);
  int index_month;
  String select_index;
  List list;
  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  List list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                                        child: index == 0
                                            ? Image.asset(
                                                'assets/images/book1.png')
                                            : index == 2
                                                ? Image.asset(
                                                    'assets/images/book3.png')
                                                : index == 3
                                                    ? Image.asset(
                                                        'assets/images/book1.png')
                                                    : Image.asset(
                                                        'assets/images/book2.png'),
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
                                              'Создавая инновации. Креативные идеи дл...',
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
                                              'Даер Джефф, Натан Ферр, Клейтон Крситен...',
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
                                                              index_month: widget
                                                                  .index_month,
                                                              list: widget.list,
                                                              select_index: widget
                                                                  .select_index,
                                                            )),
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
                        }),
                    const SizedBox(
                      height: 200,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 74,
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
                  onPressed: () {
                    if (!list.isEmpty) {
                      if (widget.index_month.toInt() >= 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChoosenPage()),
                        );
                      }
                      if (!list.isEmpty && widget.index_month.toInt() < 3) {
                        widget.list.remove(widget.select_index);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JenreScreen(
                              index_month: widget.index_month.toInt() + 1,
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
            bottom: 16,
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
        ],
      ),
    );
  }
}
