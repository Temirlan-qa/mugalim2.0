import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
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
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:mugalim/presentation/profile/widgets/text_field_for_edit_info_user_widget.dart';

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
  late TextEditingController emailController =
      TextEditingController(text: widget.user!['email']);
  late TextEditingController phoneController =
      TextEditingController(text: widget.user!['phone']);

  String avatarId = '';
  bool nameIsEmpty = true;
  XFile? profilePic;
  String editedThing = '';
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

  final picker = ImagePicker();
  final ImagePickerPlatform _picker = ImagePickerPlatform.instance;
  XFile? _imageFileList;
  bool addImg = false;
  chooseImage(ImageSource source, bloc, notifyParent) async {
    try {
      ProfileDatasource profileDatasource = sl();
      final XFile? pickedFileList = await _picker.getImage(source: source);
      _imageFileList = pickedFileList;
      Response response =
          await profileDatasource.changeAvatar(_imageFileList!.path);
      Response response1 =
          await profileDatasource.uploadAvatar(response.data['value']);
      print(response1.data);

      bloc.add((ProfileInfoEdit()));
      bloc.add((ProfileLoad()));
      notifyParent(_imageFileList!, response.data['value']);
    } catch (e) {
      print(e.toString());
    }
  }

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
                            setState(() {
                              addImg = true;
                            });
                            // showCupertinoModalBottomSheet(
                            //   useRootNavigator: true,
                            //   context: context,
                            //   builder: (BuildContext context) =>
                            //       BottomModalSheet(
                            //     bloc: widget.bloc,
                            //     notifyParent: refreshState,
                            //   ),
                            // );
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
                TextFieldForEditInfoWidget(
                  controller: emailController,
                  phoneController: phoneController,
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
                TextFieldForEditInfoWidget(
                  controller: phoneController,
                  phoneController: phoneController,
                ),
                sizedBoxHeight16(),
                BtnWidget(
                  fontSize: 16,
                  onPressed: () async {
                    if (emailController.text != widget.user!['email']) {
                      editedThing = '        e-mail';
                      ProfileDatasource profile = sl();
                      Response response = await profile.editUserInfo(
                        emailController.text,
                        phoneController.text,
                        widget.image.toString(),
                      );
                      if (response.statusCode == 200 &&
                          response.data['status'] == 1) {
                        setState(() {
                          startTimer();
                          successChange = !successChange;
                        });
                        widget.bloc.add((ProfileInfoEdit()));
                        widget.bloc.add((ProfileLoad()));
                      } else {
                        SnackBarAction(
                          label: 'Error ',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        );
                      }
                    }
                    else if (phoneController.text != widget.user!['phone']) {
                      editedThing = 'телефон';
                      ProfileDatasource profile = sl();
                      Response response = await profile.editUserInfo(
                        emailController.text,
                        phoneController.text,
                        widget.image.toString(),
                      );
                      if (response.statusCode == 200 &&
                          response.data['status'] == 1) {
                        setState(() {
                          startTimer();
                          successChange = !successChange;
                        });
                        widget.bloc.add((ProfileInfoEdit()));
                        widget.bloc.add((ProfileLoad()));
                      } else {
                        SnackBarAction(
                          label: 'Error ',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        );
                      }
                    }
                    else if (_imageFileList!.path != widget.image) {
                      editedThing = ' аватар';
                      ProfileDatasource profile = sl();
                      Response response = await profile.editUserInfo(
                        emailController.text,
                        phoneController.text,
                        widget.image.toString(),
                      );
                      if (response.statusCode == 200 &&
                          response.data['status'] == 1) {
                        setState(() {
                          startTimer();
                          successChange = !successChange;
                        });

                        widget.bloc.add((ProfileInfoEdit()));
                        widget.bloc.add((ProfileLoad()));
                      } else {
                        SnackBarAction(
                          label: 'Error ',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        );
                      }
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
        Visibility(
          visible: addImg && _imageFileList == null ||
              addImg && _imageFileList == [],
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.black.withOpacity(0.2),
              child: Column(
                children: [
                  const Spacer(),
                  CupertinoButton(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    pressedOpacity: 0.8,
                    color: Colors.white,
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      chooseImage(
                        ImageSource.gallery,
                        widget.bloc,
                        refreshState,
                      );
                      // Navigator.pop(context, true);
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/upload.svg',
                            width: 16,
                          ),
                          sizedBoxWidth4(),
                          Text(
                            'Выбрать из галерии',
                            style: TextStyles.mediumStyle.copyWith(
                              color: ColorStyles.primaryBorderColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  LineWidget(width: MediaQuery.of(context).size.width - 32),
                  CupertinoButton(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    pressedOpacity: 0.8,
                    color: Colors.white,
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      chooseImage(
                        ImageSource.camera,
                        widget.bloc,
                        refreshState,
                      );
                      Navigator.pop(context, true);
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/camera.svg',
                            width: 16,
                          ),
                          sizedBoxWidth4(),
                          Text(
                            'Сделать фото',
                            style: TextStyles.mediumStyle.copyWith(
                              color: ColorStyles.primaryBorderColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  sizedBoxHeight8(),
                  BtnWidget(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    text: 'Отмена',
                    fontSize: 16,
                    textColor: ColorStyles.primaryBorderColor,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
          ),
        ),
        GlassEffectWithSuccess(
          successChange: successChange,
          editedThing: editedThing,
        ),
      ],
    );
  }
}
