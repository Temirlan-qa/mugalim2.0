import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/presentation/profile/screens/editInfoUser_screen.dart';
import 'package:mugalim/presentation/profile/screens/password_screen.dart';
import 'package:mugalim/presentation/profile/widgets/info_listtile_widget.dart';

class SettingsScreen extends StatelessWidget {
  final infoProfile;
  const SettingsScreen({Key? key, this.infoProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
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
        title: Text(
          'Настройки',
          style: TextStyles.boldStyle.copyWith(
            color: ColorStyles.neutralsTextPrimaryColor,
            fontSize: 23,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    infoProfile['image'] == null && infoProfile['gender'] == "MAN"
                        ?'assets/images/male.png'
                        : infoProfile['image'] == null
                        ? 'assets/images/female.png'
                        : infoProfile['image'].toString(),
                    // 'assets/images/female.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill,
                  ),
                  sizedBoxHeight16(),
                  Text(
                    infoProfile['nameAndSurname']!,
                    style: TextStyles.mediumStyle.copyWith(
                      fontSize: 20,
                      color: ColorStyles.neutralsTextPrimaryColor,
                    ),
                  ),
                  Text(
                    infoProfile['role'].join(", "),
                    style: TextStyles.regularStyle.copyWith(
                      fontSize: 16,
                      color: ColorStyles.neutralsTextPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            sizedBoxHeight16(),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
              child: Column(
                children: [
                  InfoListTileWidget(
                    text: 'Личные данные',
                    leading_img: 'assets/icons/user_for_profile.svg',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditInfoUserScreen(
                            user: infoProfile['user'],
                            image: infoProfile['image'],
                            gender: infoProfile['gender'],

                          ),
                        ),
                      );
                      //  ChangePasswordScreen
                    },
                  ),
                  sizedBoxHeight16(),
                  InfoListTileWidget(
                    text: 'Изменить пароль',
                    leading_img: 'assets/icons/key_for_profile.svg',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PasswordScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
