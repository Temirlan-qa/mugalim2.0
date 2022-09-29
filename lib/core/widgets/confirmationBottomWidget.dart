// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';

class ConfirmationBottomWidget extends StatefulWidget {
  final String topButtonTitle;
  final Function() topButtonOnPressed;
  final String bottomButtonTitle;
  final Function() bottomButtonOnPressed;
  final Color topButtonTitleColor;
  final Color bottomButtonTitleColor;

  const ConfirmationBottomWidget(
      {Key? key,
      required this.topButtonTitle,
      required this.topButtonOnPressed,
      required this.bottomButtonTitle,
      required this.bottomButtonOnPressed,
      required this.topButtonTitleColor,
      required this.bottomButtonTitleColor})
      : super(key: key);

  @override
  State<ConfirmationBottomWidget> createState() =>
      _ConfirmationBottomWidgetState();
}

class _ConfirmationBottomWidgetState extends State<ConfirmationBottomWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: MediaQuery.of(context).size.width - 8,
                height: 44,
                decoration: BoxDecoration(
                  color: ColorStyles.backgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                    child: TextButton(
                  onPressed: widget.topButtonOnPressed,
                  child: Text(
                    widget.topButtonTitle,
                    style: TextStyles.regularStyle.copyWith(
                      fontSize: 16,
                      color: widget.topButtonTitleColor,
                    ),
                  ),
                ))),
            sizedBoxHeight8(),
            Container(
              width: MediaQuery.of(context).size.width - 8,
              height: 44,
              decoration: BoxDecoration(
                color: ColorStyles.backgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Center(
                child: TextButton(
                  onPressed: widget.bottomButtonOnPressed,
                  child: Text(widget.bottomButtonTitle,
                      style: TextStyles.mediumStyle.copyWith(
                          fontSize: 16, color: widget.bottomButtonTitleColor)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
