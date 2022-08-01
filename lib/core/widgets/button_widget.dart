import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/const_color.dart';
import '../const/text_style_const.dart';

class ButtonWidget extends StatefulWidget {
  final Function() onPressed;
  final String title;
  final color;
  final textColor;
  const ButtonWidget(
      {Key? key,
      required this.onPressed,
      required this.title,
      this.color,
      this.textColor})
      : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        minSize: 0,
        padding: EdgeInsets.zero,
        child: Container(
          width: MediaQuery.of(context).size.width - 64,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: widget.color != null
                  ? widget.color
                  : ColorStyles.primaryShapeColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 9.0),
            child: Center(
              child: Text(
                widget.title,
                style: TextStyles.boldStyle.copyWith(
                    fontSize: 14,
                    color: widget.textColor != null
                        ? widget.textColor
                        : Colors.white),
              ),
            ),
          ),
        ),
        onPressed: widget.onPressed);
  }
}
