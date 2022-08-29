// import 'package:flutter/cupertino.dart';
import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import 'package:mugalim/presentation/home/widgets/post_widget.dart';
import 'package:mugalim/presentation/home/widgets/search_widget.dart';
import '../../../core/const/const_color.dart';
import '../../../core/widgets/textform_widget.dart';
import '../../../logic/home/bloc/home_bloc.dart';

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
      'hasVote': true,
      'votePPL1': 45,
      'votePPL2': 70,
      'voteProcent1': 90,
      'voteProcent2': 10,
      'voteAnswer1': 'Да, пойду truyytyit guyvuiiio ihihuig78tf',
      'voteAnswer2': 'Нет, не пойду',
      'votetitle': 'Пойдете ли в горы вместе с группой?',
      'pplShow': 1111,
      'pplSaved': 21111,
      'pplLike': 311499,
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
      'voteAnswer1': 'Да, пойду wetetgweewtwtewtgw wettegeggesgesw rehhrhhrreher',
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

  bool run = true;

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
              leadingWidth: !search ? 30 : 50,
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
                !search ?const SizedBox(width: 24,) : const Offstage(),
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
                !search?const SizedBox(width: 16,) : const Offstage(),
              ],
              centerTitle: true,
              titleSpacing: 0,
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
                  : Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: SearchWidget(hintText: '123'),
                  ),
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
                          child: BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                            if(state is PostListSuccess){
                              return ListView.builder(
                                  itemCount: state.posts.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        index == 0 ? SizedBox(height: 16,) : SizedBox(),
                                        PostWidget(
                                            viewNumber : state.posts[index].viewNumber,
                                            savedNumber : state.posts[index].savedNumber,
                                            saved :state.posts[index].saved,
                                            commentNumber : state.posts[index].commentNumber,
                                            likeNumber: state.posts[index].likeNumber,
                                            createdAt: state.posts[index].createdAt,
                                            title: state.posts[index].title,
                                            id : state.posts[index].id,
                                            content: state.posts[index].content,
                                            liked: state.posts[index].liked,
                                            cityId: state.posts[index].cityId,
                                            commeted: state.posts[index].commeted,
                                            imgs: state.posts[index].imgs,
                                            regionId : state.posts[index].regionId,
                                            type: state.posts[index].type,
                                            userId: state.posts[index].userId,
                                            updatedAt : state.posts[index].updatedAt
                                        ),
                                        index == testPostData.length-1 ? SizedBox(height: 16,) : SizedBox(height: 8,),
                                      ],
                                    );
                                  });
                            }
                            else if(state is HomeFailure){
                              print('oshibka');
                              return Text('ошибка');
                            }
                            else if(state is HomeLoading){
                              print('loading');
                              return Text('loading');
                            }
                            return Text("Post don't loaded");
                            },
                          ),
                        ),
                      )
                    : dropdownvalue == 'Регион '
                        ? const Center(child: Text('Регион '))
                        : const Center(child: Text('Город ')),
                SingleChildScrollView(
                  child: Container(
                    color: ColorStyles.neutralsPageBackgroundColor,
                    child: ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              index == 0 ? SizedBox(height: 16,) : SizedBox(),
                              Text('Trend'),
                              index == testPostData.length-1 ? SizedBox(height: 16,) : SizedBox(height: 8,),
                            ],
                          );
                        }),
                  ),
                ),
                Center(child: AnimatedDrawing.svg(
                  "assets/icons/check-circle.svg",
                  run: run,
                  duration: const Duration(milliseconds: 1000),
                  lineAnimation: LineAnimation.allAtOnce,
                  animationCurve: Curves.fastOutSlowIn,
                  animationOrder: PathOrders.leftToRight,
                  onFinish: () => setState(() {
                    run  = false;
                  }),
                  width: 100,
                  height: 100,
                )),
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
