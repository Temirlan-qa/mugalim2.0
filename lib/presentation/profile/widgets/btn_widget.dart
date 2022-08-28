import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';

class BtnWidget extends StatelessWidget {
  final onPressed;
  final String text;
  final double fontSize;
  final textColor;
  final Color;
  const BtnWidget(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.fontSize,
      required this.textColor,
      required this.Color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: Color,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 16,
        child: Center(
          child: Text(
            text,
            style: TextStyles.mediumStyle.copyWith(
              fontSize: fontSize,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
