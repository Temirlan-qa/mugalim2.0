import 'package:flutter/material.dart';


class LineWidget extends StatelessWidget {
  const LineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // neutral dark theme PageBackgroundColor
    return Container(
      //color: brightness == Brightness.dark ? ColorStyles.neutral dark theme PageBackgroundColor : ColorStyles.neutralsPageBackgroundColor,
      color: const Color(0xFFE0E0E0),
      height: 1,
      width: MediaQuery.of(context).size.width -32,
    );
  }
}
