import 'package:flutter/material.dart';

class LineWidget extends StatelessWidget {
  final double width;
  const LineWidget({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // neutral dark theme PageBackgroundColor
    return Container(
      color: const Color(0xFFE0E0E0),
      height: 1,
      width: width,
      //width: MediaQuery.of(context).size.width -32,
    );
  }
}
