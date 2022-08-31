import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/presentation/profile/widgets/btn_widget.dart';
import 'package:mugalim/presentation/profile/widgets/glass_effect_with_success.dart';
import 'package:mugalim/presentation/profile/widgets/text_field_widget.dart';

class PasswordScreen extends StatefulWidget {
  PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordAgainController = TextEditingController();
  bool successChange = false;

  int start = 0;
  bool wait = true;
  late Timer timer;
  void startTimer() {
    start = 3;
    if(wait == true) wait = false;
    const onsec = Duration(seconds: 1);
    timer = Timer.periodic(onsec, (timer) {
      if (start <= 0) {
        setState(() {
          wait = true;
          timer.cancel();
          Navigator.pop(context);
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            title: Text(
              'Пароль',
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
          body: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Текущий пароль',
                  style: TextStyles.mediumStyle.copyWith(
                    fontSize: 16,
                    color: ColorStyles.neutralsTextPrimaryColor,
                  ),
                ),
                sizedBoxHeight8(),
                TextField(
                  obscuringCharacter: '•',
                  obscureText: true,
                  controller: currentPasswordController,
                  decoration: textFieldStyleForChangePassword(),
                ),
                sizedBoxHeight16(),
                Text(
                  'Новый пароль',
                  style: TextStyles.mediumStyle.copyWith(
                    fontSize: 16,
                    color: ColorStyles.neutralsTextPrimaryColor,
                  ),
                ),
                sizedBoxHeight8(),
                TextField(
                  obscuringCharacter: '•',
                  obscureText: true,
                  controller: newPasswordController,
                  decoration: textFieldStyleForChangePassword(),
                ),
                sizedBoxHeight16(),
                Text(
                  'Повторите новый пароль',
                  style: TextStyles.mediumStyle.copyWith(
                    fontSize: 16,
                    color: ColorStyles.neutralsTextPrimaryColor,
                  ),
                ),
                sizedBoxHeight8(),
                TextField(
                  obscuringCharacter: '•',
                  obscureText: true,
                  controller: newPasswordAgainController,
                  decoration: textFieldStyleForChangePassword(),
                ),
                sizedBoxHeight16(),
                BtnWidget(
                  textColor: ColorStyles.neutralsTextPrimaryColor,
                  Color: ColorStyles.neutralsTextPrimaryDisabledColor,
                  onPressed: () {
                    setState((){
                      startTimer();
                      successChange = !successChange;
                    });
                  },
                  fontSize: 16,
                  text: 'Готово',
                ),
              ],
            ),
          ),
        ),
        GlassEffectWithSuccess(successChange:successChange,editedThing: 'пароль',),
      ],
    );
  }
}
