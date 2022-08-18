import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/presentation/home/widgets/SizedBox.dart';
import 'package:mugalim/presentation/home/widgets/post_widget.dart';
import '../../../core/const/const_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  String str =
      'Нельзя без последствий для здоровья изо дня в день проявлять себя противно тому, что чувствуешь; распинаться перед тем, чего не любишь, радоваться тому, что приносит несчастье. Наша нервная система не пустой звук, не выдумка. Она — состоящее из волокон физическое тело. Наша душа занимает место в пространстве и помещается в нас как зубы во рту. Ее нельзя без конца насиловать безнаказанно.\n\nБорис Пастернак, «Доктор Живаго»';
  String title =
      "Нельзя без последствий для здоровья изо дня в день проявлять себя противно тому, что чувствуешь; распинаться перед тем, чего не любишь, радоваться тому, что приносит несчастье. Наша нервная систем";
  bool click_to_show = false;
  String gonna = "";
  int tabIndex = 0;
  // Initial Selected Value
  String dropdownvalue = 'Новости ';

  // List of items in our dropdown menu
  var items = [
    'Новости ',
    'Регион ',
    'Город ',
  ];
  bool search = false;
  TextEditingController searchEditingController = TextEditingController();

  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: tabIndex,
      length: 3,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: ColorStyles.neutralsPageBackgroundColor,
            appBar: AppBar(
              leading: !search
                  ? const SizedBox()
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          search = !search;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 16,
                        color: Color(0xFF3D3DD8),
                      ),
                    ),
              actions: <Widget>[
                Visibility(
                  visible: !search,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        search = !search;
                      });
                    },
                    icon: !search
                        ? const Icon(
                            Icons.search,
                            size: 28,
                            color: Color(0xFF3D3DD8),
                          )
                        : const SizedBox(),
                  ),
                ),
                Visibility(
                  visible: !search,
                  child: IconButton(
                      onPressed: () {
                        print('bell');
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/bell.svg',
                        color: const Color(0xFF3D3DD8),
                        height: 23.33,
                        width: 21,
                      )),
                ),
              ],
              centerTitle: true,
              backgroundColor: Colors.white,
              title: !search
                  ? const Text(
                      'Главная',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                        fontFamily: 'CeraPro',
                      ),
                    )
                  : TextFormField(
                      controller: searchEditingController,
                      autofocus: true,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Cera Pro',
                        fontSize: 18,
                        color: Color(0xFF1A1A1A),
                      ),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFF9F9F9),
                        disabledBorder: InputBorder.none,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(),
                        ),
                        focusedBorder: InputBorder.none,
                        hintText: '',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Cera Pro',
                          fontSize: 16,
                          color: Color(0xFF1A1A1A),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 18,
                          color: Color(0xFF767676),
                        ),
                        constraints: const BoxConstraints(maxHeight: 32),
                        // contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 6),
                      ),
                    ),
              elevation: 0,
              bottom: TabBar(
                // ↓ labelPadding Сохраненные ны толык корсету ушин
                //labelPadding: EdgeInsets.all(0),
                labelColor: const Color(0xFF3D3DD8),
                unselectedLabelColor: const Color(0xFF767676),
                indicatorColor: const Color(0xFF3D3DD8),
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(color: Color(0xFF3D3DD8), width: 2),
                  insets: EdgeInsets.symmetric(horizontal: 15),
                ),
                tabs: [
                  Tab(
                    child: DropdownButton2(
                      offset: const Offset(-10, -7),
                      underline: const SizedBox(),
                      itemHeight: 45,
                      itemPadding:
                          const EdgeInsets.only(left: 16, top: 12, bottom: 12),
                      dropdownMaxHeight: 140,
                      dropdownWidth: 110,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hint: Row(
                        children: [
                          Text(
                            dropdownvalue,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'CeraPro',
                              color: Color(0xFF1A1A1A),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      // isExpanded: true,
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            items,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'CeraPro',
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        );
                      }).toList(),
                      value: dropdownvalue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue.toString();
                        });
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        // size: 16,
                        // color: Color(0xFF3D3DD8),
                      ),
                      iconSize: 16,
                      iconEnabledColor: const Color(0xFF3D3DD8),
                      iconOnClick: const Icon(
                        Icons.keyboard_arrow_up,
                        // size: 16,
                        // color: Color(0xFF3D3DD8),
                      ),
                    ),
                  ),
                  //Package сиз жасалган

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
                  //     // Array list of items
                  //     items: items.map((String items) {
                  //       return DropdownMenuItem(
                  //         value: items,
                  //         child: Text(
                  //           maxLines: 1,
                  //           overflow: TextOverflow.clip,
                  //           items,
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
                  const Tab(
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      'Тренды',
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'CeraPro',
                      ),
                    ),
                  ),
                  const Tab(
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.clip,
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
                dropdownvalue == 'Новости '
                    ? SingleChildScrollView(
                        child: Container(
                          color: ColorStyles.neutralsPageBackgroundColor,
                          child: ListView.builder(
                              itemCount: 1,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return PostWidget(
                                  hasImg: true,
                                  hasVote: true,
                                  image: 'assets/images/space.png',
                                  imageAuthor: 'assets/icons/mugalim_logo.png',
                                  //title: title,
                                  title: str,
                                  postAuthor: 'Mugalim Global',
                                  postPublicationDate: '2 авг в 13:54',
                                  votePPL1: 45,
                                  votePPL2: 70,
                                  voteProcent1: 90,
                                  voteProcent2: 10,
                                  voteAnswer1: 'Да, пойду  77777777 7777777777 777777777 7777777 777777',
                                  voteAnswer2: 'Нет, не пойду 8888888888888 888888888 888888 ',
                                  votetitle: 'Пойдете ли в горы вместе с группой?',
                                );
                              }),
                        ),
                      )
                    : dropdownvalue == 'Регион '
                        ? const Center(child: Text('Регион '))
                        : const Center(child: Text('Город ')),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
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
                            icon: const Icon(
                              Icons.more_horiz,
                              size: 28,
                              color: Color(0xFF767676),
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight16(),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Проходим опрос по случаю Дня Независомости',
                          style: TextStyle(
                            fontFamily: 'Cera Pro',
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ),
                      sizedBoxHeight8(),
                      Container(
                        height: 210,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          border: Border.all(
                            color: const Color(0xFFE0E0E0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              maxLines: 2,
                              'Поедете ли в Актау вместе с группой?',
                              style: TextStyle(
                                fontFamily: 'Cera Pro',
                                fontSize: 20,
                                height: 1.2,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1A1A1A),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            sizedBoxHeight16(),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  click_to_show = !click_to_show;
                                  gonna = 'yes';
                                });

                                print('You tap Да, поеду');
                              },
                              child: Container(
                                // height: 32,
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
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
                                        children: [
                                          gonna == 'yes'
                                              ? const Icon(
                                                  Icons.done,
                                                  size: 16,
                                                  color: Color(0xFF3D3DD8),
                                                )
                                              : const Offstage(),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          const Text(
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
                            sizedBoxHeight8(),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  click_to_show = !click_to_show;
                                  gonna = 'no';
                                });
                                print('You tap Нет, не поеду');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: click_to_show
                                      ? const Color(0xFFD5D7F6)
                                      : const Color(0xFFF9F9F9),
                                  borderRadius: const BorderRadius.all(
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
                                      child: Row(
                                        children: [
                                          gonna == 'no'
                                              ? const Icon(
                                                  Icons.done,
                                                  size: 16,
                                                  color: Color(0xFF3D3DD8),
                                                )
                                              : const Offstage(),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          const Text(
                                            '8%',
                                            style: TextStyle(
                                              fontFamily: 'Cera Pro',
                                              fontSize: 14,
                                              height: 1.4,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF3D3DD8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            sizedBoxHeight16(),
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
                      sizedBoxHeight8(),
                      Container(
                        width: 343,
                        height: 1,
                        color: const Color(0xFFE0E0E0),
                      ),
                      sizedBoxHeight8(),
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
                      ),
                      sizedBoxHeight16(),
                    ],
                  ),
                ),
                const Center(child: Text('Сохраненные ')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
