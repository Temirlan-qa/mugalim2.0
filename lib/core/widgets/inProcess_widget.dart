import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';

class InProcessWidget extends StatelessWidget {
  const InProcessWidget({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          maxLines:2,
          'Данный раздел на стадии разработки!🧑‍💻👩‍💻',
          textAlign: TextAlign.center,
          style: TextStyles.boldStyle.copyWith(
            fontSize: 23,
            color: const Color(0xFF4A4A4A),
          ),
        ),
        const SizedBox(height: 50,),
        Image.asset(
          'assets/images/planets.png',
        ),
        const SizedBox(height: 50,),
        CupertinoButton(
          pressedOpacity : 0.7,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: ColorStyles.primaryBorderColor,
          child: Text(
            'На главную',
            style: TextStyles.mediumStyle.copyWith(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
