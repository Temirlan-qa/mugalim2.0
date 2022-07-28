import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/widgets/button_widget.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}
enum SingingCharacter { lafayette }


class _BookScreenState extends State<BookScreen> {
  SingingCharacter? _character = SingingCharacter.lafayette;
  bool _value = false;
  Object val = -1;
  List list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Container(
                color: ColorStyles.neutralsPageBackgroundColor,
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(46,16,47,0),
                        child: SizedBox(
                          // width: MediaQuery.of(context).size.width - 64,
                          child: Column(
                            children: [
                              Text('Выберите книгу',
                                style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  fontFamily: 'CeraPro',
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 8,),
                              Text('От этого зависит какую книгу вы будете читать в текущем учебном году ',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontFamily: 'CeraPro',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                        physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              list.clear();
                              if(!list.contains(index)){
                                list.add(index);
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: list.contains(index) ? Color(0xff3D3DD8) : ColorStyles.neutralsPageBackgroundColor,width: 2),
                                color: Color(0xffF9F9F9),
                                // color: Colors.gre,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: index == 0 ? Image.asset('assets/images/book1.png')
                                      : index == 2 ? Image.asset('assets/images/book3.png') : index == 3 ? Image.asset('assets/images/book1.png') : Image.asset('assets/images/book2.png'),
                                    ),
                                    SizedBox(width: 16,),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Создавая инновации. Креативные идеи дл...',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: list.contains(index) ? Colors.black : Color(0xff767676),
                                              fontFamily: 'CeraPro',
                                              height: 1.5
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 4,),
                                          Text('Даер Джефф, Натан Ферр, Клейтон Крситен...',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: list.contains(index) ? Colors.black : Color(0xff767676),
                                              fontFamily: 'CeraPro',
                                              height: 1.5,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 12,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8),
                                            child: Text('Подробнее',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff3D3DD8),
                                                fontFamily: 'CeraPro',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        border: Border.all(color: list.contains(index) ? Color(0xff3D3DD8) : Colors.black,width: list.contains(index) ? 5 : 1),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 20,
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
                primary: Colors.black,
                backgroundColor: (list.isEmpty) ? Color(0xFFE0E0E0) : Color(0xff3D3DD8),
                elevation: 0,
                minimumSize: Size(
                    343, 48
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onPressed:() {
                setState(() {

                });
              },
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            child: TextButton(
              child: Text(
                "Обратно к жанрам",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'CeraPro',
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: TextButton.styleFrom(
                primary: Color(0xff3D3DD8),
                backgroundColor: ColorStyles.neutralsPageBackgroundColor,
                elevation: 0,
                minimumSize: Size(
                    343, 48
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onPressed:() {

              },
            ),
          ),
        ],
      ),
    );
  }
}
