import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/injection_container.dart';
//import 'package:mugalim/logic/auth/data/datasources/auth_datasource.dart';
//import 'package:mugalim/logic/profile/bloc/profile_bloc.dart';
import 'package:mugalim/logic/profile/data/datasources/profile_datasource.dart';

class BottomModalSheet extends StatefulWidget {
  final Function(XFile, String) notifyParent;
  const BottomModalSheet({
    Key? key,
    required this.notifyParent,
  }) : super(key: key);

  @override
  _BottomModalSheetState createState() => _BottomModalSheetState();
}

class _BottomModalSheetState extends State<BottomModalSheet> {
  final picker = ImagePicker();

  // getFromGallery() async {
  //   final pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     print(pickedFile.path);
  //   }
  // }

  final ImagePickerPlatform _picker = ImagePickerPlatform.instance;

  XFile? _imageFileList;

  chooseImage(ImageSource source) async {
    try {
      ProfileDatasource profileDatasource = sl();

      final XFile? pickedFileList = await _picker.getImage(source: source);
      _imageFileList = pickedFileList;

      Response response =
          await profileDatasource.changeAvatar(_imageFileList!.path);
      print(response.data['value']);
      Response response1 =
          await profileDatasource.uploadAvatar(response.data['value']);
      print(response1.data);

      widget.notifyParent(_imageFileList!, response.data['value']);
    } catch (e) {
      print(e.toString());
    }
  }

  File? profilePic;
  //
  // pickImage(ImageSource source) async {
  //   PickedFile? image = await picker.getImage(source: source);
  //
  //   setState(() {
  //     profilePic = File(image!.path);
  //
  //     print(profilePic!.path);
  //
  //     widget.notifyParent(profilePic!);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 264,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 4,
                  width: 44,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                sizedBoxHeight16(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.close_rounded,
                          color: ColorStyles.neutralsTextPrimaryColor,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Фото',
                        style: TextStyles.regularStyle.copyWith(
                          color: ColorStyles.neutralsTextPrimaryColor,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 24),
                      const Spacer(),
                    ],
                  ),
                ),
                sizedBoxHeight8(),
              ],
            ),
          ),
          sizedBoxHeight16(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
              onTap: () async {
                chooseImage(ImageSource.gallery);
                Navigator.pop(context, true);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 56,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/archive.svg'),
                    sizedBoxWidth8(),
                    Text(
                      'Выбрать с галереи',
                      style: TextStyles.regularStyle.copyWith(
                        color: ColorStyles.neutralsTextPrimaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          sizedBoxHeight16(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
              onTap: () {
                chooseImage(ImageSource.camera);
                Navigator.pop(context, true);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 56,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/camera.svg',
                      width: 25,
                    ),
                    sizedBoxWidth8(),
                    Text(
                      'Сделать фото',
                      style: TextStyles.regularStyle.copyWith(
                        color: ColorStyles.neutralsTextPrimaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
    //   CupertinoAlertDialog(
    //     content: new Container(
    //         height: 104,
    //         width: MediaQuery.of(context).size.width,
    //         child: Center(
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Column(
    //               children: [
    //                 CupertinoButton(
    //                   child: Text(
    //                     'Camera',
    //                     style: TextStyles.blackBoldStyle,),
    //                   onPressed: () {
    //                     chooseImage(ImageSource.camera);
    //                     Navigator.pop(context, true);
    //                   },
    //                   padding: EdgeInsets.zero,
    //                 ),
    //                 CupertinoButton(
    //                   child: Text(
    //                       'Gallery',
    //                       style: TextStyles.blackBoldStyle),
    //                   onPressed: () {
    //                     chooseImage(
    //                         ImageSource.gallery);
    //                     Navigator.pop(context, true);
    //                   },
    //                   padding: EdgeInsets.zero,),
    //               ],
    //             ),
    //           ),
    //         )
    //     )
    // );
  }
}
