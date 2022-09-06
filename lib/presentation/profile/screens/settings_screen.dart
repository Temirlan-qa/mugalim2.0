import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/routes/environment_config.dart';
import 'package:mugalim/presentation/profile/screens/editInfoUser_screen.dart';
import 'package:mugalim/presentation/profile/screens/password_screen.dart';
import 'package:mugalim/presentation/profile/widgets/info_listtile_widget.dart';

class SettingsScreen extends StatelessWidget {
  final infoProfile;
  SettingsScreen({Key? key, this.infoProfile}) : super(key: key);
  Box tokensBox = Hive.box('tokens');
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
                  CachedNetworkImage(
                    imageUrl: '${EnvironmentConfig.url}/file/image/${infoProfile['image']}?size=xs',
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill,
                    imageBuilder: (context, imageProvider) =>
                        Container(
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
                      "Authorization":
                      "Bearer ${tokensBox.get('access')}"
                    },
                    placeholder: (context, url) => Image.asset(
                      infoProfile['gender'] == "MAN"
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
                    leadingImg: 'assets/icons/user_for_profile.svg',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditInfoUserScreen(
                            user: infoProfile['user'],
                            image: infoProfile['image'],
                            gender: infoProfile['gender'],
                            bloc: infoProfile["bloc"],
                          ),
                        ),
                      );
                      //  ChangePasswordScreen
                    },
                  ),
                  sizedBoxHeight16(),
                  InfoListTileWidget(
                    text: 'Изменить пароль',
                    leadingImg: 'assets/icons/key_for_profile.svg',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PasswordScreen(),
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
