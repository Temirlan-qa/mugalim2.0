import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';

class GlassEffectWithSuccess extends StatelessWidget {
  final bool successChange;
  final String editedThing;
  const GlassEffectWithSuccess({Key? key,required this.successChange,required this.editedThing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: successChange,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white.withOpacity(0.4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                // mloader.json
                repeat: false,
                'assets/animations/success.json',
                width: 72,
                height: 72,
                fit: BoxFit.fill,
              ),
              sizedBoxHeight16(),
              Text(
                'Вы успешно поменяли  $editedThing',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyles.boldStyle.copyWith(
                  color: ColorStyles.neutralsTextPrimaryColor,
                  fontSize: 26,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
