import 'package:flutter/cupertino.dart';

import '../const/text_style_const.dart';

class ButtonWidget extends StatefulWidget {
  final Function() onPressed;
  final String title;
  final Color color;
  final Color textColor;
  const ButtonWidget(
      {Key? key,
      required this.onPressed,
      required this.title, required this.color, required this.textColor})
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
        onPressed: widget.onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width - 64,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              color: widget.color),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 9.0),
            child: Center(
              child: Text(
                widget.title,
                style: TextStyles.boldStyle.copyWith(
                    fontSize: 14,
                    color: widget.textColor),
              ),
            ),
          ),
        ));
  }
}
