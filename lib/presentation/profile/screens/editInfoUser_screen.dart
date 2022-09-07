import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/injection_container.dart';
import 'package:mugalim/core/routes/environment_config.dart';
import 'package:mugalim/core/widgets/line_widget.dart';
import 'package:mugalim/logic/profile/bloc/profile_bloc.dart';
import 'package:mugalim/logic/profile/data/datasources/profile_datasource.dart';
import 'package:mugalim/presentation/profile/widgets/btn_widget.dart';
import 'package:mugalim/core/widgets/glass_effect_with_success.dart';
import 'package:mugalim/presentation/profile/widgets/change_avatar_widget.dart';

class EditInfoUserScreen extends StatefulWidget {
  final bloc;
  final Map<String, dynamic>? user;
  final String? image;
  final String? gender;
  const EditInfoUserScreen(
      {Key? key,
      required this.user,
      required this.gender,
      required this.image,
      this.bloc})
      : super(key: key);

  @override
  State<EditInfoUserScreen> createState() => _EditInfoUserScreenState();
}

class _EditInfoUserScreenState extends State<EditInfoUserScreen> {
  var maskFormatter = MaskTextInputFormatter(
      mask: '+7 ### ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
  );

  late TextEditingController emailController =
      TextEditingController(text: widget.user!['email']);
  late TextEditingController phoneController = TextEditingController(text: widget.user!['phone']);
//maskFormatter.getMaskedText()
  var avatarId = null;
  bool nameIsEmpty = true;
  XFile? profilePic;
  void refreshState(XFile image, String id) {
    setState(() {
      avatarId = id;
      profilePic = image;
    });
  }

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

  Box tokensBox = Hive.box('tokens');
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
                        CachedNetworkImage(
                          imageUrl:
                              '${EnvironmentConfig.url}/file/image/${widget.image}?size=xs',
                          width: 80,
                          height: 80,
                          fit: BoxFit.fill,
                          imageBuilder: (context, imageProvider) => Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          httpHeaders: {
                            'Content-Type': 'application/json',
                            'Accept': 'application/json',
                            "Authorization": "Bearer ${tokensBox.get('access')}"
                          },
                          placeholder: (context, url) => Image.asset(
                            widget.gender == "MAN"
                                ? 'assets/images/male.png'
                                : 'assets/images/female.png',
                            width: 80,
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                          errorWidget: (context, str, url) => Lottie.asset(
                            'assets/animations/Loader.json',
                            width: 80,
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showCupertinoModalBottomSheet(
                              useRootNavigator: true,
                              context: context,
                              builder: (BuildContext context) =>
                                  BottomModalSheet(
                                bloc: widget.bloc,
                                notifyParent: refreshState,
                              ),
                            );
                          },
                          child: Container(
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
                  style: TextStyles.mediumStyle.copyWith(
                      fontSize: 16,
                      color: ColorStyles.neutralsTextPrimaryColor),
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
                  maxLength: 16,
                  controller: phoneController,
                  onChanged: (text) {
                    setState(() {
                      onChanged = true;
                    });
                  },
                  style: TextStyles.mediumStyle.copyWith(
                      fontSize: 16,
                      color: ColorStyles.neutralsTextPrimaryColor),
                  decoration: textFieldStyleForEdit(phoneController),
                  inputFormatters: [maskFormatter],
                  keyboardType: TextInputType.phone,
                ),
                sizedBoxHeight16(),
                BtnWidget(
                  fontSize: 16,
                  onPressed: () async {
                    ProfileDatasource profile = sl();
                    Response response = await profile.editUserInfo(
                      emailController.text,
                      phoneController.text,
                    );
                    if (response.statusCode == 200 &&
                        response.data['status'] == 1) {
                      setState(() {
                        startTimer();
                        successChange = !successChange;
                      });
                      widget.bloc.add((ProfileLoad()));
                    } else {
                      SnackBarAction(
                        label: 'Error ',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      );
                    }
                  },
                  textColor: onChanged
                      ? Colors.white
                      : ColorStyles.neutralsTextPrimaryColor,
                  text: 'Готово',
                  color: onChanged
                      ? ColorStyles.primaryBorderColor
                      : ColorStyles.neutralsTextPrimaryDisabledColor,
                ),
              ],
            ),
          ),
        ),
        GlassEffectWithSuccess(
          successChange: successChange,
          editedThing: 'e-mail',
        ),
      ],
    );
  }

  InputDecoration textFieldStyleForEdit(controller) {
    return InputDecoration(
      counterText: "",
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
          color: onChanged ? ColorStyles.primaryBorderColor :ColorStyles.primarySurfaceHoverColor,
        ),
      ),
      hintText: controller == phoneController ? '+7' : '',
      hintStyle: TextStyles.mediumStyle.copyWith(
        fontSize: 16,
        color: ColorStyles.neutralsTextPrimaryColor,
      ),
    );
  }
}
