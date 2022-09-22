import 'package:flutter/material.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';

class ConfirmationWidget extends StatefulWidget {
  final Function() leftButtonOnPressed;
  final Function() rightButtonOnPressed;
  final String title;
  final String description;
  final Color leftButtonColor;
  final Color rightButtonColor;
  final String leftButtonTitle;
  final String rightButtonTitle;

  const ConfirmationWidget(
      {Key? key,
      required this.leftButtonOnPressed,
      required this.rightButtonOnPressed,
      required this.title,
      required this.description,
      required this.leftButtonColor,
      required this.rightButtonColor,
      required this.leftButtonTitle,
      required this.rightButtonTitle})
      : super(key: key);

  @override
  State<ConfirmationWidget> createState() => _ConfirmationWidgetState();
}

class _ConfirmationWidgetState extends State<ConfirmationWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: MediaQuery.of(context).size.width - 103,
          decoration: BoxDecoration(
            color: ColorStyles.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            border: Border.all(width: 0.5, color: ColorStyles.backgroundColor),
          ),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 19, 16, 7),
                  child: Text('Удаление комментария',
                      style: TextStyles.mediumStyle.copyWith(
                          fontSize: 18,
                          color: ColorStyles.neutralsTextPrimaryColor)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 19),
                  child: Text(
                      'Вы уверены, что хотите удалить свой комментарий?',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyles.regularStyle.copyWith(
                          color: ColorStyles.neutralsTextPrimaryColor)),
                ),
                Container(
                  color: ColorStyles.neutralsTextPrimaryDisabledColor,
                  height: 0.5,
                  width: MediaQuery.of(context).size.width - 103,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextButton(
                        child: Text('Отмена',
                            style: TextStyles.mediumStyle.copyWith(
                                color: ColorStyles.primaryBorderColor,
                                fontSize: 16)),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      color: ColorStyles.neutralsTextPrimaryDisabledColor,
                      height: 43.5,
                      width: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextButton(
                        child: Text('Удалить',
                            style: TextStyles.mediumStyle.copyWith(
                                color: ColorStyles.errorBorderColor,
                                fontSize: 16)),
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              ])),
    );
  }
}
