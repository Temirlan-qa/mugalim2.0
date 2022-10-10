// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:mugalim/presentation/books/widgets/book_widget.dart';

import '../../../core/const/const_color.dart';
import '../../../core/const/text_style_const.dart';
import '../../../core/routes/routes_const.dart';
import '../../../logic/book/data/models/authors_model.dart';
import 'buttonBook_widget.dart';

class BookListWidget extends StatefulWidget {
  final String img;
  final bool haveDays;
  final String textMonth;
  final String name;
  final List<AuthorsModel?> authors;
  final String description;
  final String id;

  const BookListWidget({Key? key, required this.img, required this.haveDays, required this.textMonth, required this.name, required this.authors, required this.description, required this.id}) : super(key: key);

  @override
  State<BookListWidget> createState() => _BookListWidgetState();
}

class _BookListWidgetState extends State<BookListWidget> {

  int? haveDays;

  int daysInMonth(DateTime date) =>  DateTimeRange(
      start:  DateTime.now(),
      end: DateTime(DateTime.now().year, DateTime.now().month + 1, 1))
      .duration
      .inDays;
  // @override
  // void initState() {
  //   super.initState();
  //   for(var i = 0; i < widget.authors.length; i++) {
  //     author += '${widget.authors[i]!.initialName}';
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    String author = '';
    for(var i = 0; i < widget.authors.length; i++) {
      author += '${widget.authors[i]!.initialName!} ';
      // author += widget.authors[i]!.initialName!;
    }
    haveDays = daysInMonth(DateTime.now());
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
                    widget.name,
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
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: ColorStyles.hue246SurfaceHoverColor,
                  //     borderRadius: BorderRadius.circular(4),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                  //     child: Text(
                  //       '315 страниц',
                  //       style: TextStyles.regularStyle.copyWith(
                  //         fontSize: 13,
                  //         color: Colors.black,
                  //         height: 16/13,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 8,),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: ColorStyles.hue246SurfaceHoverColor,
                  //     borderRadius: BorderRadius.circular(4),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                  //     child: Text(
                  //       '34 читателей',
                  //       style: TextStyles.regularStyle.copyWith(
                  //         fontSize: 13,
                  //         color: Colors.black,
                  //         height: 16/13,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 8,),
                  widget.haveDays ? Container(
                    decoration: BoxDecoration(
                      color: ColorStyles.hue246SurfaceHoverColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                      child: Text(
                        'Осталось дней: $haveDays',
                        style: TextStyles.regularStyle.copyWith(
                          fontSize: 13,
                          color: Colors.black,
                          height: 16/13,
                        ),
                      ),
                    ),
                  ) : const Offstage(),
                  const SizedBox(height: 8,),
                  widget.haveDays ?
                  BookButtonWidget(
                    onPressed: ()  {
                       Navigator.of(context).pushNamed(BookDescriptionRoute, arguments: {
                        'img' : widget.img,
                        'textMonth' : widget.textMonth,
                        'name' : widget.name,
                        'authors' : widget.authors,
                        'haveDay' : widget.haveDays,
                        'description' : widget.description,
                        'id' : widget.id,
                        'haveReviewAndFinishedContainer' : true,
                      }).then((_) => setState((){}));
                    },
                    title: 'Закончить', height: 32,)
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
