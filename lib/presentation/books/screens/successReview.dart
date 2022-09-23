// ignore_for_file: file_names
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../core/const/SizedBox.dart';
import '../../../core/const/const_color.dart';
import '../../../core/const/text_style_const.dart';

class SucessReview extends StatefulWidget {
  const SucessReview({Key? key}) : super(key: key);

  @override
  State<SucessReview> createState() => _SucessReviewState();
}

class _SucessReviewState extends State<SucessReview> {
  Timer? timer;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.pop(context);
    });

    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
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
              'Вы успешно закончили книгу',
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
    );
  }
}
