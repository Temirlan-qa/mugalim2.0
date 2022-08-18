//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/widgets/line_widget.dart';
import 'package:mugalim/presentation/home/screens/home_comments.dart';
import 'package:mugalim/presentation/home/widgets/SizedBox.dart';
import 'package:mugalim/presentation/home/widgets/vote_widget.dart';

class PostWidget extends StatefulWidget {
  final String postAuthor;
  final String postPublicationDate;
  final String title;
  final String imageAuthor;

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
  }) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool click_to_show = false;
  String gonna = "";
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeCommentsPage()),
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
                  const LineWidget(),
                  sizedBoxHeight8(),
                  Row(
                    children: [
                      Container(
                        width: 45,
                        height: 28,
                        decoration: BoxDecoration(
                          color: const Color(0xffF9F9F9),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/heart.svg',
                              color: const Color(0xff767676),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              '0',
                              style: TextStyle(
                                color: Color(0xff767676),
                              ),
                            ),
                          ],
                        ),
                      ),
                      sizedBoxWidth8(),
                      Container(
                        width: 45,
                        height: 28,
                        decoration: BoxDecoration(
                          color: const Color(0xffF9F9F9),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/comment.svg',
                              color: const Color(0xff767676),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              '0',
                              style: TextStyle(
                                color: Color(0xff767676),
                              ),
                            ),
                          ],
                        ),
                      ),
                      sizedBoxWidth8(),
                      Container(
                        width: 45,
                        height: 28,
                        decoration: BoxDecoration(
                          color: const Color(0xffF9F9F9),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/share.svg',
                              color: const Color(0xff767676),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              '0',
                              style: TextStyle(
                                color: Color(0xff767676),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/eyeIcon.svg',
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            '2',
                            style: TextStyle(
                              color: Color(0xff767676),
                            ),
                          ),
                        ],
                      ),
                    ],
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
