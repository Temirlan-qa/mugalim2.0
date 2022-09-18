import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/routes/environment_config.dart';
import 'package:mugalim/core/routes/routes_const.dart';
import 'package:mugalim/core/widgets/line_widget.dart';
import 'package:mugalim/presentation/profile/widgets/btn_widget.dart';
import 'package:mugalim/presentation/profile/widgets/info_listtile_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mugalim/logic/profile/bloc/profile_bloc.dart';

//TODO: add english level to backend

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Box tokensBox = Hive.box('tokens');
  Box userBox = Hive.box('user');
  Box viewedBox = Hive.box('viewedBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Профиль',
          style: TextStyles.boldStyle.copyWith(
            color: ColorStyles.neutralsTextPrimaryColor,
            fontSize: 23,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context2, state) {
              if (state is ProfileSuccess) {
                userBox.put('id', state.profileModel.id);
                userBox.put('avatarId', state.profileModel.avatar);
                userBox.put('userName', state.profileModel.fio);
              }
            },
            builder: (context2, state) {
              if (state is ProfileSuccess) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context2, rootNavigator: true).pushNamed(
                          SettingsRoute,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: ColorStyles.primarySurfaceColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: '${EnvironmentConfig.url}/file/image/${state.profileModel.avatar}?size=xs',
                              width: 56,
                              height: 56,
                              fit: BoxFit.fill,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 56,
                                height: 56,
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
                                state.profileModel.gender == "MAN"
                                    ? 'assets/images/male.png'
                                    : 'assets/images/female.png',
                                width: 56,
                                height: 56,
                                fit: BoxFit.fill,
                              ),
                              errorWidget: (context, str, url) => Lottie.asset(
                                'assets/animations/Loader.json',
                                width: 56,
                                height: 56,
                                fit: BoxFit.fill,
                              ),
                            ),
                            sizedBoxWidth16(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${state.profileModel.firstName} ${state.profileModel.lastName}',
                                  style: TextStyles.mediumStyle.copyWith(
                                    color: ColorStyles.neutralsTextPrimaryColor,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '${state.profileModel.user!['roles'].join(", ")}',
                                  style: TextStyles.regularStyle.copyWith(
                                    color: ColorStyles.neutralsTextPrimaryColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Icon(
                              CupertinoIcons.chevron_forward,
                              color: ColorStyles.primarySurfaceHoverColor,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    sizedBoxHeight16(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      width: MediaQuery.of(context).size.width - 16,
                      decoration: BoxDecoration(
                          color: ColorStyles.primaryBorderColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Группа:',
                            style: TextStyles.regularStyle.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            state.profileModel.groups.join(", ").toString(),
                            style: TextStyles.mediumStyle.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          sizedBoxHeight8(),
                          Text(
                            'English level:',
                            style: TextStyles.regularStyle.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Elementry',
                            style: TextStyles.mediumStyle.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizedBoxHeight16(),
                    InfoListTileWidget(
                      text: 'Про проект Мugalim',
                      leadingImg: 'assets/icons/mugalim_logo_for_profile.svg',
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed(AboutProjectRoute);
                      },
                    ),
                    //AboutProjectRoute
                    sizedBoxHeight16(),
                    LineWidget(
                      width: MediaQuery.of(context).size.width,
                    ),
                    sizedBoxHeight16(),
                    InfoListTileWidget(
                      text: 'Написать отзыв',
                      leadingImg: 'assets/icons/feedback_for_profile.svg',
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed(WriteReviewRoute);
                      },
                    ),
                    sizedBoxHeight16(),
                    InfoListTileWidget(
                      text: 'О приложении',
                      leadingImg: 'assets/icons/about_for_profile.svg',
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed(AboutAppRoute);
                      },
                    ),
                    sizedBoxHeight16(),
                    BtnWidget(
                      color: null,
                      onPressed: () async {
                        Navigator.of(context, rootNavigator: true)
                            .pushReplacementNamed(AuthRoute);
                        tokensBox.clear();
                        userBox.clear();
                        viewedBox.clear();
                      },
                      text: 'Выйти',
                      fontSize: 16,
                      textColor: ColorStyles.errorShapeColor,
                    ),
                  ],
                );
              } else if (state is ProfileFailure) {
                return const Text('ProfileFailure');
              } else if (state is ProfileLoading) {
                return const Text('ProfileLoading');
              }
              return const Text(" ");
            },
          ),
        ),
      ),
    );
  }
}
