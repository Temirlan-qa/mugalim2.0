import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import "package:intl/intl.dart";

class ActionsRowWidget extends StatefulWidget {
  final int pplShow;
  final int pplLike;
  final int pplCommented;
  final int pplSaved;
  const ActionsRowWidget({
    Key? key,
    required this.pplCommented,
    required this.pplLike,
    required this.pplShow,
    required this.pplSaved,
  }) : super(key: key);

  @override
  State<ActionsRowWidget> createState() => _ActionsRowWidgetState();
}

class _ActionsRowWidgetState extends State<ActionsRowWidget> {
  bool isLiked = false;
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isLiked = !isLiked;
                });

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
                      ).format(widget.pplLike + (isLiked ? 1 : 0)),
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
            Container(
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
            sizedBoxWidth8(),
            GestureDetector(
              onTap: () {
                setState(() {
                  isSaved = !isSaved;
                });
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
                      ).format(widget.pplSaved + (isSaved ? 1 : 0)),
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
