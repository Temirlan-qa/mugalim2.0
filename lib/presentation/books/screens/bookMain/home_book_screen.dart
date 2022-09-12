import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/const/const_color.dart';
import '../../../../core/const/text_style_const.dart';
import '../../widgets/bookList_widget.dart';
import 'book_description.dart';

class HomeBookScreen extends StatefulWidget {
  final BuildContext devScreenContext;

  const HomeBookScreen({Key? key, required this.devScreenContext}) : super(key: key);

  @override
  State<HomeBookScreen> createState() => _HomeBookScreenState();
}

class _HomeBookScreenState extends State<HomeBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Книги',
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
      body: SingleChildScrollView(

        child: Column(
          children: [
            const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: ColorStyles.backgroundColor
                ),
                  child: Column(
                    children: [
                      const SizedBox(height: 16,),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Книга этого месяца',
                            style: TextStyles.mediumStyle.copyWith(
                              fontSize: 20,
                              color: ColorStyles.neutralsTextPrimaryColor,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          //BookDescriptionScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BookDescriptionScreen(devScreenContext: context,),
                            ),
                          );
                        },
                        child: Stack(
                          children: const [
                            BookListWidget(
                              img: 'assets/images/bookImage3.png',
                              haveDays: true, textMonth: 'Ноябрь',
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ),
            const SizedBox(height: 16,),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: ColorStyles.backgroundColor
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Прошедшие месяца',
                        style: TextStyles.mediumStyle.copyWith(
                          fontSize: 20,
                          color: ColorStyles.neutralsTextPrimaryColor,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                      itemBuilder: (context,index){
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                //BookDescriptionScreen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BookDescriptionScreen(devScreenContext: context,),
                                  ),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: BookListWidget(
                                  img: 'assets/images/bookImage1.png',
                                  haveDays: false, textMonth: 'Сентябрь',
                                ),
                              ),
                            ),
                            index != 1 ? const Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 16.0),
                              child: Divider(height: 1,),
                            ) : const Offstage(),
                          ],
                        );
                      }
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
