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
  static TextStyle mediumStyle = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ColorStyles.infoTextColor,
    fontFamily: 'CeraPro',
    // letterSpacing: 0.3
  );
  static TextStyle regularStyle = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorStyles.infoTextColor,
    fontFamily: 'CeraPro',
    // letterSpacing: 0.3
  );
}
