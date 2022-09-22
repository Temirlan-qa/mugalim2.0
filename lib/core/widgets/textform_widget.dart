import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../const/const_color.dart';

class TextFormFieldWidget extends StatefulWidget {
  final controller;
  const TextFormFieldWidget({Key? key, this.controller}) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      // autofocus: true,
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
        enabledBorder: OutlineInputBorder(
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
        prefixIcon: Align(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: SvgPicture.asset('assets/icons/search.svg',color: ColorStyles.primarySurfaceHoverColor,width: 15,height: 15,),
        ),
        constraints: const BoxConstraints(maxHeight: 36),
        // contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 6),
      ),
    );
  }
}
