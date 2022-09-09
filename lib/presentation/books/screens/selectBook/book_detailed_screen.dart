import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/logic/book/data/models/book_list_model.dart';
import 'package:mugalim/presentation/books/screens/selectBook/done.dart';
import 'package:mugalim/presentation/books/screens/selectBook/select_jenre.dart';
import 'package:dio/dio.dart';
import '../../../../core/injection_container.dart';
import '../../../../logic/book/data/datasources/book_datasources.dart';

// ignore: must_be_immutable
class BookDescriptionScreen extends StatefulWidget {
  BookDescriptionScreen(
      {Key? key,
      required this.indexMonth,
      required this.list,
      required this.selectIndex,
        required this.selectId,
        required this.model,
      }) : super(key: key);
  int indexMonth;
  List list;
  final BookListModel model;
  String selectIndex;
  String selectId;
  @override
  State<BookDescriptionScreen> createState() => _BookDescriptionScreenState();
}

class _BookDescriptionScreenState extends State<BookDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Кітап',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'CeraPro',
            fontWeight: FontWeight.w500,
            color: ColorStyles.neutralsBlackColor,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        leading: CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left,
            size: 24,
            color: ColorStyles.primaryShapeColor,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Center(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset('assets/images/book1.png',
                                  width: 140, height: 220, fit: BoxFit.cover)
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.model.name!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.model.authors[0]!.fio!,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: ColorStyles.neutralsTextTertiaryColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Text(
                              '4.0',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            SvgPicture.asset('assets/icons/star_full.svg'),
                            const SizedBox(
                              width: 8,
                            ),
                            SvgPicture.asset('assets/icons/star_full.svg'),
                            const SizedBox(
                              width: 8,
                            ),
                            SvgPicture.asset('assets/icons/star_full.svg'),
                            const SizedBox(
                              width: 8,
                            ),
                            SvgPicture.asset('assets/icons/star_full.svg'),
                            const SizedBox(
                              width: 8,
                            ),
                            SvgPicture.asset('assets/icons/star_empty.svg'),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Описание",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adu lts but is often read by adolescents for its theme of angst, alienation and as a critique......',
                          style: TextStyle(
                            color: ColorStyles.neutralsTextTertiaryColor,
                            fontSize: 16,
                            height: 1.5,
                            // Figma's line height: fontSize * height = 24
                            // https://www.codegrepper.com/code-examples/whatever/line+height+figma+flutter
                            // color: ColorStyles.neutralsTextTertiaryColor
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 50,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: TextButton(
                      style: TextButton.styleFrom(
                        primary: const Color(0xFFE0E0E0),
                        backgroundColor: const Color(0xff3D3DD8),
                        elevation: 3,
                        minimumSize: const Size(343, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      onPressed: () async {
                        if (widget.indexMonth.toInt() >= 3) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChoosenPage()
                            ),
                          );
                        }
                        if (widget.list.isNotEmpty &&
                            widget.indexMonth.toInt() < 3) {
                          widget.list.remove(widget.selectIndex);
                          final BookDatasource bookDatasource = sl();
                          Response response = await bookDatasource.postVote(widget.selectId,widget.model.id!);
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
                      },
                      child: const Text(
                        "Выбрать книгу",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'CeraPro',
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
