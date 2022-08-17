import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/widgets/line_widget.dart';

class HomeCommentsPage extends StatelessWidget {
  HomeCommentsPage({Key? key}) : super(key: key);

  String str =
      'Нельзя без последствий для здоровья изо дня в день проявлять себя противно тому, что чувствуешь; распинаться перед тем, чего не любишь, радоваться тому, что приносит несчастье. Наша нервная систем...';
  String str1 =
      "That's a fantastic new app feature.You and your\nteam did an excellent job of incorporating user\ntesting feedback.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          'Пост',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
            fontFamily: 'CeraPro',
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            color: const Color(0xFF3D3DD8),
            onPressed: () {},
            icon: const Icon(
              Icons.ios_share,
              size: 20,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Color(0xFF3D3DD8),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
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
                          child: Image.asset("assets/images/mugalim.png"),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
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
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                            size: 28,
                            color: Color(0xFF767676),
                          ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    str,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontFamily: 'CeraPro',
                    ),
                    maxLines: 4,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  InkWell(
                    onTap: () {
                      print('Показать полностью...');
                    },
                    child: const Text(
                      'Показать полностью...',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        decoration: TextDecoration.none,
                        color: Color(0xff3D3DD8),
                        fontFamily: 'CeraPro',
                      ),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 45,
                        height: 28,
                        decoration: BoxDecoration(
                          color: const Color(0xffF9F9F9),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/heart.svg',
                              color: const Color(0xff767676),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              '0',
                              style: TextStyle(
                                color: Color(0xff767676),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 45,
                        height: 28,
                        decoration: BoxDecoration(
                          color: const Color(0xffF9F9F9),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/comment.svg',
                              color: const Color(0xff767676),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              '0',
                              style: TextStyle(
                                color: Color(0xff767676),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 45,
                        height: 28,
                        decoration: BoxDecoration(
                          color: const Color(0xffF9F9F9),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/share.svg',
                              color: const Color(0xff767676),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              '0',
                              style: TextStyle(
                                color: Color(0xff767676),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/eyeIcon.svg',
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            '2',
                            style: TextStyle(
                              color: Color(0xff767676),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 22,
                            child: ClipOval(
                              child: Image.asset("assets/images/mugalim.png"),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'Mugalim Global',
                                style: TextStyle(
                                  fontSize: 14,
                                  decoration: TextDecoration.none,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'CeraPro',
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                str1,
                                style: const TextStyle(
                                  fontSize: 13,
                                  decoration: TextDecoration.none,
                                  color: Color(0xff767676),
                                  fontFamily: 'CeraPro',
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '5 авг в 13:54',
                                    style: TextStyle(
                                      color: Color(0xFF767676),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Cera Pro',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Ответить',
                                      style: TextStyle(
                                        color: Color(0xFF3D3DD8),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Cera Pro',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 85,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.favorite,
                                          color: Color(0xFFE71D36),
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '1',
                                          style: TextStyle(
                                            color: Color(0xFFE71D36),
                                            fontFamily: 'Cera Pro',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
                // return Container(
                //   color: ColorStyles.neutralsPageBackgroundColor,
                //   padding: EdgeInsets.symmetric(horizontal: 16),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           CircleAvatar(
                //             radius: 22,
                //             child: ClipOval(
                //               child: Image.asset("assets/images/mugalim.png"),
                //             ),
                //           ),
                //           const SizedBox(
                //             width: 16,
                //           ),
                //
                //           Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             children: [
                //               Text(
                //                 'Maude Hall',
                //                 style: TextStyle(
                //                   fontSize: 13,
                //                   color: Color(0xFF1A1A1A),
                //                   fontWeight: FontWeight.w500,
                //                   fontFamily: 'CeraPro',
                //                 ),
                //               ),
                //               Text(
                //                 str1,
                //                 style: TextStyle(
                //                   fontWeight: FontWeight.w400,
                //                   fontSize: 13,
                //                   height: 1.2,
                //                   color: Color(0xFF1A1A1A),
                //                   fontFamily: 'CeraPro',
                //                 ),
                //               ),
                //               SizedBox(height: 10,),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Text(
                //                     '5 авг в 13:54',
                //                     style: TextStyle(
                //                       color: Color(0xFF767676),
                //                       fontSize: 13,
                //                       fontWeight: FontWeight.w400,
                //                       fontFamily: 'Cera Pro',
                //                     ),
                //                   ),
                //                   SizedBox(width: 16,),
                //                   TextButton(
                //                     onPressed: (){},
                //                     child: Text(
                //                       'Ответить',
                //                       style: TextStyle(
                //                         color: Color(0xFF3D3DD8),
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.w500,
                //                         fontFamily: 'Cera Pro',
                //                       ),
                //                     ),
                //                   ),
                //                   SizedBox(width: 80,),
                //                   InkWell(
                //                     onTap: (){},
                //                     child: Row(
                //                       crossAxisAlignment:
                //                       CrossAxisAlignment.center,
                //                       mainAxisAlignment:
                //                       MainAxisAlignment.center,
                //                       children: const [
                //                         Icon(
                //                           Icons.favorite,
                //                           color: Color(0xFFE71D36),
                //                           size: 16,
                //                         ),
                //                         SizedBox(
                //                           width: 5,
                //                         ),
                //                         Text(
                //                           '1K',
                //                           style: TextStyle(
                //                             color: Color(0xFFE71D36),
                //                             fontFamily: 'Cera Pro',
                //                             fontWeight:
                //                             FontWeight.w500,
                //                             fontSize: 14,
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //
                //                 ],
                //               ),
                //             ],
                //           ),
                //
                //         ],
                //       ),
                //
                //     ],
                //   ),
                //
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
