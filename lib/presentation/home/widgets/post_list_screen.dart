// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugalim/core/const/const_color.dart';
import 'package:mugalim/core/const/sizedBox.dart';
import 'package:mugalim/core/const/text_style_const.dart';
import 'package:mugalim/core/injection_container.dart';
import 'package:mugalim/logic/home/bloc/home_bloc.dart';
import 'package:mugalim/logic/home/data/datasources/home_datasources.dart';
import 'package:mugalim/presentation/home/widgets/post_widget.dart';
import 'package:intl/intl.dart';

class PostListScreen extends StatefulWidget {
  final String fromPage;
  const PostListScreen({Key? key, required this.fromPage}) : super(key: key);

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  final HomeDatasource homeDatasource = sl();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                        index == 0 ? const SizedBox(height: 16,) : const SizedBox(),
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
                          fromPage: widget.fromPage,
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
                                      context.read<HomeBloc>().add(GetSavedPostsList(loadingState: false));
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
                                  Container(
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
                                  sizedBoxWidth8(),
                                  GestureDetector(
                                    onTap: () async {
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
                                      context.read<HomeBloc>().add(GetSavedPostsList(loadingState: false));
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
                        index == state.posts.length-1 ? const SizedBox(height: 16,) : const SizedBox(height: 8,),
                      ],
                    );
                  });
            }
            else if(state is HomeFailure){
              return const Text('ошибка');
            }
            else if(state is HomeLoading){
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: const [
                    SizedBox(height: 150,),
                    Center(child: CupertinoActivityIndicator())
                  ],
                ),
              );
            }
            return const Text(" ");
          },
        ),
      ),
    );
  }
}
