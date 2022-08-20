//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/widgets/line_widget.dart';
import 'package:mugalim/presentation/home/screens/home_comments.dart';
import 'package:mugalim/presentation/home/widgets/SizedBox.dart';
import 'package:mugalim/presentation/home/widgets/post_actions_row_widget.dart';
import 'package:mugalim/presentation/home/widgets/vote_widget.dart';

class PostWidget extends StatefulWidget {
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
  final int pplLike;
  final int pplCommented;
  final int pplSaved;
  final int pplShow;

  const PostWidget({
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
    // Like Save Comments Show
    required this.pplLike,
    required this.pplCommented,
    required this.pplSaved,
    required this.pplShow,
  }) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  String gonna = "";
  bool isExpanded = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeCommentsPage(
              pplLike: widget.pplLike,
              pplCommented: widget.pplCommented,
              pplSaved: widget.pplSaved,
              pplShow: widget.pplShow,
              hasImg: widget.hasImg,
              hasVote: widget.hasVote,
              image: widget.image,
              imageAuthor: widget.imageAuthor,
              title: widget.title,
              postAuthor: widget.postAuthor,
              postPublicationDate: widget.postPublicationDate,
              votePPL1: widget.votePPL1,
              votePPL2: widget.votePPL2,
              voteProcent1: widget.voteProcent1,
              voteProcent2: widget.voteProcent2,
              voteAnswer1: widget.voteAnswer1,
              voteAnswer2: widget.voteAnswer2,
              votetitle: widget.votetitle,
            ),
          ),
        );
      },
      child: Container(
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
                              color: ColorStyles.neutralsTextPrimaryColor,
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                          Text(
                            widget.postPublicationDate,
                            style: TextStyles.regularStyle.copyWith(
                              color: ColorStyles.primarySurfaceHoverColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_horiz,
                          size: 28,
                          color: ColorStyles.primarySurfaceHoverColor,
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
                        color: ColorStyles.neutralsTextPrimaryColor,
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
                      ? const SizedBox()
                      : Visibility(
                          visible: !isExpanded,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isExpanded = true;
                              });
                            },
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                isExpanded ? '' : 'Показать полностью...',
                                style: TextStyles.mediumStyle.copyWith(
                                  fontSize: 14,
                                  color: ColorStyles.primaryBorderColor,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ),
                  sizedBoxHeight8(),
                ],
              ),
            ),
            Visibility(
              visible: widget.hasImg,
              child: Column(
                children: [
                  Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                  sizedBoxHeight8(),
                  const LineWidget(),
                  sizedBoxHeight8(),
                ],
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
                        const LineWidget(),
                      ],
                    ),
                  ),
                  sizedBoxHeight8(),
                  ActionsRowWidget(
                    pplLike: widget.pplLike,
                    pplCommented: widget.pplCommented,
                    pplSaved: widget.pplSaved,
                    pplShow: widget.pplShow,
                  ),
                  sizedBoxHeight16(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
