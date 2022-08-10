import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

import '../../../core/const/const_color.dart';
import '../../../core/const/text_style_const.dart';
import '../../../core/injection_container.dart';
import '../../../core/utils/dio/dio_interceptor.dart';
import '../../../logic/auth/bloc/auth_bloc.dart';
import '../../main/select_jenre.dart';

class AuthGmailScreen extends StatefulWidget {
  const AuthGmailScreen({Key? key}) : super(key: key);

  @override
  State<AuthGmailScreen> createState() => _AuthGmailScreenState();
}

class _AuthGmailScreenState extends State<AuthGmailScreen> {

  bool obscureText = true;
  Box accessToken = Hive.box('tokens');
  TextEditingController loginEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  List list = ['Бизнес', 'Классика', 'Развитие', 'Фантастика'];
  bool validation = false;
  bool loading = false;
  bool wrongPassOrLog = false;
  bool emptyText = true;
  bool emptyText2 = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) async {
        if(state is GetTokensSuccess){
          print(state.authTokensModel);
          if(state.authTokensModel.access!.isNotEmpty) {
            accessToken.put('refresh', state.authTokensModel.refreshToken);
            accessToken.put('access', state.authTokensModel.access);
            DioInterceptor(tokens: accessToken, dio: sl());
            // Navigator.of(context).pushNamedAndRemoveUntil(MainRoute, (Route<dynamic> route) => false);
            Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        JenreScreen(
                          index_month: 0,
                          list: list,
                        ),
                  ),
            );
          }
        }
        if(state is AuthFailure) {
          setState(() {
            validation = true;
          });
          print(state.message);
        }
        if(state is AuthLoading) {
          setState((){
            loading = true;
          });
        } else {
          setState((){
            loading = false;
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: new DecorationImage(
                    image: AssetImage('assets/images/home-2.png'),
                    fit: BoxFit.cover,),
                ),
              ),
              Positioned(
                top: 92,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: (width - 343) / 2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: 343,
                    // height: 316,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back_ios_new),
                                SizedBox(width: 28,),
                                Text(
                                  'Пошта арқылы кіру',
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    fontFamily: 'CeraPro',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'E-mail',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: 'CeraPro',
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: loginEditingController,
                            // obscureText: true,
                            onChanged: (value) {
                              setState(() {
                                validation = false;
                                wrongPassOrLog = false;
                                emptyText = false;
                              });
                            },
                            style: TextStyles.mediumStyle.copyWith(fontSize: 16,
                                color: ColorStyles.neutralsTextPrimaryColor),
                            obscuringCharacter: '•',
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                              hintText: 'example@mugalim.kz',
                              hintStyle: TextStyles.mediumStyle.copyWith(fontSize: 16,
                                  color: Color(0xff767676)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: validation
                                      ? ColorStyles.errorBorderColor
                                      : ColorStyles.neutralsBorderColor,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: validation
                                      ? ColorStyles.errorBorderColor
                                      : ColorStyles.primaryBorderColor,
                                ),
                              ),
                              constraints: BoxConstraints(
                                  maxHeight: 48
                              ),
                              // contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 6),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            'Пароль',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: 'CeraPro',
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                              controller: passwordEditingController,
                              onChanged: (value) {
                                setState(() {
                                  validation = false;
                                  wrongPassOrLog = false;
                                  emptyText2 = false;
                                });
                              },
                              textAlignVertical: TextAlignVertical.bottom,
                              style: obscureText ? TextStyles.boldStyle.copyWith(fontSize: 20,
                                color: ColorStyles.neutralsTextPrimaryColor,letterSpacing: 3.0,):
                              TextStyles.mediumStyle.copyWith(fontSize: 16,
                                  color: ColorStyles.neutralsTextPrimaryColor,),
                              obscureText: obscureText,
                              obscuringCharacter: '•',
                              decoration: InputDecoration(
                                hintText: '',
                                suffixIcon: CupertinoButton(
                                  minSize: 0,
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                  child: !validation ? Icon(
                                    obscureText ? Icons.visibility_off_outlined :
                                    Icons.visibility_outlined,
                                    size: 24,
                                    color: Color(0xff3D3DD8),
                                  ) :
                                  SvgPicture.asset('assets/icons/errorIcon.svg'),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                    color: validation
                                        ? ColorStyles.errorBorderColor
                                        : ColorStyles.neutralsBorderColor,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                    color: validation
                                        ? ColorStyles.errorBorderColor
                                        : ColorStyles.primaryBorderColor,
                                  ),
                                ),
                                constraints: BoxConstraints(
                                    maxHeight: 48
                                ),
                              )
                          ),
                          validation ? SizedBox(height: 8,) : Offstage(),
                          validation ?
                          Text(
                            "Қате E-mail немесе Пароль",
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'CeraPro',
                              fontWeight: FontWeight.w500,
                              color: ColorStyles.errorBorderColor,
                            ),
                          )
                              : Offstage(),
                          SizedBox(height: 20,),
                          TextButton(
                            child: Text(
                              "Кіру",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'CeraPro',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              primary: loginEditingController.text == '' || passwordEditingController.text == ''
                                  ? Colors.black
                                  : Color(0xFFE0E0E0),
                              backgroundColor: loginEditingController.text == '' || passwordEditingController.text == '' ? Color(0xFFE0E0E0) : Color(0xff3D3DD8),
                              minimumSize: Size(343, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            onPressed: () {
                              // if (loginEditingController.text != '' && passwordEditingController.text != '') {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           JenreScreen(
                              //             index_month: 0,
                              //             list: list,
                              //           ),
                              //     ),
                              //   );
                              // }
                              if(loginEditingController.text != '' && passwordEditingController.text != '') {
                                BlocProvider.of<AuthBloc>(context).add(GetTokens(
                                    loginEditingController.text,
                                    passwordEditingController.text));
                              }
                            },

                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
