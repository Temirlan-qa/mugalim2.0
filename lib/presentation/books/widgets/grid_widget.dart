import 'package:flutter/material.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';

import '../screens/bookMain/book_description.dart';
import 'book_widget.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {

  List<String> list = ['assets/images/bookImage1.png','assets/images/bookImage2.png','assets/images/bookImage3.png','assets/images/bookImage4.png'];
  String title = 'Изменить других можно! Как помочь';
  List textMonth = ['Сентябрь','Ноябрь','Октябрь','Декабрь'];
  String author = 'Натан Ф., Джефф Д., Клейтон К.';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - 40) / 2;
    final double itemWidth = size.width - 175;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,16,16,0),
      child: GridView.count(
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        childAspectRatio: (itemWidth / itemHeight),
        crossAxisCount: 2,
        children: List.generate(4, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8,left: 8),
            child: GestureDetector(
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
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorStyles.neutralsPageBackgroundColor,
                        ),
                        child: BookWidget(img: 'null', textMonth: textMonth[index],),
                      ),
                      const SizedBox(height: 8,),
                      Text(
                        title,
                        style: TextStyles.mediumStyle.copyWith(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        author,
                        style: TextStyles.regularStyle.copyWith(
                          fontSize: 13,
                          color: const Color(0xff767676),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 4,),
                    ],
                  ),
                )
              ),
            ),
          );
        }),
      ),
    );
  }
}
