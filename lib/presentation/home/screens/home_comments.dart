import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/routes/environment_config.dart';
import 'package:mugalim/core/widgets/line_widget.dart';
import 'package:mugalim/core/const/sizedBox.dart';
import 'package:mugalim/presentation/home/widgets/post_actions_row_widget.dart';
import 'package:mugalim/presentation/home/widgets/vote_widget.dart';
import 'package:dio/src/response.dart';
import 'package:mugalim/core/const/SizedBox.dart';
import "package:intl/intl.dart";
import 'package:mugalim/logic/home/data/models/post_comment.dart';
import 'package:mugalim/presentation/profile/widgets/text_field_for_edit_info_user_widget.dart';


import '../../../core/injection_container.dart';
import '../../../logic/home/bloc/home_bloc.dart';
import '../../../logic/home/data/datasources/home_datasources.dart';

class HomeCommentsPage extends StatefulWidget {
  // post data
  final String postAuthor;
  final String postPublicationDate;

  final String title;
  final String? imageAuthor;

  // All info about image
  final List<String?>? images;
  final bloc;
  // All info about Vote
  final bool liked;
  final bool saved;
  final String votetitle;
  final String voteAnswer1;
  final String voteAnswer2;
  final int votePPL1;
  final int votePPL2;
  final int voteProcent1;
  final int voteProcent2;

  // Like Save Comments Show
  final int pplShow;
  final int pplLike;
  final int pplCommented;
  final int pplSaved;
  final String id;

  const HomeCommentsPage({
    Key? key,
    required this.title,
    required this.postPublicationDate,
    required this.postAuthor,
    required this.imageAuthor,

    // All info about image
    required this.images,

    // All info about Vote
    required this.voteAnswer1,
    required this.voteAnswer2,
    required this.votePPL1,
    required this.votePPL2,
    required this.voteProcent1,
    required this.voteProcent2,
    required this.votetitle,

    //
    required this.pplCommented,
    required this.pplLike,
    required this.pplShow,
    required this.pplSaved, required this.id, required this.liked, required this.saved, required this.bloc,
  }) : super(key: key);

  @override
  State<HomeCommentsPage> createState() => _HomeCommentsPageState();
}

class _HomeCommentsPageState extends State<HomeCommentsPage> {
  String str =
      'Нельзя без последствий для здоровья изо дня в день проявлять себя противно тому, что чувствуешь; распинаться перед тем, чего не любишь, радоваться тому, что приносит несчастье. Наша нервная систем...';

  String str1 =
      "That's a fantastic new app feature.You and your\nteam did an excellent job of incorporating user\ntesting feedback.";
  bool isExpanded = false;

  final HomeDatasource homeDatasource = sl();

  late bool isLiked;
  late bool isSaved;
  late int likedNumber;
  late int savedNumber;

  Box tokensBox = Hive.box('tokens');

  CarouselController carouselController = CarouselController();
  int currentImage = 0;
  bool isCommentLoading = false;

  TextEditingController commentController = TextEditingController();
  bool commentValidate = true;

  List<PostCommentModel> comments = [];

  Map<String, bool> commentShowMap = {};

  @override
  void initState() {
    isLiked = widget.liked;
    isSaved = widget.saved;
    likedNumber = widget.pplLike;
    savedNumber = widget.pplSaved;
    super.initState();
  }

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
            icon: SvgPicture.asset(
              'assets/icons/ios_share.svg', width: 18.67, height: 23.33,),
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            top: 16,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: widget.imageAuthor != null
                                            ? CachedNetworkImage(
                                          imageUrl: '${EnvironmentConfig
                                              .url}/file/image/${widget
                                              .imageAuthor}?size=sm',
                                          width: 44,
                                          height: 44,
                                          fit: BoxFit.cover,
                                          httpHeaders: {
                                            'Content-Type': 'application/json',
                                            'Accept': 'application/json',
                                            "Authorization": "Bearer ${tokensBox
                                                .get('access')}"
                                          },
                                          placeholder: (context,
                                              url) => const CupertinoActivityIndicator(),

                                        )
                                            : Image.asset(
                                            'assets/icons/mugalim_logo.png',
                                            width: 44, height: 44)
                                    ),
                                    sizedBoxWidth16(),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.postAuthor,
                                          style: TextStyles.mediumStyle.copyWith(
                                            color: const Color(0xFF1A1A1A),
                                            fontSize: 14,
                                            height: 1.4,
                                          ),
                                        ),
                                        Text(
                                          widget.postPublicationDate,
                                          style: TextStyles.regularStyle.copyWith(
                                            color: const Color(0xff767676),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () async {
                                        setState(() {

                                        });
                                      },
                                      icon: const Icon(
                                        Icons.more_horiz,
                                        size: 28,
                                        color: Color(0xFF767676),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              sizedBoxHeight16(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    widget.title,
                                    style: TextStyles.regularStyle.copyWith(
                                      color: const Color(0xFF1A1A1A),
                                    ),
                                    maxLines: isExpanded ? 11 : 4,
                                    softWrap: true,
                                    // overflow: TextOverflow.fade,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: widget.title.length < 197
                                    ? const SizedBox()
                                    : InkWell(
                                  onTap: () {
                                    setState(() {
                                      isExpanded = !isExpanded;
                                    });
                                  },
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      isExpanded == false
                                          ? 'Показать полностью...'
                                          : 'Show less',
                                      style: TextStyles.mediumStyle.copyWith(
                                        fontSize: 14,
                                        color: const Color(0xff3D3DD8),
                                      ),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ),
                              sizedBoxHeight8(),
                              Visibility(
                                visible: widget.images!.isNotEmpty ? true : false,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        widget.images!.isNotEmpty
                                            ? CarouselSlider(
                                          carouselController: carouselController,
                                          options: CarouselOptions(
                                            height: 210.0,
                                            enableInfiniteScroll: false,
                                            onPageChanged: (index, reason) {
                                              setState(() {
                                                currentImage = index;
                                              });
                                            },
                                            enlargeCenterPage: true,
                                          ),
                                          items: widget.images!.map((i) {
                                            return CachedNetworkImage(
                                              imageUrl: '${EnvironmentConfig
                                                  .url}/file/image/$i',
                                              height: 210,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              fit: BoxFit.fitHeight,
                                              httpHeaders: {
                                                'Content-Type': 'application/json',
                                                'Accept': 'application/json',
                                                "Authorization": "Bearer ${tokensBox
                                                    .get('access')}"
                                              },
                                              placeholder: (context,
                                                  url) => const CupertinoActivityIndicator(),
                                            );
                                          }).toList(),
                                        )
                                            : const Offstage(),
                                        sizedBoxHeight8(),
                                        LineWidget(width: MediaQuery
                                            .of(context)
                                            .size
                                            .width - 32),
                                        sizedBoxHeight8(),
                                      ],
                                    ),
                                    Positioned(
                                      bottom: 24,
                                      child: Container(
                                        width: 16 + widget.images!.length * 8 - 4,
                                        height: 20,
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                4),
                                            color: Colors.white
                                        ),
                                        child: ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            // physics: NeverScrollableScrollPhysics(),
                                            // shrinkWrap: true,
                                            itemBuilder: (context, index) =>
                                                Container(
                                                  height: 4,
                                                  width: 4,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(4),
                                                      color: currentImage == index
                                                          ? ColorStyles
                                                          .primaryBorderColor
                                                          : ColorStyles
                                                          .primarySurfaceHoverColor
                                                  ),
                                                ),
                                            separatorBuilder: (context, index) =>
                                            const SizedBox(width: 4),
                                            itemCount: widget.images!.length
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // sizedBoxHeight8(),
                              // Column(
                              //   children: [
                              //     VoteWidget(
                              //       votetitle: widget.votetitle,
                              //       voteAnswer1: widget.voteAnswer1,
                              //       voteAnswer2: widget.voteAnswer2,
                              //       voteProcent1: widget.voteProcent1,
                              //       voteProcent2: widget.voteProcent2,
                              //       votePPL1: widget.votePPL1,
                              //       votePPL2: widget.votePPL2,
                              //     ),
                              //     sizedBoxHeight8(),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            // top: 16,
                          ),
                          child: Column(
                            children: [
                              sizedBoxHeight8(),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          setState(() {
                                            isLiked = !isLiked;
                                            isLiked
                                                ? likedNumber++
                                                : likedNumber--;
                                          });
                                          await homeDatasource.likedPost(
                                              widget.id, 'POSTLIKE');
                                          widget.bloc.add(GetPostsList());
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          // width: 60,
                                          // height: 28,
                                          decoration: BoxDecoration(
                                            color: isLiked
                                                ? const Color(0xFFE71D36)
                                                .withOpacity(0.1)
                                                : ColorStyles.primarySurfaceColor,
                                            borderRadius: BorderRadius.circular(
                                                24),
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: [
                                              isLiked
                                                  ? SvgPicture.asset(
                                                'assets/icons/redheart.svg',
                                                color: const Color(0xFFE71D36),
                                              )
                                                  : SvgPicture.asset(
                                                'assets/icons/heart.svg',
                                                color: ColorStyles
                                                    .primarySurfaceHoverColor,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                NumberFormat.compactCurrency(
                                                  decimalDigits: 0,
                                                  symbol: ' ',
                                                ).format(likedNumber),
                                                style: TextStyles.mediumStyle
                                                    .copyWith(
                                                  fontSize: 14,
                                                  color: isLiked
                                                      ? const Color(0xFFE71D36)
                                                      : ColorStyles
                                                      .primarySurfaceHoverColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      sizedBoxWidth8(),
                                      GestureDetector(
                                        onTap: () async {

                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          // width: 60,
                                          // height: 28,
                                          decoration: BoxDecoration(
                                            color: ColorStyles
                                                .primarySurfaceColor,
                                            borderRadius: BorderRadius.circular(
                                                24),
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/comment.svg',
                                                color: ColorStyles
                                                    .primarySurfaceHoverColor,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                NumberFormat.compactCurrency(
                                                  decimalDigits: 0,
                                                  symbol: ' ',
                                                ).format(widget.pplCommented),
                                                style: TextStyles.mediumStyle
                                                    .copyWith(
                                                  fontSize: 14,
                                                  color: ColorStyles
                                                      .primarySurfaceHoverColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      sizedBoxWidth8(),
                                      GestureDetector(
                                        onTap: () async {
                                          setState(() {
                                            isSaved = !isSaved;
                                            isSaved
                                                ? savedNumber++
                                                : savedNumber--;
                                          });
                                          widget.saved
                                              ? (await homeDatasource.deletePost(
                                              widget.id))
                                              : (await homeDatasource.savedPost(
                                              widget.id));
                                          await widget.bloc.add(GetPostsList());
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          // width: 60,
                                          // height: 28,
                                          decoration: BoxDecoration(
                                            color: isSaved
                                                ? const Color(0xFFFFB800)
                                                .withOpacity(0.1)
                                                : ColorStyles.primarySurfaceColor,
                                            borderRadius: BorderRadius.circular(
                                                24),
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: [
                                              isSaved
                                                  ? SvgPicture.asset(
                                                'assets/icons/sharesave.svg',
                                                color: const Color(0xFFFFB800),
                                              )
                                                  : SvgPicture.asset(
                                                'assets/icons/share.svg',
                                                color: ColorStyles
                                                    .primarySurfaceHoverColor,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                NumberFormat.compactCurrency(
                                                  decimalDigits: 0,
                                                  symbol: ' ',
                                                ).format(savedNumber),
                                                style: TextStyles.mediumStyle
                                                    .copyWith(
                                                  fontSize: 14,
                                                  color: isSaved
                                                      ? const Color(0xFFFFB800)
                                                      : ColorStyles
                                                      .primarySurfaceHoverColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye_sharp,
                                            size: 16,
                                            color: ColorStyles
                                                .primarySurfaceHoverColor,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            NumberFormat.compactCurrency(
                                              decimalDigits: 0,
                                              symbol: ' ',
                                            ).format(widget.pplShow),
                                            style: TextStyles.mediumStyle
                                                .copyWith(
                                              fontSize: 14,
                                              color: ColorStyles
                                                  .primarySurfaceHoverColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  sizedBoxHeight16(),
                                ],
                              ),
                              sizedBoxHeight16(),
                              LineWidget(width: MediaQuery
                                  .of(context)
                                  .size
                                  .width - 32),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedBoxHeight8(),
                  BlocConsumer<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is PostCommentListSuccess) {
                        return ListView.builder(
                          itemCount: comments.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            DateTime now = DateTime.parse(
                                comments[index].createdAt!);
                            String formattedDate = DateFormat('d MMM в hh:mm')
                                .format(now);
                            return Container(
                              padding: EdgeInsets.only(
                                left: 16,
                                right: 16,
                                top: index == 0 ? 16 : 0,
                                bottom: index == comments.length - 1 ? 16 : 0
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: comments[index].relativeId != null ? 48.0 : 0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: comments[index].userAvatarId != null
                                                ? CachedNetworkImage(
                                              imageUrl: '${EnvironmentConfig
                                                  .url}/file/image/${comments[index].userAvatarId}?size=sm',
                                              width: 44,
                                              height: 44,
                                              fit: BoxFit.cover,
                                              httpHeaders: {
                                                'Content-Type': 'application/json',
                                                'Accept': 'application/json',
                                                "Authorization": "Bearer ${tokensBox
                                                    .get('access')}"
                                              },
                                              placeholder: (context,
                                                  url) => const CupertinoActivityIndicator(),

                                            )
                                                : Image.asset(
                                                'assets/icons/mugalim_logo.png',
                                                width: 44, height: 44)
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              comments[index].userName ?? " ",
                                              style: const TextStyle(
                                                fontSize: 14,
                                                decoration: TextDecoration.none,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'CeraPro',
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width - 92 - (comments[index].relativeId != null ? 48.0 : 0),
                                              child: Text(
                                                comments[index].content ?? "",
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  decoration: TextDecoration.none,
                                                  color: Colors.black,
                                                  fontFamily: 'CeraPro',
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width - 84 - (comments[index].relativeId != null ? 48.0 : 0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    formattedDate,
                                                    style: const TextStyle(
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
                                                  Spacer(),
                                                  InkWell(
                                                    onTap: () async{
                                                      await homeDatasource.likedPost(comments[index].id!, 'COMMENTLIKE');
                                                      context.read<HomeBloc>().add(GetPostCommentList(parentId: widget.id, loadingState: false));
                                                    },
                                                    child: Row(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: [
                                                        Icon(
                                                          comments[index].liked!
                                                              ? Icons.favorite
                                                              : Icons.favorite_border,
                                                          color: comments[index].liked!
                                                              ? Color(0xFFE71D36)
                                                              : ColorStyles.primarySurfaceHoverColor,
                                                          size: 16,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          comments[index].likeNumber.toString(),
                                                          style: TextStyle(
                                                            color: comments[index].liked!
                                                                ? Color(0xFFE71D36)
                                                                : ColorStyles.primarySurfaceHoverColor,
                                                            fontFamily: 'Cera Pro',
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8)
                                                ],
                                              ),
                                            ),
                                            comments[index].commentNumber! > 0 ? GestureDetector(
                                              onTap: () async {
                                                if(!commentShowMap.containsKey(comments[index].id!)) {
                                                  try {
                                                    Response response = await homeDatasource.getPostComment(comments[index].id!);
                                                    print(response.data['content']);
                                                    setState(() {
                                                      comments.insertAll(index + 1, (response.data['content'] as List).map((data) => PostCommentModel.fromJson(data)).toList());
                                                      commentShowMap[comments[index].id!] = true;
                                                    });
                                                  } catch (e) {

                                                  }
                                                }
                                              },
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 1,
                                                    width: 40,
                                                    color: ColorStyles.neutralsTextPrimaryDisabledColor,
                                                  ),
                                                  SizedBox(width: 8),
                                                  Text(
                                                    "Показать ответы",
                                                    style: TextStyles.voteStyle.copyWith(
                                                      color: ColorStyles.primaryBorderColor
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ) : Offstage(),
                                            comments[index].commentNumber! > 0 ? SizedBox(height: 16) : Offstage()
                                          ],
                                        ),
                                      ],
                                    ),
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
                        );
                      }
                      else if (state is HomeFailure) {
                        print(state);
                        return const Text('ошибка');
                      }
                      else if (state is HomeLoading) {
                        return const Text('loading');
                      }
                      return const Text('...');
                    },
                    listener: (context, state) async {
                      if(state is PostCommentListSuccess) {
                        comments.clear();
                        commentShowMap.clear();
                        setState(() {
                          comments.addAll(state.comments);
                        });
                      }
                    },
                  ),
                  SizedBox(height: 148)
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 76,
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        commentValidate = true;
                      });
                    },
                    style: TextStyles.mediumStyle
                        .copyWith(
                        fontSize: 16, color: ColorStyles.neutralsTextPrimaryColor),
                    controller: commentController,
                    decoration: InputDecoration(
                      counterText: "",
                      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: commentValidate
                              ? ColorStyles.primarySurfaceHoverColor
                              : ColorStyles.errorBorderColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: commentValidate
                            ? ColorStyles.primarySurfaceHoverColor
                            : ColorStyles.errorBorderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: commentValidate
                              ? ColorStyles.primarySurfaceHoverColor
                              : ColorStyles.errorBorderColor,
                        ),
                      ),
                      hintText: 'Ваш комментарий',
                      hintStyle: TextStyles.mediumStyle.copyWith(
                        fontSize: 16,
                        color: ColorStyles.primarySurfaceHoverColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    if(commentController.text.isNotEmpty) {
                      setState(() {
                        isCommentLoading = true;
                      });
                      try {
                        await homeDatasource.createPostComment(widget.id, commentController.text);
                        context.read<HomeBloc>().add(GetPostCommentList(parentId: widget.id, loadingState: false));
                        widget.bloc.add(GetPostsList());
                        setState(() {
                          commentController.text = "";
                        });
                      } on DioError catch (e) {
                        print(e);
                      }
                      setState(() {
                        isCommentLoading = false;
                      });
                    } else {
                      setState(() {
                        commentValidate = false;
                      });
                    }
                  },
                  child: Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorStyles.primaryBorderColor
                    ),
                    child: !isCommentLoading
                        ? const Icon(Icons.arrow_upward_rounded, color: Colors.white, size: 20)
                        : CupertinoActivityIndicator(color: Colors.white, radius: 8,)
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
