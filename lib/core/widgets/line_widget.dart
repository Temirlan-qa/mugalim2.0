import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mugalim/core/const/const_color.dart';


class LineWidget extends StatelessWidget {
  const LineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    // neutralsdarkthemePageBackgroundColor
    return Container(
      //color: brightness == Brightness.dark ? ColorStyles.neutralsdarkthemePageBackgroundColor : ColorStyles.neutralsPageBackgroundColor,
      color: Color(0xFFE0E0E0),
      height: 1,
      width: MediaQuery.of(context).size.width -32,
    );
  }
}
