import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mugalim/core/const/const_color.dart';

class LineWidget extends StatelessWidget {
  final double width;
  const LineWidget({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    // neutralsdarkthemePageBackgroundColor
    return Container(
      //color: brightness == Brightness.dark ? ColorStyles.neutralsdarkthemePageBackgroundColor : ColorStyles.neutralsPageBackgroundColor,
      color: const Color(0xFFE0E0E0),
      height: 1,
      width: width,
      //width: MediaQuery.of(context).size.width -32,
    );
  }
}
