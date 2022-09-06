import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/presentation/profile/widgets/btn_widget.dart';

class AddScreenShotVideoWidget extends StatefulWidget {
  const AddScreenShotVideoWidget({Key? key}) : super(key: key);

  @override
  State<AddScreenShotVideoWidget> createState() =>
      _AddScreenShotVideoWidgetState();
}

class _AddScreenShotVideoWidgetState extends State<AddScreenShotVideoWidget> {
  final picker = ImagePicker();
  final ImagePickerPlatform _picker = ImagePickerPlatform.instance;
  XFile? _imageFileList;


  @override
  Widget build(BuildContext context) {
    return Container(
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
            height: 30,
          ),
        ],
      ),
    );
  }
}
