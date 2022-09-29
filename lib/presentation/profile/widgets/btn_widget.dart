import 'package:flutter/cupertino.dart';
import 'package:mugalim/core/const/text_style_const.dart';

class BtnWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final double fontSize;
  final Color? textColor;
  final Color? color;
  const BtnWidget(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.fontSize,
      required this.textColor,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius : const BorderRadius.all(Radius.circular(12)),
      pressedOpacity: 0.8,
      color: color,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 16,
        child: Center(
          child: Text(
            text,
            style: TextStyles.mediumStyle.copyWith(
              fontSize: fontSize,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
