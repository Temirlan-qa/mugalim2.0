import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';

class SearchWidget extends StatelessWidget {
  final String hintText;

  SearchWidget({Key? key,required this.hintText}) : super(key: key);
  TextEditingController searchEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchEditingController,
      autofocus: true,
      style: TextStyles.regularStyle.copyWith(
        fontSize: 18,
        color: ColorStyles.neutralsTextPrimaryColor,
      ),
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        filled: true,
        fillColor: ColorStyles.primarySurfaceColor,
        disabledBorder: InputBorder.none,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(),
        ),
        focusedBorder: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyles.regularStyle.copyWith(
          fontSize: 16,
          color: ColorStyles.primarySurfaceHoverColor,
        ),
        prefixIcon: Image.asset(
          width: 12,
          height:12,
          'assets/icons/Icon_test.png',
          color: ColorStyles.primarySurfaceHoverColor,
        ),
        constraints: const BoxConstraints(maxHeight: 32),
        // contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 6),
      ),
    );
  }
}
