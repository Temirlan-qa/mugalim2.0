import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mugalim/core/const/const_color.dart';

InputDecoration textFieldStyleForEdit() {
  return InputDecoration(
    suffix: GestureDetector(
      onTap: () {},
      child: Icon(
        CupertinoIcons.clear,
        color: ColorStyles.primaryBorderColor,
        size: 24,
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
