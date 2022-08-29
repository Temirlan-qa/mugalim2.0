import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/widgets/line_widget.dart';
import 'package:mugalim/presentation/profile/widgets/btn_widget.dart';
import 'package:mugalim/presentation/profile/widgets/edit_text_field_widget.dart';
import 'package:mugalim/presentation/profile/widgets/info_listtile_widget.dart';
import 'package:mugalim/presentation/profile/widgets/text_field_widget.dart';

class EditInfoUserScreen extends StatelessWidget {
  EditInfoUserScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      'assets/images/male.png',
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
                // Lottie.asset(
                //   //repeat: false,
                //   'assets/animations/Loader.json',
                //   width: 80,
                //   height: 80,
                //   fit: BoxFit.fill,
                // ),
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
              controller: emailController,
              decoration: textFieldStyleForEdit(),
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
              controller: phoneController,
              decoration: textFieldStyleForEdit(),
            ),
            sizedBoxHeight16(),
            BtnWidget(
              fontSize: 16,
              onPressed: () {},
              textColor: ColorStyles.neutralsTextPrimaryColor,
              text: 'Готово',
              Color: ColorStyles.neutralsTextPrimaryDisabledColor,
            ),
          ],
        ),
      ),
    );
  }
}
