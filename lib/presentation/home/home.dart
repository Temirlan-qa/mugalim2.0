import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool click_to_show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 360,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            border: Border.all(
              color: const Color(0xFFE0E0E0),
            ),
          ),
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
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  border: Border.all(
                    color: const Color(0xFFE0E0E0),
                  ),
                ),
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        maxLines:2,
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
                          click_to_show = !click_to_show;
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
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Да, поеду',
                                style: TextStyle(
                                  fontFamily: 'Cera Pro',
                                  fontSize: 13,
                                  height: 1.2,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF3D3DD8),
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
                                      fontFamily: 'Cera Pro',
                                      fontSize: 13,
                                      height: 1.2,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF767676),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '21',
                                    style: TextStyle(
                                      fontFamily: 'Cera Pro',
                                      fontSize: 13,
                                      height: 1.2,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF767676),
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
                                    color: Color(0xFF3D3DD8),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    '92%',
                                    style: TextStyle(
                                      fontFamily: 'Cera Pro',
                                      fontSize: 14,
                                      height: 1.4,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF3D3DD8),
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
                          click_to_show = !click_to_show;
                        });
                        print('You tap Нет, не поеду');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: click_to_show
                              ? const Color(0xFFD5D7F6)
                              : const Color(0xFFF9F9F9),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
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
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Нет, не поеду',
                                style: TextStyle(
                                  fontFamily: 'Cera Pro',
                                  fontSize: 13,
                                  height: 1.2,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF3D3DD8),
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
                                      fontFamily: 'Cera Pro',
                                      fontSize: 13,
                                      height: 1.2,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF767676),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '2',
                                    style: TextStyle(
                                      fontFamily: 'Cera Pro',
                                      fontSize: 13,
                                      height: 1.2,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF767676),
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
                                  fontFamily: 'Cera Pro',
                                  fontSize: 14,
                                  height: 1.4,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF3D3DD8),
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
                height: 1,
                color: const Color(0xFFE0E0E0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
