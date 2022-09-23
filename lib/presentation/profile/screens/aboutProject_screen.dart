// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';

class AboutProjectScreen extends StatelessWidget {
  const AboutProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Про проект',
          style: TextStyles.boldStyle.copyWith(
            fontSize: 23,
            color: ColorStyles.neutralsTextPrimaryColor,
          ),
        ),
        centerTitle: true,
        leading: CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: ColorStyles.primaryBorderColor,
            size: 24,
          ),
        ),
      ),
      body: SizedBox(
        child: Center(
          child: Text(
            'WEB\nmugalim.academy',
            textAlign: TextAlign.center,
            style: TextStyles.boldStyle.copyWith(
              fontSize: 23,
              color: ColorStyles.neutralsTextPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
