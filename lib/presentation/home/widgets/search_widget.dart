import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/const_color.dart';

class SearchWidget extends StatelessWidget {
  final String hintText;

  SearchWidget({Key? key,required this.hintText}) : super(key: key);
  TextEditingController searchEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchEditingController,
      autofocus: true,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Cera Pro',
        fontSize: 16,
        color: ColorStyles.neutralsTextPrimaryColor,
      ),
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF9F9F9),
        // disabledBorder: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        hintText: 'Поиск',
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: 'Cera Pro',
          fontSize: 16,
          color: ColorStyles.primarySurfaceHoverColor,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset('assets/icons/search.svg',color: ColorStyles.primarySurfaceHoverColor),
        ),
        constraints: const BoxConstraints(maxHeight: 36),
        // contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 6),
      ),
    );
  }
}
