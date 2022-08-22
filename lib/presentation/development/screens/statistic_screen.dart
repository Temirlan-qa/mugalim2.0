import 'package:flutter/material.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/widgets/inProcess_widget.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Статистика',
          style: TextStyles.boldStyle.copyWith(
            fontSize: 23,
            color: ColorStyles.neutralsTextPrimaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: const InProcessWidget(),
    );
  }
}
