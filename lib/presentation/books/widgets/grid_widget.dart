import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';

class GridWidget extends StatefulWidget {
  final String title;
  final String author;
  final String path;
  GridWidget({
    Key? key, required this.title, required this.author, required this.path,
  }) : super(key: key);

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {

  List<String> list = ['assets/images/bookImage1.png','assets/images/bookImage2.png','assets/images/bookImage3.png','assets/images/bookImage4.png'];
  String title = 'Изменить других можно! Как помочь';
  String author = 'Натан Ф., Джефф Д., Клейтон К.';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width-175;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,16,16,16),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: (itemWidth / itemHeight),
        crossAxisCount: 2,
        children: List.generate(4, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8,left: 8),
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                              list[index],
                            width: 135,
                            height: 201,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
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
                        color: Color(0xff767676),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    index % 2 == 1 ? SizedBox(width: 8,) : Offstage()
                  ],
                ),
              )
            ),
          );
        }),
      ),
    );
  }
}
