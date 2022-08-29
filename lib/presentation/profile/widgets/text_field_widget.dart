import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/const_color.dart';

InputDecoration textFieldStyleForChangePassword(){

  return InputDecoration(
    suffix: GestureDetector(
      onTap: (){},
      child: SvgPicture.asset(
          'assets/icons/eye_icon.svg',
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        width: 1.0,
        color: ColorStyles.primarySurfaceHoverColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        width: 1.0,
        color: ColorStyles.primarySurfaceHoverColor,
      ),
    ),
  );
}

