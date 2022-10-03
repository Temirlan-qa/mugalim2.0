import 'package:flutter/material.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/presentation/books/screens/successReview.dart';
import '../../../core/injection_container.dart';
import '../../../logic/book/data/datasources/book_datasources.dart';
import '../../auth/screens/success.dart';
import 'package:page_transition/page_transition.dart';

class MyReviewScreen extends StatefulWidget {
  final String bookId;
  const MyReviewScreen({Key? key, required this.bookId}) : super(key: key);

  @override
  State<MyReviewScreen> createState() => _MyReviewScreenState();
}

class _MyReviewScreenState extends State<MyReviewScreen>
    with SingleTickerProviderStateMixin {
  final BookDatasource bookDatasource = sl();
  @override
  void initState() {
    super.initState();
  }
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Оставить отзыв',
            style: TextStyles.boldStyle.copyWith(
              fontSize: 23,
              color: ColorStyles.neutralsTextPrimaryColor,
              fontFamily: 'CeraPro',
            ),
          ),
          elevation: 0.0,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: ColorStyles.primaryBorderColor,
            ),
          ),
        ),
        body: Stack(
          children: [
            const SuccessPage(),
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16.0))),
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          'Не забудьте сдать ментору книгу!',
                          style: TextStyles.mediumStyle.copyWith(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'CeraPro',
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text('Отзыв',
                              style: TextStyles.mediumStyle.copyWith(
                                fontSize: 16,
                                color: ColorStyles.neutralsTextPrimaryColor,
                                fontFamily: 'CeraPro',
                              ))),
                      TextField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          // label: Text('Пару слов о книге...', style: TextStyles.mediumStyle.copyWith(
                          //   color: ColorStyles.primarySurfaceHoverColor,
                          //   fontSize: 16,
                          //   fontFamily: 'CeraPro',
                          // ),
                          //   textAlign: TextAlign.start,
                          // ),
                          hintText: 'Пару слов о книге...',
                          hintStyle: TextStyles.mediumStyle.copyWith(
                            color: ColorStyles.primarySurfaceHoverColor,
                            fontSize: 16,
                            fontFamily: 'CeraPro',
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                                color: ColorStyles.neutralsTextPrimaryColor,
                                width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                                color: ColorStyles.neutralsTextPrimaryColor,
                                width: 1),
                          ),
                        ),
                        maxLines: 5,
                        // onChanged: (value) {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: ColorStyles.primaryBorderColor,
                            elevation: 3,
                            minimumSize: Size(
                                MediaQuery.of(context).size.width - 32, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () async {
                            // Navigator.push(context, PageTransition(child: SucessReview(), type: PageTransitionType.fade));
                            print(textEditingController.text);
                            print(widget.bookId);
                            Navigator.of(context).push(
                                PageTransition(
                                    child: const SuccessReview(),
                                    type: PageTransitionType.fade));
                            await bookDatasource.reviewPost(widget.bookId, textEditingController.text, 0);
                          },
                          child: Text("Закончить книгу",
                              style: TextStyles.mediumStyle
                                  .copyWith(fontSize: 16, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }
}
