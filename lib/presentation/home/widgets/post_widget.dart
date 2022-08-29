//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/widgets/line_widget.dart';
import 'package:mugalim/presentation/home/screens/home_comments.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/presentation/home/widgets/post_actions_row_widget.dart';
import 'package:mugalim/presentation/home/widgets/vote_widget.dart';

import '../../../logic/home/bloc/home_bloc.dart';

class PostWidget extends StatefulWidget {
  final int? viewNumber;
  final int? savedNumber;
  final bool? saved;
  final int? commentNumber;
  final int? likeNumber;
  final String? createdAt;
  final String? title;
  final String? id;
  final String? content;
  final bool? liked;
  final String? cityId;
  final bool? commeted;
  final List? img;
  final String? regionId;
  final String? type;
  final String? userId;
  final String? updatedAt;

  final List? imgs;
  const PostWidget( {
    Key? key,
    this.viewNumber, this.savedNumber, this.saved, this.commentNumber, this.likeNumber, this.createdAt, this.title, this.id, this.content, this.liked, this.cityId, this.commeted, this.img, this.regionId, this.type, this.userId, this.updatedAt,this.imgs,

  }) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  String gonna = "";
  bool isExpanded = false;

  bool hasVote = true;
  int votePPL1 = 45;
  int votePPL2 = 45;
  int voteProcent1 = 90;
  int voteProcent2 = 90;
  String voteAnswer1 = 'Да, пойду truyytyit guyvuiiio ihihuig78tf';
  String voteAnswer2 =  'Нет, не пойду';
  String votetitle =  'Пойдете ли в горы вместе с группой?';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => HomeCommentsPage(
        //       pplLike: widget.pplLike,
        //       pplCommented: widget.pplCommented,
        //       pplSaved: widget.pplSaved,
        //       pplShow: widget.pplShow,
        //       hasImg: widget.hasImg,
        //       hasVote: widget.hasVote,
        //       image: widget.image,
        //       imageAuthor: widget.imageAuthor,
        //       title: widget.title,
        //       postAuthor: widget.postAuthor,
        //       postPublicationDate: widget.postPublicationDate,
        //       votePPL1: widget.votePPL1,
        //       votePPL2: widget.votePPL2,
        //       voteProcent1: widget.voteProcent1,
        //       voteProcent2: widget.voteProcent2,
        //       voteAnswer1: widget.voteAnswer1,
        //       voteAnswer2: widget.voteAnswer2,
        //       votetitle: widget.votetitle,
        //     ),
        //   ),
        // );
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
                top: 8,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset(
                          'assets/icons/mugalim_logo.svg',
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
                            widget.title!,
                            style: TextStyles.mediumStyle.copyWith(
                              color: ColorStyles.neutralsTextPrimaryColor,
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                          Text(
                            widget.updatedAt!,
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
                      widget.content!,
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
                  widget.content!.length < 197
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
                    visible: widget.img!.isNotEmpty ? true : false,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/space.png',
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                        sizedBoxHeight8(),
                        LineWidget(width: MediaQuery.of(context).size.width-32),
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
                          visible: hasVote,
                          child: Column(
                            children: [
                              VoteWidget(
                                votetitle: votetitle,
                                voteAnswer1: voteAnswer1,
                                voteAnswer2: voteAnswer2,
                                voteProcent1: voteProcent1,
                                voteProcent2: voteProcent2,
                                votePPL1: votePPL1,
                                votePPL2: votePPL2,
                              ),
                              sizedBoxHeight8(),
                              LineWidget(width: MediaQuery.of(context).size.width-32,),
                            ],
                          ),
                        ),
                        sizedBoxHeight8(),
                        ActionsRowWidget(
                          pplLike: widget.likeNumber!,
                          pplCommented: widget.commentNumber!,
                          pplSaved: widget.savedNumber!,
                          pplShow: widget.viewNumber!,
                        ),
                        // sizedBoxHeight16(),
                      ],
                    ),
                  ),
                ],
              ),
            )

      );
  }
}
