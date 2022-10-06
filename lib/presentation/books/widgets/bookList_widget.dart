// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:mugalim/presentation/books/widgets/book_widget.dart';

import '../../../core/const/const_color.dart';
import '../../../core/const/text_style_const.dart';
import 'buttonBook_widget.dart';

class BookListWidget extends StatefulWidget {
  final String img;
  final bool haveDays;
  final String textMonth;
  const BookListWidget({Key? key, required this.img, required this.haveDays, required this.textMonth}) : super(key: key);

  @override
  State<BookListWidget> createState() => _BookListWidgetState();
}

class _BookListWidgetState extends State<BookListWidget> {
  String title = 'Изменить других можно! Как помочь';
  String author = 'Натан Ф., Джефф Д., Клейтон К.';
  @override
  Widget build(BuildContext context) {
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
              child: BookWidget(img: widget.img, textMonth: widget.textMonth,),
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
                    title,
                    style: TextStyles.mediumStyle.copyWith(
                      fontSize: 14,
                      color: Colors.black,
                      height: 20/14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    author,
                    style: TextStyles.regularStyle.copyWith(
                      fontSize: 13,
                      color: ColorStyles.primarySurfaceHoverColor,
                      height: 16/13,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8,),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorStyles.hue246SurfaceHoverColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                      child: Text(
                        '315 страниц',
                        style: TextStyles.regularStyle.copyWith(
                          fontSize: 13,
                          color: Colors.black,
                          height: 16/13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorStyles.hue246SurfaceHoverColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                      child: Text(
                        '34 читателей',
                        style: TextStyles.regularStyle.copyWith(
                          fontSize: 13,
                          color: Colors.black,
                          height: 16/13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  widget.haveDays ? Container(
                    decoration: BoxDecoration(
                      color: ColorStyles.hue246SurfaceHoverColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                      child: Text(
                        'Осталось дней: 24',
                        style: TextStyles.regularStyle.copyWith(
                          fontSize: 13,
                          color: Colors.black,
                          height: 16/13,
                        ),
                      ),
                    ),
                  ) : const Offstage(),
                  const SizedBox(height: 8,),
                  widget.haveDays ? BookButtonWidget(onPressed: (){}, title: 'Закончить', height: 32,)
                  : Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Посмотреть оценку',
                      style: TextStyles.mediumStyle.copyWith(
                        fontSize: 13,
                        color: ColorStyles.primaryBorderColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
