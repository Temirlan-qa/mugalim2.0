
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/const/sizedBox.dart';
import 'package:mugalim/presentation/home/widgets/post_widget.dart';
import 'package:mugalim/presentation/home/widgets/search_widget.dart';
import '../../../core/const/const_color.dart';
import '../../../core/injection_container.dart';
import '../../../logic/home/bloc/home_bloc.dart';
import '../../../logic/home/data/datasources/home_datasources.dart';
import 'home_comments.dart';

class HomeScreen extends StatefulWidget {
  final Bloc bloc;
  const HomeScreen({Key? key, required this.bloc}) : super(key: key);

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
  // List liked = [];
  // List likedCount = [];
  //
  // List saved = [];
  // List savedCount = [];

  int dropDownindex = 0;
  int votePPL1 = 45;
  int votePPL2 = 45;
  int voteProcent1 = 90;
  int voteProcent2 = 90;
  String voteAnswer1 = 'Да, пойду truyytyit guyvuiiio ihihuig78tf';
  String voteAnswer2 =  'Нет, не пойду';
  String votetitle =  'Пойдете ли в горы вместе с группой?';

  final HomeDatasource homeDatasource = sl();

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
                    width: width/3-30,
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
                    width: width/3-50,
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
                          child: BlocConsumer<HomeBloc, HomeState>(
                            listener: (context, state) {
                              // if(state is PostListSuccess) {
                              //   setState((){
                              //     liked = List.filled(
                              //         state.posts.length, false,
                              //         growable: true);
                              //     for (int i = 0; i <
                              //         state.posts.length; i++) {
                              //       liked[i] = state.posts[i].liked;
                              //     }
                              //     likedCount = List.filled(
                              //         state.posts.length, 0,
                              //         growable: true);
                              //     for (int i = 0; i <
                              //         state.posts.length; i++) {
                              //       likedCount[i] =
                              //           state.posts[i].likeNumber;
                              //     }
                              //
                              //     saved = List.filled(
                              //         state.posts.length, false,
                              //         growable: true);
                              //     for (int i = 0; i <
                              //         state.posts.length; i++) {
                              //       saved[i] = state.posts[i].saved;
                              //     }
                              //     savedCount = List.filled(
                              //         state.posts.length, 0,
                              //         growable: true);
                              //     for (int i = 0; i <
                              //         state.posts.length; i++) {
                              //       savedCount[i] =
                              //           state.posts[i].savedNumber;
                              //     }
                              //   });
                              // }
                            },
                          builder: (context, state) {
                            if(state is PostListSuccess){
                            return ListView.builder(
                                  itemCount: state.posts.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context2, index) {
                                    DateTime now = DateTime.parse(state.posts[index].createdAt!);
                                    String formattedDate = DateFormat('d MMM в hh:mm').format(now);
                                    return Column(
                                      children: [
                                        index == 0 ? SizedBox(height: 16,) : SizedBox(),
                                        PostWidget(
                                            viewNumber : state.posts[index].viewNumber ?? 0,
                                            savedNumber : state.posts[index].savedNumber ?? 0,
                                            saved : state.posts[index].saved ?? false,
                                            commentNumber : state.posts[index].commentNumber ?? 0,
                                            likeNumber: state.posts[index].likeNumber ?? 0,
                                            createdAt: formattedDate,
                                            id : state.posts[index].id ?? '',
                                            content: state.posts[index].content ?? '',
                                            liked: state.posts[index].liked ?? false,
                                            cityId: state.posts[index].cityId ?? '',
                                            commented: state.posts[index].commented ?? false,
                                            regionId : state.posts[index].regionId ?? '',
                                            type: state.posts[index].type ?? '',
                                            userId: state.posts[index].userId ?? '',
                                            updatedAt : state.posts[index].updatedAt ?? '',
                                            images: state.posts[index].images,
                                            index: index,
                                            fio: state.posts[index].userName ?? ' ',
                                            avatarId: state.posts[index].userAvatarId,
                                            bloc: context.read<HomeBloc>(),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                            left: 16,
                                            right: 16,
                                            // top: 16,
                                          ),
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () async {
                                                      print(state.posts[index].savedNumber);
                                                      // setState(()  {
                                                      //   liked[index] = !liked[index];
                                                      //   if(liked[index]) {
                                                      //     likedCount[index] += 1;
                                                      //   }
                                                      //   else {
                                                      //     likedCount[index] -= 1;
                                                      //   }
                                                      // });
                                                      await homeDatasource.likedPost(state.posts[index].id!,'POSTLIKE');
                                                      context.read<HomeBloc>().add(GetPostsList(loadingState: false));
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets.all(8),
                                                      // width: 60,
                                                      // height: 28,
                                                      decoration: BoxDecoration(
                                                        color: state.posts[index].liked!
                                                            ? const Color(0xFFE71D36).withOpacity(0.1)
                                                            : ColorStyles.primarySurfaceColor,
                                                        borderRadius: BorderRadius.circular(24),
                                                      ),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          state.posts[index].liked!
                                                              ? SvgPicture.asset(
                                                            'assets/icons/redheart.svg',
                                                            color: const Color(0xFFE71D36),
                                                          )
                                                              : SvgPicture.asset(
                                                            'assets/icons/heart.svg',
                                                            color: ColorStyles.primarySurfaceHoverColor,
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            NumberFormat.compactCurrency(
                                                              decimalDigits: 0,
                                                              symbol: ' ',
                                                            ).format(state.posts[index].likeNumber!),
                                                            style: TextStyles.mediumStyle.copyWith(
                                                              fontSize: 14,
                                                              color: state.posts[index].liked!
                                                                  ? const Color(0xFFE71D36)
                                                                  : ColorStyles.primarySurfaceHoverColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  sizedBoxWidth8(),
                                                  GestureDetector(
                                                    onTap: ()  async {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context2) =>
                                                              BlocProvider(
                                                                create: (context) => sl<HomeBloc>()..add(GetPostCommentList(parentId: state.posts[index].id!)),
                                                                child: HomeCommentsPage(
                                                                pplLike: state
                                                                    .posts[index]
                                                                    .likeNumber!,
                                                                pplCommented: state
                                                                    .posts[index]
                                                                    .commentNumber!,
                                                                pplSaved: state
                                                                    .posts[index]
                                                                    .savedNumber!,
                                                                pplShow: state
                                                                    .posts[index]
                                                                    .viewNumber!,
                                                                images: state.posts[index].images,
                                                                postPublicationDate: formattedDate,
                                                                votePPL1: votePPL1,
                                                                votePPL2: votePPL2,
                                                                voteProcent1: voteProcent1,
                                                                voteProcent2: voteProcent2,
                                                                voteAnswer1: voteAnswer1,
                                                                voteAnswer2: voteAnswer2,
                                                                votetitle: votetitle,
                                                                title: state
                                                                    .posts[index]
                                                                    .content!,
                                                                imageAuthor: state.posts[index].userAvatarId!,
                                                                postAuthor: state
                                                                    .posts[index]
                                                                    .userName ?? '',
                                                                id: state
                                                                    .posts[index]
                                                                    .id!,
                                                                saved: state
                                                                    .posts[index]
                                                                    .saved!,
                                                                liked: state
                                                                    .posts[index]
                                                                    .liked!,
                                                                bloc: context.read<HomeBloc>()
                                                              ),
                                                          ),
                                                        ),
                                                      );
                                                      // final HomeDatasource homeDatasource = sl();
                                                      // Response response = await homeDatasource.getPostComment('7173ec3c-8dd8-4c87-998f-3cd9778f4290');
                                                      // print(response);
                                                      // print(state.posts[index].userId!);
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets.all(8),
                                                      // width: 60,
                                                      // height: 28,
                                                      decoration: BoxDecoration(
                                                        color: ColorStyles.primarySurfaceColor,
                                                        borderRadius: BorderRadius.circular(24),
                                                      ),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          SvgPicture.asset(
                                                            'assets/icons/comment.svg',
                                                            color: ColorStyles.primarySurfaceHoverColor,
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            NumberFormat.compactCurrency(
                                                              decimalDigits: 0,
                                                              symbol: ' ',
                                                            ).format(state.posts[index].commentNumber!),
                                                            style: TextStyles.mediumStyle.copyWith(
                                                              fontSize: 14,
                                                              color: ColorStyles.primarySurfaceHoverColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  sizedBoxWidth8(),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      print(state.posts[index].savedNumber);
                                                      setState(()  {
                                                        // saved[index] = !saved[index];
                                                        // if(saved[index]) {
                                                        //   savedCount[index] += 1;
                                                        // }
                                                        // else {
                                                        //   savedCount[index] -= 1;
                                                        // }
                                                      });
                                                      state.posts[index].saved!
                                                          ? (await homeDatasource.deletePost(state.posts[index].id!))
                                                          : (await homeDatasource.savedPost(state.posts[index].id!));
                                                      context.read<HomeBloc>().add(GetPostsList(loadingState: false));
                                                      },
                                                    child: Container(
                                                      padding: const EdgeInsets.all(8),
                                                      // width: 60,
                                                      // height: 28,
                                                      decoration: BoxDecoration(
                                                        color: state.posts[index].saved!
                                                            ? const Color(0xFFFFB800).withOpacity(0.1)
                                                            : ColorStyles.primarySurfaceColor,
                                                        borderRadius: BorderRadius.circular(24),
                                                      ),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          state.posts[index].saved!
                                                              ? SvgPicture.asset(
                                                            'assets/icons/sharesave.svg',
                                                            color: const Color(0xFFFFB800),
                                                          )
                                                              : SvgPicture.asset(
                                                            'assets/icons/share.svg',
                                                            color: ColorStyles.primarySurfaceHoverColor,
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            NumberFormat.compactCurrency(
                                                              decimalDigits: 0,
                                                              symbol: ' ',
                                                            ).format(state.posts[index].savedNumber!),
                                                            style: TextStyles.mediumStyle.copyWith(
                                                              fontSize: 14,
                                                              color: state.posts[index].saved!
                                                                  ? const Color(0xFFFFB800)
                                                                  : ColorStyles.primarySurfaceHoverColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Icon(
                                                        Icons.remove_red_eye_sharp,
                                                        size: 16,
                                                        color: ColorStyles.primarySurfaceHoverColor,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        NumberFormat.compactCurrency(
                                                          decimalDigits: 0,
                                                          symbol: ' ',
                                                        ).format(state.posts[index].viewNumber!),
                                                        style: TextStyles.mediumStyle.copyWith(
                                                          fontSize: 14,
                                                          color: ColorStyles.primarySurfaceHoverColor,
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
                                        index == state.posts.length-1 ? SizedBox(height: 16,) : SizedBox(height: 8,),
                                      ],
                                    );
                                  });
                            }
                            else if(state is HomeFailure){
                              print('oshibka');
                              return Text('ошибка');
                            }
                            else if(state is HomeLoading){
                              return Container(
                                height: MediaQuery.of(context).size.height,
                                child: Column(
                                  children: [
                                    SizedBox(height: 150,),
                                    Center(child: CupertinoActivityIndicator())
                                  ],
                                ),
                              );
                            }
                            return Text(" ");
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
                              Text('Тренды'),
                              // index == state.posts.length-1 ? SizedBox(height: 16,) : SizedBox(height: 8,),
                            ],
                          );
                        }),
                  ),
                ),
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
                              Text('Сохраненные'),
                              // index == state.posts.length-1 ? SizedBox(height: 16,) : SizedBox(height: 8,),
                            ],
                          );
                        }),
                  ),
                ),
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
