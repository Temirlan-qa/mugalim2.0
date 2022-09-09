import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/const/const_color.dart';
import '../../../core/const/text_style_const.dart';

class BookButtonWidget extends StatefulWidget {
  final Function() onPressed;
  final String title;
  final double height;
  const BookButtonWidget(
      {Key? key,
        required this.onPressed,
        required this.title, required this.height,
        })
      : super(key: key);

  @override
  State<BookButtonWidget> createState() => _BookButtonWidgetState();
}

class _BookButtonWidgetState extends State<BookButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        minSize: 0,
        padding: EdgeInsets.zero,
        onPressed: widget.onPressed,
        child: Container(
          width: 343,
          height: widget.height,
          decoration: BoxDecoration(
              borderRadius: widget.height == 48 ? const BorderRadius.all(Radius.circular(12)) :  const BorderRadius.all(Radius.circular(8)),
              color: ColorStyles.primaryBorderColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Center(
              child: Text(
                widget.title,
                style: TextStyles.mediumStyle.copyWith(
                    fontSize: widget.height == 48 ? 16 : 13,
                    color: Colors.white
                ),
              ),
            ),
          ),
        ));
  }
}
