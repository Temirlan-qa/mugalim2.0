import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/logic/book/data/models/book_list_model.dart';
import 'package:mugalim/presentation/books/screens/selectBook/done.dart';
import 'package:mugalim/presentation/books/screens/selectBook/select_jenre.dart';
import '../../../../core/routes/environment_config.dart';

// ignore: must_be_immutable
class BookDescriptionScreen extends StatefulWidget {
  BookDescriptionScreen(
      {Key? key,
      required this.indexMonth,
      required this.list,
        required this.model,
        required this.addList,
        required this.choiceList,
        required this.id,
        required this.selectIndex
      }) : super(key: key);
  int indexMonth;
  String id;
  List list;
  int selectIndex;
  final BookListModel model;
  List<Map<String, String>> choiceList;
  List addList;
  @override
  State<BookDescriptionScreen> createState() => _BookDescriptionScreenState();
}

class _BookDescriptionScreenState extends State<BookDescriptionScreen> {
  Box tokensBox = Hive.box('tokens');

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
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left,
            size: 24,
            color: ColorStyles.primaryShapeColor,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Center(
                          child: widget.model.avatarId != null ? ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: CachedNetworkImage(
                                imageUrl:'${EnvironmentConfig.url}/file/image/${widget.model.avatarId}',
                                height: 220,
                                width: 140,
                                fit: BoxFit.cover,
                                httpHeaders: {
                                  'Content-Type': 'application/json',
                                  'Accept': 'application/json',
                                  "Authorization": "Bearer ${tokensBox
                                      .get('access')}"
                                },
                                placeholder: (context,
                                    url) =>
                                const Offstage(),
                                errorWidget: (context, str, url) =>
                                const Offstage()
                            ),
                          ) : ClipRRect(
                              borderRadius:
                              BorderRadius.circular(6.0),
                              child:
                              Image.asset(
                                'assets/images/skeletonBookImage.png',
                                height: 220,
                                width: 140,
                                  fit: BoxFit.cover
                              ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.model.name!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.model.authors[0]!.fio!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 12),
                        // widget.id == '' && widget.list == [] ? Row(
                        //   children: [
                        //     const Text(
                        //       '4.0',
                        //       style: TextStyle(
                        //         fontSize: 18,
                        //         fontWeight: FontWeight.w500,
                        //       ),
                        //     ),
                        //     const SizedBox(
                        //       width: 7,
                        //     ),
                        //     SvgPicture.asset('assets/icons/star_full.svg'),
                        //     const SizedBox(
                        //       width: 8,
                        //     ),
                        //     SvgPicture.asset('assets/icons/star_full.svg'),
                        //     const SizedBox(
                        //       width: 8,
                        //     ),
                        //     SvgPicture.asset('assets/icons/star_full.svg'),
                        //     const SizedBox(
                        //       width: 8,
                        //     ),
                        //     SvgPicture.asset('assets/icons/star_full.svg'),
                        //     const SizedBox(
                        //       width: 8,
                        //     ),
                        //     SvgPicture.asset('assets/icons/star_empty.svg'),
                        //   ],
                        // ) : const Offstage(),
                        const SizedBox(height: 16),
                        const Text(
                          "Описание",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.model.description!,
                          style: TextStyle(
                            color: ColorStyles.primarySurfaceHoverColor,
                            fontSize: 16,
                            height: 1.5,
                            // Figma's line height: fontSize * height = 24
                            // https://www.codegrepper.com/code-examples/whatever/line+height+figma+flutter
                            // color: ColorStyles.neutralsTextTertiaryColor
                          ),
                        ),
                        const SizedBox(height: 130,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          widget.id != '' ? Positioned(
            bottom: 50,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: TextButton(
                    style: TextButton.styleFrom(
                      primary: const Color(0xFFE0E0E0),
                      backgroundColor: const Color(0xff3D3DD8),
                      elevation: 3,
                      minimumSize: const Size(343, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () async {
                      widget.addList.remove(widget.selectIndex);
                      widget.choiceList.add({
                        "voteId": widget.id,
                        "resultOptionId": widget.model.id!,
                      });
                      if (widget.indexMonth.toInt() >= 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChoosenPage(choiceList: widget.choiceList,)
                          ),
                        );
                      }
                      if (widget.list.isNotEmpty && widget.indexMonth.toInt() < 3) {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GenreScreen(
                              indexMonth: widget.indexMonth.toInt() + 1,
                              list: widget.list,
                              addList: widget.addList,
                              choiceList: widget.choiceList,
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Выбрать книгу",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'CeraPro',
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
            ),
          ) : const Offstage(),
        ],
      ),
    );
  }
}
