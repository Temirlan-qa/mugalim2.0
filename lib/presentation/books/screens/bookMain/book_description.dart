import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mugalim/presentation/books/widgets/book_widget.dart';

import '../../../../core/const/const_color.dart';
import '../../../../core/const/text_style_const.dart';
import '../../widgets/buttonBook_widget.dart';

class BookDescriptionScreen extends StatefulWidget {
  final BuildContext devScreenContext;
  const BookDescriptionScreen({Key? key,required this.devScreenContext}) : super(key: key);

  @override
  State<BookDescriptionScreen> createState() => _BookDescriptionScreenState();
}

class _BookDescriptionScreenState extends State<BookDescriptionScreen> {
  String title = 'Изменить других можно! Как помочь сотрудникам, друзьям и любимым расти и развиваться';
  String author = 'Питер Брегман и Хауи Джейкобсон';
  String description = 'Изменить людей невозможно, изменить можно только себя. Это распространенное мнение, как показывают авторы книги, оказывается в корне неверным. Умение вдохновлять окружающих и помогать им меняться к лучшему — не просто полезный талант, а важнейший профессиональный навык для лидеров разного уровня, от руководителей крупных компаний до школьных учителей. Как побудить конфликтных сотрудников работать в команде? Как раскрыть потенциал неуверенного в себе человека во благо общего дела, поддержать партнера, помочь избавиться от ложных ';
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
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
              Navigator.pop(widget.devScreenContext);
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
                          const Align(
                            alignment: Alignment.center,
                              child: BookWidget(textMonth: 'Сентябрь', img: 'assets/images/bookImage1.png')
                          ),
                          const SizedBox(height: 16,),
                          Text(
                            title,
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

                          Row(
                            children: [
                              myContainer('312','СТРАНИЦ'),
                              const SizedBox(width: 8,),
                              myContainer('34','ЧИТАТЕЛЕЙ'),
                              const SizedBox(width: 8,),
                              !isPressed ? myContainer('21','ДНЕЙ') : const Offstage(),
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
                          description,
                          style: TextStyles.regularStyle.copyWith(
                            fontSize: 14,
                            color: ColorStyles.neutralsTextPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16,),
                  isPressed ? Container(
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
                          'Классная книга рекоменд!',
                          style: TextStyles.regularStyle.copyWith(
                            fontSize: 14,
                            color: ColorStyles.neutralsTextPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ) : const Offstage(),
                  isPressed ? const SizedBox(height: 122,) : const SizedBox(height: 64,),
                ],
              ),
            ),
          ),
          isPressed ? Positioned(
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
          !isPressed ? Positioned(
              bottom: 16,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: BookButtonWidget(
                        onPressed: (){
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

  Widget myContainer(String num,String word){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: !isPressed ? (MediaQuery.of(context).size.width-48)/3 : (MediaQuery.of(context).size.width-48)/2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorStyles.hue246SurfaceHoverColor,
        // color: Colors.red
      ),
      child : Column(
        children: [
          Text(
            num,
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
