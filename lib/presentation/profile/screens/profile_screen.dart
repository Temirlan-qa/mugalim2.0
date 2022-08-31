import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/routes/routes_const.dart';
import 'package:mugalim/core/widgets/line_widget.dart';
import 'package:mugalim/presentation/profile/screens/aboutProject_screen.dart';
import 'package:mugalim/presentation/profile/screens/settings_screen.dart';
import 'package:mugalim/presentation/profile/screens/write_review_screen.dart';
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
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileSuccess) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsScreen(
                                nameAndSurname : '${state.profileModel.firstName} ${state.profileModel.lastName}',
                                role : state.profileModel.user!['roles'],
                                image: state.profileModel.avatar,
                                gender: state.profileModel.gender,
                                user: state.profileModel.user,
                              ),
                          ),
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
                            Image.asset(
                              state.profileModel.avatar == null && state.profileModel.gender == "MAN"
                                  ?'assets/images/male.png'
                                  : state.profileModel.avatar == null
                                  ? 'assets/images/female.png'
                                  : state.profileModel.avatar.toString(),
                              width: 56,
                              height: 56,
                              fit: BoxFit.fill,
                            ),
                            // Lottie.asset(
                            //   // mloader.json
                            //   //repeat: false,
                            //   'assets/animations/Loader.json',
                            //   width: 56,
                            //   height: 56,
                            //   fit: BoxFit.fill,
                            // ),
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
                    // TextButton(onPressed: (){
                    //   print(state.profileModel.user!['roles'].join(", ").runtimeType);
                    // }, child: Text('Test Data')),
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
                      leading_img: 'assets/icons/mugalim_logo_for_profile.svg',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AboutProjectScreen(),
                          ),
                        );
                      },
                    ),
                    sizedBoxHeight16(),
                    LineWidget(
                      width: MediaQuery.of(context).size.width,
                    ),
                    sizedBoxHeight16(),
                    InfoListTileWidget(
                      text: 'Написать отзыв',
                      leading_img: 'assets/icons/feedback_for_profile.svg',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WriteReviewScreen(),
                          ),
                        );
                      },
                    ),
                    sizedBoxHeight16(),
                    InfoListTileWidget(
                      text: 'О приложении',
                      leading_img: 'assets/icons/about_for_profile.svg',
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed(AboutApp);
                      },
                    ),
                    sizedBoxHeight16(),
                    BtnWidget(
                      Color: null,
                      onPressed: () {},
                      text: 'Выйти',
                      fontSize: 16,
                      textColor: ColorStyles.errorShapeColor,
                    ),
                  ],
                );
              }else if(state is ProfileFailure){
                return const Text('ProfileFailure');
              }
              else if(state is ProfileLoading){
                return const Text('ProfileLoading');
              }
              return const Text("Post don't loaded");
            },
          ),
        ),
      ),
    );
  }
}
