import 'package:flutter/material.dart';

import 'const_color.dart';

class TextStyles {
  static TextStyle boldStyle = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorStyles.infoTextColor,
    fontFamily: 'CeraPro',
    // letterSpacing: 0.3
  );
  static TextStyle mediumStyle = const TextStyle(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w500,
    fontFamily: 'CeraPro',
    // letterSpacing: 0.3
  );
  static TextStyle regularStyle = const TextStyle(
    decoration: TextDecoration.none,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    fontFamily: 'CeraPro',
    height: 1.2,
  );

  static TextStyle voteStyle = const TextStyle(
    height: 1.2,
    decoration: TextDecoration.none,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    fontFamily: 'CeraPro',
    // letterSpacing: 0.3
  );
}
