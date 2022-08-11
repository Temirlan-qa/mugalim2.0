import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/const/const_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String str = 'Нельзя без последствий для здоровья изо дня в день проявлять себя противно тому, что чувствуешь; распинаться перед тем, чего не любишь, радоваться тому, что приносит несчастье. Наша нервная систем...';
  String title = "Нельзя же все на свете брать в голову, на что-то можно и наплевать, иначе и свихнуться недолго.\nАнна Гавальда\n'35 кило надежды'";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Главная',
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontFamily: 'CeraPro',
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: ColorStyles.neutralsPageBackgroundColor,
          child: ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  radius: 22,
                                  child: ClipOval(
                                    child: Image.asset(
                                        "assets/images/mugalim.png"
                                    ),
                                  ),
                              ),
                              SizedBox(width: 16,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mugalim Global',
                                    style: TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'CeraPro',
                                    ),
                                  ),
                                  Text(
                                    'час назад',
                                    style: TextStyle(
                                      fontSize: 13,
                                      decoration: TextDecoration.none,
                                      color: Color(0xff767676),
                                      fontFamily: 'CeraPro',
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Icon(Icons.more_horiz,color: Color(0xff767676),),
                            ],
                          ),
                          SizedBox(height: 16,),
                          Text(
                            str,
                            style: TextStyle(
                              fontSize: 13,
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontFamily: 'CeraPro',
                            ),
                            maxLines: 4,
                          ),
                          SizedBox(height: 4,),
                          Text(
                            'Показать полностью...',
                            style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.none,
                              color: Color(0xff3D3DD8),
                              fontFamily: 'CeraPro',
                            ),
                            maxLines: 1,
                          ),
                          SizedBox(height: 12,),
                          Row(
                            children: [
                              Container(
                                width: 45,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: Color(0xffF9F9F9),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/icons/heart.svg',color: Color(0xff767676),),
                                    SizedBox(width: 5,),
                                    Text('0',style: TextStyle(color: Color(0xff767676),),),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8,),
                              Container(
                                width: 45,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: Color(0xffF9F9F9),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/icons/comment.svg',color: Color(0xff767676),),
                                    SizedBox(width: 5,),
                                    Text('0',style: TextStyle(color: Color(0xff767676),),),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8,),
                              Container(
                                width: 45,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: Color(0xffF9F9F9),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/icons/share.svg',color: Color(0xff767676),),
                                    SizedBox(width: 5,),
                                    Text('0',style: TextStyle(color: Color(0xff767676),),),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/icons/eyeIcon.svg',),
                                  SizedBox(width: 5,),
                                  Text('0',style: TextStyle(color: Color(0xff767676),),),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 22,
                                child: ClipOval(
                                  child: Image.asset(
                                      "assets/images/mugalim.png"
                                  ),
                                ),
                              ),
                              SizedBox(width: 16,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mugalim Global',
                                    style: TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'CeraPro',
                                    ),
                                  ),
                                  Text(
                                    '5 авг в 10:32',
                                    style: TextStyle(
                                      fontSize: 13,
                                      decoration: TextDecoration.none,
                                      color: Color(0xff767676),
                                      fontFamily: 'CeraPro',
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Icon(Icons.more_horiz,color: Color(0xff767676),),
                            ],
                          ),
                          SizedBox(height: 16,),
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 13,
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontFamily: 'CeraPro',
                            ),
                            maxLines: 4,
                          ),
                          SizedBox(height: 12,),
                          Image.asset('assets/images/space.png',width:MediaQuery.of(context).size.width,),
                          // SizedBox(height: 16,),
                          Divider(),
                          Row(
                            children: [
                              Container(
                                height: 28,
                                decoration: BoxDecoration(
                                  color: Color(0xffF9F9F9),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(6,0,6,0),
                                  child: Expanded(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/icons/heart.svg',color: Color(0xff767676),),
                                        SizedBox(width: 5,),
                                        Text('102',style: TextStyle(color: Color(0xff767676),),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8,),
                              Container(
                                height: 28,
                                decoration: BoxDecoration(
                                  color: Color(0xffF9F9F9),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(6,0,6,0),
                                  child: Expanded(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/icons/comment.svg',color: Color(0xff767676),),
                                        SizedBox(width: 5,),
                                        Text('2',style: TextStyle(color: Color(0xff767676),),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8,),
                              Container(
                                height: 28,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFB800).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(6,0,6,0),
                                  child: Expanded(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.bookmark,color: Color(0xffFFB800),size: 18,),
                                        SizedBox(width: 5,),
                                        Text('8',style: TextStyle(color: Color(0xffFFB800),),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/icons/eyeIcon.svg',),
                                  SizedBox(width: 5,),
                                  Text('0',style: TextStyle(color: Color(0xff767676),),),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
