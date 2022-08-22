import 'package:flutter/material.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/widgets/inProcess_widget.dart';
import 'package:mugalim/presentation/home/screens/home_screen.dart';

class MPasswordScreen extends StatelessWidget {
  const MPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
            'M Passport',
          style: TextStyles.boldStyle.copyWith(
            fontSize: 23,
            color: ColorStyles.neutralsTextPrimaryColor,
          ),
        ),
        centerTitle: true,
        actions: [

        ],
      ),
      body: const InProcessWidget(),
    );
  }
}
