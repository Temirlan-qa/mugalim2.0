// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/presentation/home/widgets/post_widget.dart';
import '../../../core/const/const_color.dart';
import '../../../core/widgets/textform_widget.dart';

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

  // Initial Selected Value
  String dropdownvalue = 'Новости ';
  List<Map<String, dynamic>> testPostData = [
    {
      'hasImg': false,
      'image': 'assets/images/space.png',
      'imageAuthor': 'assets/icons/mugalim_logo.png',
      'title':
          'Post 1 lalalalaallalalldldlojfndjibefhbfjewlfkbfjibefjbkfwjfbkjwfbkjfbkjwfebkjfbkjfewbkfjbkf длпкпдлукпдпдупдлукт длтукдлтпдлуптдукпдлукпт длтупдлтудлкптукдлптукдлптудк пддлукт дтпд лтукпдлу  длтпдлкутпдлкутпдлукп ',
      'postAuthor': 'Mugalim Global',
      'postPublicationDate': '2 авг в 13:54',
      'hasVote': false,
      'votePPL1': 45,
      'votePPL2': 70,
      'voteProcent1': 90,
      'voteProcent2': 10,
      'voteAnswer1': 'Да, пойду',
      'voteAnswer2': 'Нет, не пойду',
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
      'voteAnswer1': 'Да, пойду',
      'voteAnswer2': 'Нет, не пойду',
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
      'voteAnswer1': 'Да, пойду',
      'voteAnswer2': 'Нет, не пойду',
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
      'voteAnswer1': 'Да, пойду',
      'voteAnswer2': 'Нет, не пойду',
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
      'voteAnswer1': 'Да, пойду',
      'voteAnswer2': 'Нет, не пойду',
      'votetitle': 'Пойдете ли вы в Kokshetau вместе с группой?',
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
      'voteAnswer1': 'Да, пойду',
      'voteAnswer2': 'Нет, не пойду',
      'votetitle': 'Пойдете ли в горы вместе с группой?',
      'pplShow': 9,
      'pplSaved': 9,
      'pplLike': 9,
      'pplCommented': 9,
    },
  ];

  // List of items in our dropdown menu
  var items = [
    'Новости',
    'Регион',
    'Город',
  ];
  bool search = false;
  TextEditingController searchEditingController = TextEditingController();
  bool buttonDown = false;
  int tabIndex = 0;
  int dropDownindex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                  : Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            search = !search;
                          });
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: ColorStyles.primaryBorderColor,
                        ),
                      ),
                  ),
              leadingWidth: !search ? 30 : 30,
              actions: <Widget>[
                Visibility(
                  visible: !search,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        search = !search;
                      });
                    },
                    child: !search
                        ? SvgPicture.asset('assets/icons/search.svg',width: 21,height: 21,)
                        : const SizedBox(),
                  ),
                ),
                !search ?const SizedBox(width: 24,) : const SizedBox(),
                Visibility(
                  visible: !search,
                  child: GestureDetector(
                      onTap: () {

                  },
                  child: SvgPicture.asset(
                    'assets/icons/bell.svg',
                    color: ColorStyles.primaryBorderColor,
                    height: 23.33,
                    width: 21,
                    )
                  ),
                ),
                !search?const SizedBox(width: 16,) : const SizedBox(),
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
                  : TextFormFieldWidget(controller: searchEditingController,),
              elevation: 0,
              bottom: TabBar(
                // ↓ labelPadding Сохраненные ны толык корсету ушин
                //labelPadding: EdgeInsets.all(0),
                labelColor: ColorStyles.primaryBorderColor,
                unselectedLabelColor: ColorStyles.primarySurfaceHoverColor,
                indicatorColor: ColorStyles.primaryBorderColor,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                      color: ColorStyles.primaryBorderColor, width: 2),
                  insets: const EdgeInsets.symmetric(horizontal: 16),
                ),
                onTap: (index){
                  setState((){
                    dropDownindex = index;
                    if(dropDownindex == 1 || dropDownindex == 2) {
                      buttonDown = false;
                    }
                  });
                },
                isScrollable: true,
                tabs: [
                  SizedBox(
                    width: width/3-40,
                    child: Tab(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            'Новости',
                            style: TextStyles.mediumStyle.copyWith(
                              fontSize: 16,
                              color: dropDownindex == 0 ? Colors.black : ColorStyles.primarySurfaceHoverColor,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                buttonDown = !buttonDown;
                              });
                            },
                            child: Visibility(
                              visible: dropDownindex == 0,
                              child: Icon(
                                buttonDown ? Icons.keyboard_arrow_up :Icons.keyboard_arrow_down,
                                //Icons.keyboard_arrow_up,
                                size: 16,
                                color: ColorStyles.primaryBorderColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width/3-40,
                    child: Tab(
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        'Тренды',
                        style: TextStyles.mediumStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width/3-20,
                    child: Tab(
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        'Сохраненныe',
                        style: TextStyles.mediumStyle.copyWith(
                          fontSize: 16,
                        ),
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
                                  pplCommented: testPostData[index]
                                      ['pplCommented'],
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
                            postPublicationDate: testPostData[index]
                                ['postPublicationDate'],
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
          Visibility(
              visible: buttonDown,
              child: Positioned(
                top: 110 + MediaQuery.of(context).padding.top,
                left: 15,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 5),
                  curve: Curves.easeInQuint,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.16),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  height: 110,
                  width: 110,
                  padding: const EdgeInsets.only(
                    top: 12,
                    bottom: 12,
                    left: 16
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            buttonDown = false;
                            dropdownvalue = 'Новости ';
                          });
                        },
                        child: Text(
                          'Общие',
                          style: TextStyles.mediumStyle.copyWith(
                            fontSize: 13,
                            color: const Color(0xFF1A1A1A),
                            height: 1.2,
                          ),
                        ),
                      ),
                      sizedBoxHeight16(),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            buttonDown = false;
                            dropdownvalue = 'Регион ';
                          });
                        },
                        child: Text(
                          'Мой регион',
                          style: TextStyles.mediumStyle.copyWith(
                            fontSize: 13,
                            color: const Color(0xFF1A1A1A),
                            height: 1.2,
                          ),
                        ),
                      ),
                      sizedBoxHeight16(),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            buttonDown = false;
                            dropdownvalue = 'Город ';
                          });
                        },
                        child: Text(
                          'Мой город',
                          style: TextStyles.mediumStyle.copyWith(
                            fontSize: 13,
                            color: const Color(0xFF1A1A1A),
                            height: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
