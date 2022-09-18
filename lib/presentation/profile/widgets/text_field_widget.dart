import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/const_color.dart';

class TextFieldForChangePassword extends StatefulWidget {
  final TextEditingController nameEditingController;
  const TextFieldForChangePassword(
      {Key? key, required this.nameEditingController})
      : super(key: key);

  @override
  State<TextFieldForChangePassword> createState() =>
      _TextFieldForChangePasswordState();
}

class _TextFieldForChangePasswordState
    extends State<TextFieldForChangePassword> {
  bool onChanged = false;
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        onChanged: (text) {
          setState(() {
            onChanged = true;
          });
        },
        obscuringCharacter: '•',
        obscureText: obscureText,
        controller: widget.nameEditingController,
        decoration: textFieldStyleForChangePassword(),
      ),
    );
  }

  InputDecoration textFieldStyleForChangePassword() {
    return InputDecoration(
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  'assets/icons/eye_icon.svg',
                  color: ColorStyles.primaryBorderColor,
                  height: 24,
                  width: 24,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  'assets/icons/eye-off.svg',
                  color: ColorStyles.primaryBorderColor,
                  height: 24,
                  width: 24,
                ),
              ),
      ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          width: 1.0,
          color: ColorStyles.primarySurfaceHoverColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          width: 1.0,
          color: ColorStyles.primarySurfaceHoverColor,
        ),
      ),
    );
  }
}
