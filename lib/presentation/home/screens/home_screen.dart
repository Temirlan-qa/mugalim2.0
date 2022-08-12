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
  String str =
      'Нельзя без последствий для здоровья изо дня в день проявлять себя противно тому, что чувствуешь; распинаться перед тем, чего не любишь, радоваться тому, что приносит несчастье. Наша нервная систем...';
  String title =
      "Нельзя же все на свете брать в голову, на что-то можно и наплевать, иначе и свихнуться недолго.\nАнна Гавальда\n'35 кило надежды'";
  bool click_to_show = false;

  // Initial Selected Value
  String dropdownvalue = 'Новости';

  // List of items in our dropdown menu
  var items = [
    'Новости',
    'Local Новости',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Color(0xFF3D3DD8),
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_outlined,
                color: Color(0xFF3D3DD8),
                size: 28,
              ),
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            'Главная',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
              color: Color(0xFF1A1A1A),
              fontFamily: 'CeraPro',
            ),
          ),
          elevation: 0,
          bottom: const TabBar(
            labelColor: Color(0xFF3D3DD8),
            unselectedLabelColor: Color(0xFF767676),
            // indicatorColor: const Color(0xFF3D3DD8),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Color(0xFF3D3DD8), width: 2),
              insets: EdgeInsets.symmetric(horizontal: 15),
            ),
            tabs: [
              // ↓ this part of code just demo ver. p.s(tima)

              // Tab(
              //   child: DropdownButton(
              //     underline: const SizedBox(),
              //     // Initial Value
              //     value: dropdownvalue,
              //     // Down Arrow Icon
              //     icon: const Icon(
              //       Icons.keyboard_arrow_down,
              //       size: 16,
              //       color: Color(0xFF3D3DD8),
              //     ),
              //
              //     // Array list of items
              //     items: items.map((String items) {
              //       return DropdownMenuItem(
              //         value: items,
              //         child: Text(items,
              //           style: const TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w500,
              //             fontFamily: 'CeraPro',
              //             color: Color(0xFF1A1A1A),
              //           ),
              //         ),
              //       );
              //     }).toList(),
              //     // After selecting the desired option,it will
              //     // change button value to selected value
              //     onChanged: (String? newValue) {
              //       setState(() {
              //         dropdownvalue = newValue!;
              //       });
              //     },
              //   ),
              // ),
              Tab(
                child: Text(
                  'Новости',
                  style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'CeraPro',
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Тренды',
                  style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'CeraPro',
                  ),
                ),
              ),
              Tab(
                child: Text(
                  maxLines: 1,
                  'Сохраненные',
                  style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'CeraPro',
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            dropdownvalue == 'Новости'
                ? SingleChildScrollView(
                    child: Container(
                      color: ColorStyles.neutralsPageBackgroundColor,
                      child: ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                radius: 22,
                                                child: ClipOval(
                                                  child: Image.asset(
                                                      "assets/images/mugalim.png"),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: const [
                                                  Text(
                                                    'Mugalim Global',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'CeraPro',
                                                    ),
                                                  ),
                                                  Text(
                                                    'час назад',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: Color(0xff767676),
                                                      fontFamily: 'CeraPro',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              const Icon(
                                                Icons.more_horiz,
                                                color: Color(0xff767676),
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
                                              decoration: TextDecoration.none,
                                              color: Colors.black,
                                              fontFamily: 'CeraPro',
                                            ),
                                            maxLines: 4,
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          const Text(
                                            'Показать полностью...',
                                            style: TextStyle(
                                              fontSize: 14,
                                              decoration: TextDecoration.none,
                                              color: Color(0xff3D3DD8),
                                              fontFamily: 'CeraPro',
                                            ),
                                            maxLines: 1,
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
                                                  color:
                                                      const Color(0xffF9F9F9),
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/icons/heart.svg',
                                                      color: const Color(
                                                          0xff767676),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Text(
                                                      '0',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff767676),
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
                                                  color:
                                                      const Color(0xffF9F9F9),
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/icons/comment.svg',
                                                      color: const Color(
                                                          0xff767676),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Text(
                                                      '0',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff767676),
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
                                                  color:
                                                      const Color(0xffF9F9F9),
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/icons/share.svg',
                                                      color: const Color(
                                                          0xff767676),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Text(
                                                      '0',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff767676),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Spacer(),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/eyeIcon.svg',
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                radius: 22,
                                                child: ClipOval(
                                                  child: Image.asset(
                                                      "assets/images/mugalim.png"),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: const [
                                                  Text(
                                                    'Mugalim Global',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'CeraPro',
                                                    ),
                                                  ),
                                                  Text(
                                                    '5 авг в 10:32',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: Color(0xff767676),
                                                      fontFamily: 'CeraPro',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              const Icon(
                                                Icons.more_horiz,
                                                color: Color(0xff767676),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            title,
                                            style: const TextStyle(
                                              fontSize: 13,
                                              decoration: TextDecoration.none,
                                              color: Colors.black,
                                              fontFamily: 'CeraPro',
                                            ),
                                            maxLines: 4,
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Image.asset(
                                            'assets/images/space.png',
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                          // SizedBox(height: 16,),
                                          const Divider(),
                                          Row(
                                            children: [
                                              Container(
                                                height: 28,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffF9F9F9),
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          6, 0, 6, 0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/heart.svg',
                                                        color: const Color(
                                                            0xff767676),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      const Text(
                                                        '102',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff767676),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Container(
                                                height: 28,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffF9F9F9),
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          6, 0, 6, 0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/comment.svg',
                                                        color: const Color(
                                                            0xff767676),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      const Text(
                                                        '2',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff767676),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Container(
                                                height: 28,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xffFFB800)
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          6, 0, 6, 0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Icon(
                                                        Icons.bookmark,
                                                        color:
                                                            Color(0xffFFB800),
                                                        size: 18,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        '8',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xffFFB800),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/eyeIcon.svg',
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
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  color: Colors.white,
                                  // decoration: BoxDecoration(
                                  //   color: Colors.white,
                                  //   borderRadius: const BorderRadius.all(Radius.circular(16)),
                                  //   border: Border.all(
                                  //     color: const Color(0xFFE0E0E0),
                                  //   ),
                                  // ),
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                    top: 16,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            child: Image.asset(
                                              'assets/icons/mugalim_logo.png',
                                              width: 44,
                                              height: 44,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          Column(
                                            children: const [
                                              Text(
                                                'Mugalim Global',
                                                style: TextStyle(
                                                  fontFamily: 'Cera Pro',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF1A1A1A),
                                                ),
                                              ),
                                              Text(
                                                '2 минуты назад',
                                                style: TextStyle(
                                                  fontFamily: 'Cera Pro',
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFF767676),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.more_horiz,
                                            size: 28,
                                            color: Color(0xFF767676),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      const Text(
                                        'Проходим опрос по случаю Дня Независомости',
                                        style: TextStyle(
                                          fontFamily: 'Cera Pro',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF1A1A1A),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        height: 210,
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(16)),
                                          border: Border.all(
                                            color: const Color(0xFFE0E0E0),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            const Center(
                                              child: Text(
                                                maxLines: 2,
                                                'Поедете ли в Актау вместе с группой?',
                                                style: TextStyle(
                                                  fontFamily: 'Cera Pro',
                                                  fontSize: 20,
                                                  height: 1.2,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF1A1A1A),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  click_to_show =
                                                      !click_to_show;
                                                });

                                                print('You tap Да, поеду');
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                  top: 8,
                                                  bottom: 8,
                                                  left: 12,
                                                  right: 12,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: click_to_show
                                                      ? const Color(0xFFD5D7F6)
                                                      : const Color(0xFFF9F9F9),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(8)),
                                                ),
                                                child: Row(
                                                  children: [
                                                    const Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        'Да, поеду',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Cera Pro',
                                                          fontSize: 13,
                                                          height: 1.2,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xFF3D3DD8),
                                                        ),
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible: click_to_show,
                                                      child: Row(
                                                        children: const [
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Text(
                                                            '·',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Cera Pro',
                                                              fontSize: 13,
                                                              height: 1.2,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xFF767676),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Text(
                                                            '21',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Cera Pro',
                                                              fontSize: 13,
                                                              height: 1.2,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xFF767676),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Visibility(
                                                      visible: click_to_show,
                                                      child: Row(
                                                        children: const [
                                                          Icon(
                                                            Icons.done,
                                                            size: 16,
                                                            color: Color(
                                                                0xFF3D3DD8),
                                                          ),
                                                          SizedBox(
                                                            width: 6,
                                                          ),
                                                          Text(
                                                            '92%',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Cera Pro',
                                                              fontSize: 14,
                                                              height: 1.4,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xFF3D3DD8),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  click_to_show =
                                                      !click_to_show;
                                                });
                                                print('You tap Нет, не поеду');
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: click_to_show
                                                      ? const Color(0xFFD5D7F6)
                                                      : const Color(0xFFF9F9F9),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(8)),
                                                ),
                                                padding: const EdgeInsets.only(
                                                  top: 8,
                                                  bottom: 8,
                                                  left: 12,
                                                  right: 12,
                                                ),
                                                child: Row(
                                                  children: [
                                                    const Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        'Нет, не поеду',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Cera Pro',
                                                          fontSize: 13,
                                                          height: 1.2,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xFF3D3DD8),
                                                        ),
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible: click_to_show,
                                                      child: Row(
                                                        children: const [
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Text(
                                                            '·',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Cera Pro',
                                                              fontSize: 13,
                                                              height: 1.2,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xFF767676),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Text(
                                                            '2',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Cera Pro',
                                                              fontSize: 13,
                                                              height: 1.2,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xFF767676),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Visibility(
                                                      visible: click_to_show,
                                                      child: const Text(
                                                        '8%',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Cera Pro',
                                                          fontSize: 14,
                                                          height: 1.4,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xFF3D3DD8),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            const Center(
                                              child: Text(
                                                'Проголосуйте первым!',
                                                style: TextStyle(
                                                  fontFamily: 'Cera Pro',
                                                  fontSize: 13,
                                                  height: 1.2,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFF767676),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        width: 343,
                                        height: 1,
                                        color: const Color(0xFFE0E0E0),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 28,
                                            decoration: BoxDecoration(
                                              color: Color(0xffF9F9F9),
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      6, 0, 6, 0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/heart.svg',
                                                    color: Color(0xff767676),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    '102',
                                                    style: TextStyle(
                                                      color: Color(0xff767676),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            height: 28,
                                            decoration: BoxDecoration(
                                              color: Color(0xffF9F9F9),
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      6, 0, 6, 0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/comment.svg',
                                                    color: Color(0xff767676),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    '2',
                                                    style: TextStyle(
                                                      color: Color(0xff767676),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            height: 28,
                                            decoration: BoxDecoration(
                                              color: Color(0xffFFB800)
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      6, 0, 6, 0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.bookmark,
                                                    color: Color(0xffFFB800),
                                                    size: 18,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    '8',
                                                    style: TextStyle(
                                                      color: Color(0xffFFB800),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/eyeIcon.svg',
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '0',
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
                              ],
                            );
                          }),
                    ),
                  )
                : const Center(child: Text("Local Новости")),
            const Center(child: Text("Тренды")),
            const Center(child: Text("Сохраненные")),
          ],
        ),
      ),
    );
  }
}
