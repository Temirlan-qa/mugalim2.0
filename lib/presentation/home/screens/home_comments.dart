import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/widgets/line_widget.dart';
import 'package:mugalim/presentation/home/widgets/SizedBox.dart';
import 'package:mugalim/presentation/home/widgets/post_actions_row_widget.dart';
import 'package:mugalim/presentation/home/widgets/vote_widget.dart';

class HomeCommentsPage extends StatefulWidget {
  // post data
  final String postAuthor;
  final String postPublicationDate;

  final String title;
  final String imageAuthor;

  // All info about image
  final bool hasImg;
  final String image;

  // All info about Vote
  final bool hasVote;
  final String votetitle;
  final String voteAnswer1;
  final String voteAnswer2;
  final int votePPL1;
  final int votePPL2;
  final int voteProcent1;
  final int voteProcent2;

  // Like Save Comments Show
  final int pplShow;
  final int pplLike;
  final int pplCommented;
  final int pplSaved;

  const HomeCommentsPage({
    Key? key,
    required this.title,
    required this.postPublicationDate,
    required this.postAuthor,
    required this.imageAuthor,

    // All info about image
    required this.hasImg,
    required this.image,

    // All info about Vote
    required this.hasVote,
    required this.voteAnswer1,
    required this.voteAnswer2,
    required this.votePPL1,
    required this.votePPL2,
    required this.voteProcent1,
    required this.voteProcent2,
    required this.votetitle,

    //
    required this.pplCommented,
    required this.pplLike,
    required this.pplShow,
    required this.pplSaved,
  }) : super(key: key);

  @override
  State<HomeCommentsPage> createState() => _HomeCommentsPageState();
}

class _HomeCommentsPageState extends State<HomeCommentsPage> {
  String str =
      'Нельзя без последствий для здоровья изо дня в день проявлять себя противно тому, что чувствуешь; распинаться перед тем, чего не любишь, радоваться тому, что приносит несчастье. Наша нервная систем...';

  String str1 =
      "That's a fantastic new app feature.You and your\nteam did an excellent job of incorporating user\ntesting feedback.";
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          'Пост',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
            fontFamily: 'CeraPro',
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            color: const Color(0xFF3D3DD8),
            onPressed: () {},
            icon: const Icon(
              Icons.ios_share,
              size: 20,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Color(0xFF3D3DD8),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              child: Image.asset(
                                widget.imageAuthor,
                                width: 44,
                                height: 44,
                              ),
                            ),
                            sizedBoxWidth16(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  widget.postAuthor,
                                  style: TextStyles.mediumStyle.copyWith(
                                    color: const Color(0xFF1A1A1A),
                                    fontSize: 14,
                                    height: 1.4,
                                  ),
                                ),
                                Text(
                                  widget.postPublicationDate,
                                  style: TextStyles.regularStyle.copyWith(
                                    color: const Color(0xff767676),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.more_horiz,
                                size: 28,
                                color: Color(0xFF767676),
                              ),
                            ),
                          ],
                        ),
                        sizedBoxHeight16(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.title,
                            style: TextStyles.regularStyle.copyWith(
                              color: const Color(0xFF1A1A1A),
                            ),
                            maxLines: isExpanded ? 11 : 4,
                            softWrap: true,
                            // overflow: TextOverflow.fade,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        widget.title.length < 197
                            ? SizedBox()
                            : InkWell(
                          onTap: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              isExpanded == false
                                  ? 'Показать полностью...'
                                  : 'Show less',
                              style: TextStyles.mediumStyle.copyWith(
                                fontSize: 14,
                                color: const Color(0xff3D3DD8),
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                        sizedBoxHeight8(),
                        Visibility(
                          visible: widget.hasVote,
                          child: Column(
                            children: [
                              VoteWidget(
                                votetitle: widget.votetitle,
                                voteAnswer1: widget.voteAnswer1,
                                voteAnswer2: widget.voteAnswer2,
                                voteProcent1: widget.voteProcent1,
                                voteProcent2: widget.voteProcent2,
                                votePPL1: widget.votePPL1,
                                votePPL2: widget.votePPL2,
                              ),
                              sizedBoxHeight8(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: widget.hasImg,
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      // top: 16,
                    ),
                    child: Column(
                      children: [
                        sizedBoxHeight8(),
                        ActionsRowWidget(
                          pplLike: widget.pplLike,
                          pplCommented: widget.pplCommented,
                          pplSaved: widget.pplSaved,
                          pplShow: widget.pplShow,
                        ),
                        sizedBoxHeight16(),
                        const LineWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            sizedBoxHeight8(),
            ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 22,
                            child: ClipOval(
                              child: Image.asset("assets/images/mugalim.png"),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'Mugalim Global',
                                style: TextStyle(
                                  fontSize: 14,
                                  decoration: TextDecoration.none,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'CeraPro',
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                str1,
                                style: const TextStyle(
                                  fontSize: 13,
                                  decoration: TextDecoration.none,
                                  color: Color(0xff767676),
                                  fontFamily: 'CeraPro',
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '5 авг в 13:54',
                                    style: TextStyle(
                                      color: Color(0xFF767676),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Cera Pro',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Ответить',
                                      style: TextStyle(
                                        color: Color(0xFF3D3DD8),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Cera Pro',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 85,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.favorite,
                                          color: Color(0xFFE71D36),
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '1',
                                          style: TextStyle(
                                            color: Color(0xFFE71D36),
                                            fontFamily: 'Cera Pro',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
                // return Container(
                //   color: ColorStyles.neutralsPageBackgroundColor,
                //   padding: EdgeInsets.symmetric(horizontal: 16),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           CircleAvatar(
                //             radius: 22,
                //             child: ClipOval(
                //               child: Image.asset("assets/images/mugalim.png"),
                //             ),
                //           ),
                //           const SizedBox(
                //             width: 16,
                //           ),
                //
                //           Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             children: [
                //               Text(
                //                 'Maude Hall',
                //                 style: TextStyle(
                //                   fontSize: 13,
                //                   color: Color(0xFF1A1A1A),
                //                   fontWeight: FontWeight.w500,
                //                   fontFamily: 'CeraPro',
                //                 ),
                //               ),
                //               Text(
                //                 str1,
                //                 style: TextStyle(
                //                   fontWeight: FontWeight.w400,
                //                   fontSize: 13,
                //                   height: 1.2,
                //                   color: Color(0xFF1A1A1A),
                //                   fontFamily: 'CeraPro',
                //                 ),
                //               ),
                //               SizedBox(height: 10,),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Text(
                //                     '5 авг в 13:54',
                //                     style: TextStyle(
                //                       color: Color(0xFF767676),
                //                       fontSize: 13,
                //                       fontWeight: FontWeight.w400,
                //                       fontFamily: 'Cera Pro',
                //                     ),
                //                   ),
                //                   SizedBox(width: 16,),
                //                   TextButton(
                //                     onPressed: (){},
                //                     child: Text(
                //                       'Ответить',
                //                       style: TextStyle(
                //                         color: Color(0xFF3D3DD8),
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.w500,
                //                         fontFamily: 'Cera Pro',
                //                       ),
                //                     ),
                //                   ),
                //                   SizedBox(width: 80,),
                //                   InkWell(
                //                     onTap: (){},
                //                     child: Row(
                //                       crossAxisAlignment:
                //                       CrossAxisAlignment.center,
                //                       mainAxisAlignment:
                //                       MainAxisAlignment.center,
                //                       children: const [
                //                         Icon(
                //                           Icons.favorite,
                //                           color: Color(0xFFE71D36),
                //                           size: 16,
                //                         ),
                //                         SizedBox(
                //                           width: 5,
                //                         ),
                //                         Text(
                //                           '1K',
                //                           style: TextStyle(
                //                             color: Color(0xFFE71D36),
                //                             fontFamily: 'Cera Pro',
                //                             fontWeight:
                //                             FontWeight.w500,
                //                             fontSize: 14,
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //
                //                 ],
                //               ),
                //             ],
                //           ),
                //
                //         ],
                //       ),
                //
                //     ],
                //   ),
                //
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
