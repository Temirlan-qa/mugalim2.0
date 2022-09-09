import 'package:flutter/material.dart';

import '../../../core/const/const_color.dart';
import '../../../core/const/text_style_const.dart';

class BookWidget extends StatelessWidget {
  final String textMonth;
  final String img;
  const BookWidget({Key? key, required this.textMonth, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              img,
              width: 135,
              height: 201,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 4,
          top: 4,
          child: Container(
            height: 24,
            width: 76,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: ColorStyles.infoSurfaceHoverColor,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                textMonth,
                style: TextStyles.regularStyle.copyWith(
                  fontSize: 13,
                  color: ColorStyles.neutralsTextPrimaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
