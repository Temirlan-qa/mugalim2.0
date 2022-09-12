import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';

class TextFieldForEditInfoWidget extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController phoneController;
  TextFieldForEditInfoWidget(
      {Key? key, required this.controller, required this.phoneController})
      : super(key: key);

  @override
  State<TextFieldForEditInfoWidget> createState() =>
      _TextFieldForEditInfoWidgetState();
}

class _TextFieldForEditInfoWidgetState
    extends State<TextFieldForEditInfoWidget> {
  bool onChanged = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        setState(() {
          onChanged = true;
        });
      },
      style: TextStyles.mediumStyle
          .copyWith(fontSize: 16, color: ColorStyles.neutralsTextPrimaryColor),
      controller: widget.controller,
      decoration: InputDecoration(
        counterText: "",
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        suffix: onChanged
            ? GestureDetector(
                onTap: () {
                  widget.controller.clear();
                },
                child: Icon(
                  CupertinoIcons.clear,
                  color: ColorStyles.primaryBorderColor,
                  size: 24,
                ),
              )
            : null,
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
            color: onChanged
                ? ColorStyles.primaryBorderColor
                : ColorStyles.primarySurfaceHoverColor,
          ),
        ),
        hintText: widget.controller == widget.phoneController ? '+7' : '',
        hintStyle: TextStyles.mediumStyle.copyWith(
          fontSize: 16,
          color: ColorStyles.neutralsTextPrimaryColor,
        ),
      ),
    );
  }
}
