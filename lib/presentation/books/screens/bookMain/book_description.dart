import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mugalim/logic/book/bloc/book_bloc.dart';
import 'package:mugalim/presentation/books/widgets/book_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/const/const_color.dart';
import '../../../../core/const/text_style_const.dart';
import '../../../../core/routes/routes_const.dart';
import '../../../../logic/book/data/models/authors_model.dart';
import '../../widgets/buttonBook_widget.dart';

class BookDescriptionScreen extends StatefulWidget {
  final String img;
  final String textMonth;
  final String name;
  final List<AuthorsModel?> authors;
  final bool haveDay;
  final String description;
  final String id;
  final bool haveReviewAndFinishedContainer;


  const BookDescriptionScreen({super.key, required this.img, required this.textMonth, required this.name, required this.authors, required this.haveDay, required this.description, required this.id, required this.haveReviewAndFinishedContainer});

  @override
  State<BookDescriptionScreen> createState() => _BookDescriptionScreenState();
}

class _BookDescriptionScreenState extends State<BookDescriptionScreen> {

  bool isPressed = false;
  int daysInMonth(DateTime date) =>  DateTimeRange(
      start:  DateTime.now(),
      end: DateTime(DateTime.now().year, DateTime.now().month + 1, 1))
      .duration
      .inDays;
  @override
  void initState() {
    super.initState();
    isPressed = widget.haveDay;
  }

  int? haveDays;
  @override
  Widget build(BuildContext context) {
    String author = '';
    for(var i = 0; i < widget.authors.length; i++) {
      author += '${widget.authors[i]?.initialName} ';
    }
    haveDays = daysInMonth(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Книга',
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
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              height: 1.0,
            )
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorStyles.backgroundColor,
                      // color: Colors.red
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                              child: BookWidget(textMonth: widget.textMonth, img: widget.img)
                          ),
                          const SizedBox(height: 16,),
                          Text(
                            widget.name,
                            style: TextStyles.mediumStyle.copyWith(
                              fontSize: 18,
                              color: ColorStyles.neutralsTextPrimaryColor,
                              height: 24/18,
                            ),
                          ),
                          const SizedBox(height: 4,),
                          Text(
                            author,
                            style: TextStyles.regularStyle.copyWith(
                              fontSize: 14,
                              color: ColorStyles.primarySurfaceHoverColor,
                              height: 20/14,
                            ),
                          ),
                          const SizedBox(height: 16,),

                          (!widget.haveDay) ? const Offstage() :Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // myContainer('312','СТРАНИЦ'),
                              // const SizedBox(width: 8,),
                              // myContainer('34','ЧИТАТЕЛЕЙ'),
                              // const SizedBox(width: 8,),
                              myContainer(haveDays!,'ДНЕЙ'),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorStyles.backgroundColor,
                      // color: Colors.red
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'О книге:',
                          style: TextStyles.mediumStyle.copyWith(
                            fontSize: 18,
                            color: ColorStyles.neutralsTextPrimaryColor,
                          ),
                        ),
                        const SizedBox(height: 8,),
                        Text(
                          widget.description,
                          style: TextStyles.regularStyle.copyWith(
                            fontSize: 14,
                            color: ColorStyles.neutralsTextPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16,),
                  (!widget.haveReviewAndFinishedContainer) ? const Offstage() : !isPressed ? Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorStyles.backgroundColor,
                      // color: Colors.red
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Ваш отзыв:',
                          style: TextStyles.mediumStyle.copyWith(
                            fontSize: 18,
                            color: ColorStyles.neutralsTextPrimaryColor,
                          ),
                        ),
                        const SizedBox(height: 8,),
                        Text(

                          'Классная книга рекомендую!',
                          style: TextStyles.regularStyle.copyWith(
                            fontSize: 14,
                            color: ColorStyles.neutralsTextPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ) : const Offstage(),
                  (!widget.haveReviewAndFinishedContainer) ? const Offstage() : !isPressed ? const SizedBox(height: 122,) : const SizedBox(height: 64,),
                ],
              ),
            ),
          ),
          (!widget.haveReviewAndFinishedContainer) ? const Offstage() : !isPressed ? Positioned(
            bottom: -10,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16,16,16,0),
              height: 116.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, -1),
                        color: Colors.black12
                    )
                  ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Вы закончили книгу',
                        style: TextStyles.boldStyle.copyWith(
                          fontSize: 23,
                          color: ColorStyles.neutralsTextPrimaryColor,
                        ),
                      ),
                      const SizedBox(width: 6,),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorStyles.primaryBorderColor,
                        ),
                        child: const Icon(
                          Icons.done,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    'Не забудьте сдать ментору книгу, чтобы он поставил вам оценку.',
                    style: TextStyles.mediumStyle.copyWith(
                      fontSize: 16,
                      color: ColorStyles.neutralsTextPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ) : const Offstage(),
          (!widget.haveReviewAndFinishedContainer) ? const Offstage() : isPressed ? Positioned(
              bottom: 16,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: BookButtonWidget(
                        onPressed: (){
                          Navigator.of(context).pushNamed(MyBookReviewRoute, arguments: {
                            'id' : widget.id
                          }).then((_) => setState((){}));
                          setState(() {
                            isPressed = !isPressed;
                          });
                        },
                        title: 'Закончить',
                        height: 48
                    )
                )
              ),
          ) : const Offstage(),
        ],
      ),
    );
  }

  Widget myContainer(int num,String word){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: isPressed ? (MediaQuery.of(context).size.width-48)/3 : (MediaQuery.of(context).size.width-48)/2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorStyles.hue246SurfaceHoverColor,
        // color: Colors.red
      ),
      child : Column(
        children: [
          Text(
            '$num',
            style: TextStyles.boldStyle.copyWith(
              fontSize: 24,
              color: ColorStyles.neutralsTextPrimaryColor,
            ),
          ),
          const SizedBox(height: 8,),
          Text(
            word,
            style: TextStyles.boldStyle.copyWith(
              fontSize: 14,
              color: ColorStyles.neutralsTextPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
