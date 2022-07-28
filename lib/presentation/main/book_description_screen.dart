import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/presentation/main/done.dart';
import 'package:mugalim/presentation/main/select_jenre.dart';
class BookDescriptionScreen extends StatefulWidget {
  BookDescriptionScreen({Key? key, required this.index_month,required this.list_jenre}) : super(key: key);
  int index_month;
  List list_jenre;

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
          onPressed: (){
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
                    child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Center(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                    'assets/images/image 15.png',
                                    width: 140,
                                    height: 220,
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Создавая инновации. Креативное мышление',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Даер Джефф, Клейтон М. Кристенсен',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: ColorStyles.neutralsTextTertiaryColor
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                '4.0',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              SizedBox(width: 7,),
                              SvgPicture.asset('assets/icons/star_full.svg'),
                              SvgPicture.asset('assets/icons/star_full.svg'),
                              SvgPicture.asset('assets/icons/star_full.svg'),
                              SvgPicture.asset('assets/icons/star_full.svg'),
                              SvgPicture.asset('assets/icons/star_full.svg'),
                              // RatingBar(
                              //   initialRating: state.book.rating!,
                              //   direction: Axis.horizontal,
                              //   allowHalfRating: true,
                              //   itemCount: 5,
                              //   itemSize: 18,
                              //   ratingWidget: RatingWidget(
                              //     full: SvgPicture.asset('assets/icons/star_full.svg'),
                              //     half: SvgPicture.asset('assets/icons/star_half.svg'),
                              //     empty: SvgPicture.asset('assets/icons/star_empty.svg'),
                              //   ),
                              //   itemPadding: EdgeInsets.symmetric(horizontal: 8.0),
                              //   ignoreGestures: true,
                              //   onRatingUpdate: (rating) {
                              //     print(rating);
                              //   },
                              // )
                            ],
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Описание",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adu lts but is often read by adolescents for its theme of angst, alienation and as a critique......',
                            style: TextStyle(
                              color: ColorStyles.neutralsTextTertiaryColor,
                              // color: ColorStyles.neutralsTextTertiaryColor
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            Positioned(
              bottom: 32,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0),
                child: TextButton(
                  child: Text(
                    "Выбрать книгу",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'CeraPro',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    primary: Color(0xFFE0E0E0),
                    backgroundColor: Color(0xff3D3DD8),
                    elevation: 3,
                    minimumSize: Size(
                        MediaQuery.of(context).size.width-32, 48
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed:() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JenreScreen(index_month: widget.index_month,list_jenre: widget.list_jenre))
                      );
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
