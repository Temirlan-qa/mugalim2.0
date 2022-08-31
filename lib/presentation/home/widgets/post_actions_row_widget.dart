import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import "package:intl/intl.dart";

import '../../../core/injection_container.dart';
import '../../../logic/home/data/datasources/home_datasources.dart';
import 'package:dio/src/response.dart';

class ActionsRowWidget extends StatefulWidget {
  final int pplShow;
  final int pplLike;
  final int pplCommented;
  final int pplSaved;
  final bool liked;
  final bool saved;
  final String id;
  const ActionsRowWidget({
    Key? key,
    required this.pplCommented,
    required this.pplLike,
    required this.pplShow,
    required this.pplSaved,
    required this.liked,
    required this.saved,
    required this.id,
  }) : super(key: key);

  @override
  State<ActionsRowWidget> createState() => _ActionsRowWidgetState();
}

class _ActionsRowWidgetState extends State<ActionsRowWidget> {
  bool isLiked = false;
  bool isSaved = false;
  int likedCount = 0;
  int savedCount = 0;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if(count == 0) {
      isLiked = widget.liked;
      isSaved = widget.saved;
    }
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () async {
                setState(()  {
                  isLiked = !isLiked;
                  if(isLiked) {
                    likedCount += 1;
                  }
                  else {
                    likedCount -= 1;
                  }
                  count++;
                });
                print(isLiked);
                final HomeDatasource homeDatasource = sl();
                // if(liked[index]){
                Response response = (await homeDatasource.likedPost(widget.id,'POSTLIKE'));
                // }
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                // width: 60,
                // height: 28,
                decoration: BoxDecoration(
                  color: isLiked
                      ? const Color(0xFFE71D36).withOpacity(0.1)
                      : ColorStyles.primarySurfaceColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isLiked
                        ? SvgPicture.asset(
                      'assets/icons/redheart.svg',
                      color: const Color(0xFFE71D36),
                    )
                        : SvgPicture.asset(
                      'assets/icons/heart.svg',
                      color: ColorStyles.primarySurfaceHoverColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      NumberFormat.compactCurrency(
                        decimalDigits: 0,
                        symbol: ' ',
                      ).format(widget.pplLike+likedCount),
                      style: TextStyles.mediumStyle.copyWith(
                        fontSize: 14,
                        color: isLiked
                            ? const Color(0xFFE71D36)
                            : ColorStyles.primarySurfaceHoverColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            sizedBoxWidth8(),
            GestureDetector(
              onTap: () async {

              },
              child: Container(
                padding: const EdgeInsets.all(8),
                // width: 60,
                // height: 28,
                decoration: BoxDecoration(
                  color: ColorStyles.primarySurfaceColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/comment.svg',
                      color: ColorStyles.primarySurfaceHoverColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      NumberFormat.compactCurrency(
                        decimalDigits: 0,
                        symbol: ' ',
                      ).format(widget.pplCommented),
                      style: TextStyles.mediumStyle.copyWith(
                        fontSize: 14,
                        color: ColorStyles.primarySurfaceHoverColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            sizedBoxWidth8(),
            GestureDetector(
              onTap: () async {
                setState(()  {
                  isSaved = !isSaved;
                  if(isSaved) {
                    savedCount += 1;
                  }
                  else {
                    savedCount -= 1;
                  }
                });
                final HomeDatasource homeDatasource = sl();
                Response response = isSaved ? (await homeDatasource.savedPost(widget.id)) : (await homeDatasource.deletePost(widget.id));

              },
              child: Container(
                padding: const EdgeInsets.all(8),
                // width: 60,
                // height: 28,
                decoration: BoxDecoration(
                  color: isSaved
                      ? const Color(0xFFFFB800).withOpacity(0.1)
                      : ColorStyles.primarySurfaceColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isSaved
                        ? SvgPicture.asset(
                      'assets/icons/sharesave.svg',
                      color: const Color(0xFFFFB800),
                    )
                        : SvgPicture.asset(
                      'assets/icons/share.svg',
                      color: ColorStyles.primarySurfaceHoverColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      NumberFormat.compactCurrency(
                        decimalDigits: 0,
                        symbol: ' ',
                      ).format(savedCount),
                      style: TextStyles.mediumStyle.copyWith(
                        fontSize: 14,
                        color: isSaved
                            ? const Color(0xFFFFB800)
                            : ColorStyles.primarySurfaceHoverColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.remove_red_eye_sharp,
                  size: 16,
                  color: ColorStyles.primarySurfaceHoverColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  NumberFormat.compactCurrency(
                    decimalDigits: 0,
                    symbol: ' ',
                  ).format(widget.pplShow),
                  style: TextStyles.mediumStyle.copyWith(
                    fontSize: 14,
                    color: ColorStyles.primarySurfaceHoverColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        sizedBoxHeight16(),
      ],
    );
  }
}
