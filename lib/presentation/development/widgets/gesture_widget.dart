import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/const/SizedBox.dart';
import '../../../core/const/const_color.dart';
import '../../../core/const/text_style_const.dart';

class GestureWidget extends StatefulWidget {
  final Function() onTap;
  final String title;
  final String path;

  const GestureWidget(
      {Key? key,
        required this.onTap,
        required this.title,
        required this.path,
      })
      : super(key: key);

  @override
  State<GestureWidget> createState() => _GestureWidgetState();
}

class _GestureWidgetState extends State<GestureWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        width: 80,
        height: 80,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorStyles
                    .primaryBorderColor,
                borderRadius:
                BorderRadius.circular(12),
              ),
              width: 40,
              height: 40,
              padding:
              const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8),
              child: Image.asset(
                widget.path,
                width: 24,
                height: 24,
              ),
            ),
            sizedBoxHeight8(),
            Text(
              widget.title,
              style: TextStyles.mediumStyle
                  .copyWith(
                fontSize: 13,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
