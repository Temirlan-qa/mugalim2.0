import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/injection_container.dart';
import 'package:mugalim/logic/profile/data/datasources/profile_datasource.dart';
import 'package:mugalim/presentation/profile/widgets/btn_widget.dart';
import 'package:mugalim/presentation/profile/widgets/glass_effect_with_success.dart';
import 'package:mugalim/presentation/profile/widgets/text_field_widget.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  // TextEditingControllers
  TextEditingController currentPasswordEditingController = TextEditingController();
  TextEditingController newPasswordEditingController = TextEditingController();
  TextEditingController newConfirmPasswordEditingController = TextEditingController();

  bool onChanged = false;
  bool obscureText = false;
  // elements in timer and blur
  bool successChange = false;
  int start = 0;
  bool wait = true;
  late Timer timer;
  void startTimer() {
    start = 3;
    if (wait == true) wait = false;
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
                TextFieldForChangePassword(
                    nameEditingController: currentPasswordEditingController,
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
                TextFieldForChangePassword(
                  nameEditingController: newPasswordEditingController,
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
                TextFieldForChangePassword(
                  nameEditingController: newConfirmPasswordEditingController,
                ),
                sizedBoxHeight16(),
                BtnWidget(
                  textColor: onChanged
                      ? Colors.white
                      : ColorStyles.neutralsTextPrimaryColor,
                  Color: onChanged
                      ? ColorStyles.primaryBorderColor
                      : ColorStyles.neutralsTextPrimaryDisabledColor,
                  onPressed: () async {
                    if (currentPasswordEditingController.text != '' &&
                        newPasswordEditingController.text != '' &&
                        newConfirmPasswordEditingController.text != '') {
                      ProfileDatasource profile = sl();
                      if (newPasswordEditingController.text ==
                          newConfirmPasswordEditingController.text) {
                        Response response = await profile.changePassword(
                            currentPasswordEditingController.text,
                            newConfirmPasswordEditingController.text);
                        if (response.statusCode == 200 &&
                            response.data['status'] == 1) {
                          setState(() {
                            startTimer();
                            successChange = !successChange;
                          });
                        }
                        else {
                          print('Something is wrong');
                        }
                      }
                    } else {
                      print('Something is wrong');
                      SnackBarAction(
                        label: 'Error ',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      );
                    }
                  },
                  fontSize: 16,
                  text: 'Готово',
                ),
              ],
            ),
          ),
        ),
        GlassEffectWithSuccess(
          successChange: successChange,
          editedThing: 'пароль',
        ),
      ],
    );
  }
}
