import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/presentation/profile/widgets/btn_widget.dart';

class AboutApplicationScreen extends StatelessWidget {
  const AboutApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'О приложении',
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
      body: Padding(
        //height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/about_app.png',
                  ),
                  sizedBoxHeight16(),
                  Text(
                    '''Цель проекта Mugalim app поднять уровень образования в Казахстане с помощью цифровых инструментов.
Mugalim app - образовательный инструмент включающий в себя развлечение, формирование новых привычек, планирование времени, отслеживание прогресса, состязания и т.д.
Mugalim app - это образовательная платформа для учителей, коуч-тренеров, менторов для построения задач и отслеживания прогресса своих подопечных.
Добро пожаловать в приложение Mugalim!''',
                    style: TextStyles.regularStyle.copyWith(
                      color: ColorStyles.neutralsTextPrimaryColor,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  sizedBoxHeight16(),
                  BtnWidget(
                    color: ColorStyles.primaryBorderColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    fontSize: 16,
                    text: 'На главную',
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
