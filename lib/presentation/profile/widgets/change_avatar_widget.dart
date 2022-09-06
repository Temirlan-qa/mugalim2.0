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
import 'package:mugalim/core/widgets/line_widget.dart';
import 'package:mugalim/logic/profile/bloc/profile_bloc.dart';
import 'package:mugalim/logic/profile/data/datasources/profile_datasource.dart';
import 'package:mugalim/presentation/profile/widgets/btn_widget.dart';

class BottomModalSheet extends StatefulWidget {
  final bloc;
  final Function(XFile, String) notifyParent;
  const BottomModalSheet({
    Key? key,
    required this.notifyParent,
    required this.bloc,
  }) : super(key: key);
  @override
  _BottomModalSheetState createState() => _BottomModalSheetState();
}

class _BottomModalSheetState extends State<BottomModalSheet> {
  final picker = ImagePicker();
  final ImagePickerPlatform _picker = ImagePickerPlatform.instance;
  XFile? _imageFileList;

  chooseImage(ImageSource source) async {
    try {
      ProfileDatasource profileDatasource = sl();
      final XFile? pickedFileList = await _picker.getImage(source: source);
      _imageFileList = pickedFileList;
      Response response = await profileDatasource.changeAvatar(_imageFileList!.path);
      Response response1 = await profileDatasource.uploadAvatar(response.data['value']);
      print(response1.data);

      widget.bloc.add((ProfileLoad()));
      widget.notifyParent(_imageFileList!, response.data['value']);
    } catch (e) {
      print(e.toString());
    }
  }

  File? profilePic;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.black.withOpacity(0.2),
      child: Column(
        children: [
          const Spacer(),
          CupertinoButton(
            borderRadius : const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            pressedOpacity: 0.8,
            color: Colors.white,
            padding: EdgeInsets.zero,
            onPressed: () async{
              chooseImage(ImageSource.gallery);
              Navigator.pop(context, true);
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
            borderRadius : const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            pressedOpacity: 0.8,
            color: Colors.white,
            padding: EdgeInsets.zero,
            onPressed: () async{
              chooseImage(ImageSource.camera);
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
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child: GestureDetector(
          //     onTap: () {
          //       chooseImage(ImageSource.camera);
          //       Navigator.pop(context, true);
          //     },
          //     child: Container(
          //       padding: const EdgeInsets.symmetric(horizontal: 16),
          //       height: 56,
          //       width: MediaQuery.of(context).size.width,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(16),
          //           color: Colors.white,
          //       ),
          //       child: Row(
          //         children: [
          //           SvgPicture.asset(
          //             'assets/icons/camera.svg',
          //             width: 25,
          //           ),
          //           sizedBoxWidth8(),
          //           Text(
          //             'Сделать фото',
          //             style: TextStyles.regularStyle.copyWith(
          //               color: ColorStyles.neutralsTextPrimaryColor,
          //               fontSize: 14,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // )

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child: GestureDetector(
          //     onTap: () async {
          //       chooseImage(ImageSource.gallery);
          //       Navigator.pop(context, true);
          //     },
          //     child: Container(
          //       padding: const EdgeInsets.symmetric(horizontal: 16),
          //       height: 56,
          //       width: MediaQuery.of(context).size.width,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(16),
          //           color: Colors.white),
          //       child: Row(
          //         children: [
          //           SvgPicture.asset('assets/icons/archive.svg'),
          //           sizedBoxWidth8(),
          //           Text(
          //             'Выбрать с галереи',
          //             style: TextStyles.regularStyle.copyWith(
          //               color: ColorStyles.neutralsTextPrimaryColor,
          //               fontSize: 14,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
