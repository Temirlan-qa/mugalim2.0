import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/widgets/line_widget.dart';
import 'package:mugalim/presentation/profile/widgets/btn_widget.dart';
import 'package:mugalim/core/widgets/glass_effect_with_success.dart';

class EditInfoUserScreen extends StatefulWidget {
  final Map<String ,dynamic>? user;
  final String? image;
  final String? gender;
  const EditInfoUserScreen({Key? key,required this.user,required this.gender,required this.image}) : super(key: key);

  @override
  State<EditInfoUserScreen> createState() => _EditInfoUserScreenState();
}

class _EditInfoUserScreenState extends State<EditInfoUserScreen> {
  late TextEditingController emailController = TextEditingController(text: widget.user!['email']);
  late TextEditingController phoneController = TextEditingController(text: widget.user!['phone']);

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
  bool onChanged = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            title: Text(
              'Личные данные',
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          widget.image == null && widget.gender == "MAN"
                              ?'assets/images/male.png'
                              : widget.image == null
                              ? 'assets/images/female.png'
                              : widget.image.toString(),
                          // 'assets/images/female.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.fill,
                        ),
                        Container(
                          color: Colors.white.withOpacity(0.35),
                          width: 80,
                          height: 80,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/camera.svg',
                              // width: 24,
                              // height: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBoxWidth16(),
                    Text(
                      'Партизан Перизатов',
                      style: TextStyles.mediumStyle.copyWith(
                        fontSize: 18,
                        color: ColorStyles.neutralsTextPrimaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                LineWidget(
                  width: MediaQuery.of(context).size.width,
                ),
                sizedBoxHeight16(),
                Text(
                  'E-mail',
                  style: TextStyles.mediumStyle.copyWith(
                    fontSize: 16,
                    color: ColorStyles.neutralsTextPrimaryColor,
                  ),
                ),
                sizedBoxHeight8(),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      onChanged = true;
                    });
                  },
                  controller: emailController,
                  decoration: textFieldStyleForEdit(emailController),
                ),
                sizedBoxHeight16(),
                Text(
                  'Телефон',
                  style: TextStyles.mediumStyle.copyWith(
                    fontSize: 16,
                    color: ColorStyles.neutralsTextPrimaryColor,
                  ),
                ),
                sizedBoxHeight8(),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      onChanged = true;
                    });
                  },
                  controller: phoneController,
                  decoration: textFieldStyleForEdit(phoneController),
                ),
                sizedBoxHeight16(),
                BtnWidget(
                  fontSize: 16,
                  onPressed: () {
                    startTimer();
                    successChange = !successChange;
                  },
                  textColor: onChanged ? Colors.white :ColorStyles.neutralsTextPrimaryColor,
                  text: 'Готово',
                  color:  onChanged ? ColorStyles.primaryBorderColor :ColorStyles.neutralsTextPrimaryDisabledColor,
                ),
              ],
            ),
          ),
        ),
        GlassEffectWithSuccess(successChange:successChange,editedThing: 'e-mail',),
      ],
    );
  }

  InputDecoration textFieldStyleForEdit(controller) {
    return InputDecoration(
      suffix: GestureDetector(
        onTap: () {
          controller.clear();
        },
        child: Icon(
          CupertinoIcons.clear,
          color: ColorStyles.primaryBorderColor,
          size: 24,
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
