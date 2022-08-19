import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/presentation/home/widgets/SizedBox.dart';
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


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 60,
              height: 28,
              padding: EdgeInsets.only(

              ),
              decoration: BoxDecoration(
                color: ColorStyles.primarySurfaceColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/heart.svg',
                    color: ColorStyles.primarySurfaceHoverColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    NumberFormat.compactCurrency(decimalDigits:0,symbol: ' ',).format(widget.pplLike),
                    style: TextStyles.mediumStyle.copyWith(
                      fontSize: 14,
                      color: ColorStyles.primarySurfaceHoverColor,
                    ),
                  ),
                ],
              ),
            ),
            sizedBoxWidth8(),
            Container(
              width: 60,
              height: 28,
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
                    NumberFormat.compactCurrency(decimalDigits:0,symbol: ' ',).format(widget.pplCommented),
                    style: TextStyles.mediumStyle.copyWith(
                      fontSize: 14,
                      color: ColorStyles.primarySurfaceHoverColor,
                    ),
                  ),
                ],
              ),
            ),
            sizedBoxWidth8(),
            Container(
              width: 60,
              height: 28,
              decoration: BoxDecoration(
                color: ColorStyles.primarySurfaceColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/share.svg',
                    color: ColorStyles.primarySurfaceHoverColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    NumberFormat.compactCurrency(decimalDigits:0,symbol: ' ',).format(widget.pplSaved),
                    style: TextStyles.mediumStyle.copyWith(
                      fontSize: 14,
                      color: ColorStyles.primarySurfaceHoverColor,
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
                Icon(
                  Icons.remove_red_eye_sharp,
                  size: 16,
                  color: ColorStyles.primarySurfaceHoverColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  NumberFormat.compactCurrency(decimalDigits:0,symbol: ' ',).format(widget.pplShow),
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


