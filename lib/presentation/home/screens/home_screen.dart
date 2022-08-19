import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  String gonna = "";
  int tabIndex = 0;
  // Initial Selected Value
  String dropdownvalue = 'Новости ';
  List<Map<String, dynamic>> testPostData = [
    {
      'hasImg': false,
      'image': 'assets/images/space.png',

      'imageAuthor': 'assets/icons/mugalim_logo.png',
      'title': 'Post 1 lalalalaallalalldldlojfndjibefhbfjewlfkbfjibefjbkfwjfbkjwfbkjfbkjwfebkjfbkjfewbkfjbkf длпкпдлукпдпдупдлукт длтукдлтпдлуптдукпдлукпт длтупдлтудлкптукдлптукдлптудк пддлукт дтпд лтукпдлу  длтпдлкутпдлкутпдлукп ',
      'postAuthor': 'Mugalim Global',
      'postPublicationDate': '2 авг в 13:54',

      'hasVote': false,
      'votePPL1': 45,
      'votePPL2': 70,
      'voteProcent1': 90,
      'voteProcent2': 10,
      'voteAnswer1': 'Да, пойду  77777777 7777777777 777777777 7777777 777777',
      'voteAnswer2': 'Нет, не пойду 8888888888888 888888888 888888 ',
      'votetitle': 'Пойдете ли в горы вместе с группой?',

      'pplShow': 1111,
      'pplSaved': 21111,
      'pplLike': 311111,
      'pplCommented': 4111,
    },
    {
      'hasImg': false,
      'hasVote': true,
      'image': 'assets/images/space.png',
      'imageAuthor': 'assets/icons/mugalim_logo.png',
      'title':
          'Post 1 lalalalaallalalldldlojfndjibefhbfjewlfkbfjibefjbkfwjfbkjwfbkjfbkjwfebkjfbkjfewbkfjbkf',
      'postAuthor': 'Mugalim Global',
      'postPublicationDate': '18 авг в 13:54',
      'votePPL1': 45,
      'votePPL2': 70,
      'voteProcent1': 90,
      'voteProcent2': 10,
      'voteAnswer1': 'Да, пойду  77777777 7777777777 777777777 7777777 777777',
      'voteAnswer2': 'Нет, не пойду 8888888888888 888888888 888888 ',
      'votetitle': 'Пойдете ли в горы вместе с группой?',

      'pplShow': 111,
      'pplSaved': 222,
      'pplLike': 333,
      'pplCommented': 444,
    },
    {
      'hasImg': true,
      'hasVote': false,
      'image': 'assets/images/space.png',
      'imageAuthor': 'assets/icons/mugalim_logo.png',
      'title':
          'Post 1 lalalalaallalalldldlojfndjibefhbfjewlfkbfjibefjbkfwjfbkjwfbkjfbkjwfebkjfbkjfewbkfjbkf',
      'postAuthor': 'Mugalim Global',
      'postPublicationDate': '1 week ago',
      'votePPL1': 45,
      'votePPL2': 70,
      'voteProcent1': 90,
      'voteProcent2': 10,
      'voteAnswer1': 'Да, пойду  77777777 7777777777 777777777 7777777 777777',
      'voteAnswer2': 'Нет, не пойду 8888888888888 888888888 888888 ',
      'votetitle': 'Пойдете ли в горы вместе с группой?',

      'pplShow': 11,
      'pplSaved': 22,
      'pplLike': 33,
      'pplCommented': 44,
    },
    {
      'hasImg': true,
      'hasVote': true,
      'image': 'assets/images/space.png',
      'imageAuthor': 'assets/icons/mugalim_logo.png',
      'title':
          'Post 1 lalalalaallalalldldlojfndjibefhbfjewlfkbfjibefjbkfwjfbkjwfbkjfbkjwfebkjfbkjfewbkfjbkf',
      'postAuthor': 'Mugalim Global',
      'postPublicationDate': '2 weeks ago',
      'votePPL1': 45,
      'votePPL2': 70,
      'voteProcent1': 90,
      'voteProcent2': 10,
      'voteAnswer1': 'Да, пойду  77777777 7777777777 777777777 7777777 777777',
      'voteAnswer2': 'Нет, не пойду 8888888888888 888888888 888888 ',
      'votetitle': 'Пойдете ли в горы вместе с группой?',

      'pplShow': 1,
      'pplSaved': 2,
      'pplLike': 3,
      'pplCommented': 4,
    },
    {
      'hasImg': true,
      'hasVote': true,
      'image': 'assets/images/space.png',
      'imageAuthor': 'assets/icons/mugalim_logo.png',
      'title':
          'Post 1 lalalalaallalalldldlojfndjibefhbfjewlfkbfjibefjbkfwjfbkjwfbkjfbkjwfebkjfbkjfewbkfjbkf',
      'postAuthor': 'Mugalim Global',
      'postPublicationDate': 'now',
      'votePPL1': 45,
      'votePPL2': 70,
      'voteProcent1': 90,
      'voteProcent2': 10,
      'voteAnswer1': 'Да, пойду  77777777 7777777777 777777777 7777777 777777',
      'voteAnswer2': 'Нет, не пойду 8888888888888 888888888 888888 ',
      'votetitle': 'Пойдете ли вы ы Kokshetau вместе с группой?',


      'pplShow': 0,
      'pplSaved': 0,
      'pplLike': 0,
      'pplCommented': 0,
    },
    {
      'hasImg': false,
      'hasVote': false,
      'image': 'assets/images/space.png',
      'imageAuthor': 'assets/icons/mugalim_logo.png',
      'title':
          'Post 1 lalalalaallalalldldlojfndjibefhbfjewlfkbfjibefjbkfwjfbkjwfbkjfbkjwfebkjfbkjfewbkfjbkf',
      'postAuthor': 'Mugalim Global',
      'postPublicationDate': '1 day ago',
      'votePPL1': 45,
      'votePPL2': 70,
      'voteProcent1': 90,
      'voteProcent2': 10,
      'voteAnswer1': 'Да, пойду  77777777 7777777777 777777777 7777777 777777',
      'voteAnswer2': 'Нет, не пойду 8888888888888 888888888 888888 ',
      'votetitle': 'Пойдете ли в горы вместе с группой?',

      'pplShow': 9,
      'pplSaved': 9,
      'pplLike': 9,
      'pplCommented': 9,
    },
  ];

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
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 16,
                        color: ColorStyles.primaryBorderColor,
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
                        ? Icon(
                            Icons.search,
                            size: 28,
                            color: ColorStyles.primaryBorderColor,
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
                        color: ColorStyles.primaryBorderColor,
                        height: 23.33,
                        width: 21,
                      )),
                ),
              ],
              centerTitle: true,
              backgroundColor: Colors.white,
              title: !search
                  ? Text(
                      'Главная',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        color: ColorStyles.neutralsTextPrimaryColor,
                        fontFamily: 'CeraPro',
                      ),
                    )
                  : TextFormField(
                      controller: searchEditingController,
                      autofocus: true,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Cera Pro',
                        fontSize: 18,
                        color:  ColorStyles.neutralsTextPrimaryColor,
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
                        hintText: 'Поиск',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Cera Pro',
                          fontSize: 16,
                          color: ColorStyles.primarySurfaceHoverColor,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 18,
                          color: ColorStyles.primarySurfaceHoverColor,
                        ),
                        constraints: const BoxConstraints(maxHeight: 32),
                        // contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 6),
                      ),
                    ),
              elevation: 0,
              bottom: TabBar(
                // ↓ labelPadding Сохраненные ны толык корсету ушин
                //labelPadding: EdgeInsets.all(0),
                labelColor: ColorStyles.primaryBorderColor,
                unselectedLabelColor: ColorStyles.primarySurfaceHoverColor,
                indicatorColor: ColorStyles.primaryBorderColor,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: ColorStyles.primaryBorderColor, width: 2),
                  insets: const EdgeInsets.symmetric(horizontal: 15),
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
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'CeraPro',
                              color:  ColorStyles.neutralsTextPrimaryColor,
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
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'CeraPro',
                              color:  ColorStyles.neutralsTextPrimaryColor,
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
                      iconEnabledColor: ColorStyles.primaryBorderColor,
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
                              itemCount: testPostData.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return PostWidget(
                                  hasImg: testPostData[index]['hasImg'],
                                  hasVote: testPostData[index]['hasVote'],
                                  image: testPostData[index]['image'],
                                  imageAuthor: testPostData[index]
                                      ['imageAuthor'],
                                  title: testPostData[index]['title'],
                                  postAuthor: testPostData[index]['postAuthor'],
                                  postPublicationDate: testPostData[index]
                                      ['postPublicationDate'],
                                  votePPL1: testPostData[index]['votePPL1'],
                                  votePPL2: testPostData[index]['votePPL2'],
                                  voteProcent1: testPostData[index]
                                      ['voteProcent1'],
                                  voteProcent2: testPostData[index]
                                      ['voteProcent2'],
                                  voteAnswer1: testPostData[index]
                                      ['voteAnswer1'],
                                  voteAnswer2: testPostData[index]
                                      ['voteAnswer2'],
                                  votetitle: testPostData[index]['votetitle'],
                                  pplShow: testPostData[index]['pplShow'],
                                  pplSaved: testPostData[index]['pplSaved'],
                                  pplLike: testPostData[index]['pplLike'],
                                  pplCommented: testPostData[index]['pplCommented'],
                                );
                              }),
                        ),
                      )
                    : dropdownvalue == 'Регион '
                        ? const Center(child: Text('Регион '))
                        : const Center(child: Text('Город ')),
                SingleChildScrollView(
                  child: Container(
                    color: ColorStyles.neutralsPageBackgroundColor,
                    child: ListView.builder(
                        itemCount: testPostData.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return PostWidget(
                            hasImg: testPostData[index]['hasImg'],
                            hasVote: testPostData[index]['hasVote'],
                            image: testPostData[index]['image'],
                            imageAuthor: testPostData[index]['imageAuthor'],
                            title: testPostData[index]['title'],
                            postAuthor: testPostData[index]['postAuthor'],
                            postPublicationDate: testPostData[index]['postPublicationDate'],
                            votePPL1: testPostData[index]['votePPL1'],
                            votePPL2: testPostData[index]['votePPL2'],
                            voteProcent1: testPostData[index]['voteProcent1'],
                            voteProcent2: testPostData[index]['voteProcent2'],
                            voteAnswer1: testPostData[index]['voteAnswer1'],
                            voteAnswer2: testPostData[index]['voteAnswer2'],
                            votetitle: testPostData[index]['votetitle'],
                            pplShow: testPostData[index]['pplShow'],
                            pplSaved: testPostData[index]['pplSaved'],
                            pplLike: testPostData[index]['pplLike'],
                            pplCommented: testPostData[index]['pplCommented'],
                          );
                        }),
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
