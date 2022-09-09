
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../data/models/post_by_id.dart';
import '../data/models/post_comment.dart';
import '../data/models/posts_model.dart';
import '../data/repositories/home_repositories.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final HomeRepository homeRepository;

  HomeBloc(this.homeRepository) : super(HomeInitial()) {
    on<GetPostsList>((event, emit) async {
      if(event.loadingState != null && event.loadingState!) {
        emit(HomeLoading());
      }
      try {
        final List<PostModel> list = await homeRepository.getPostsList();
        emit(PostListSuccess(list));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });
    on<GetPostCommentList>((event, emit) async {
      if(event.loadingState != null && event.loadingState!) {
        emit(HomeLoading());
      }
      try {
        final List<PostCommentModel> list = await homeRepository.getPostComment(event.parentId);
        emit(PostCommentListSuccess(list));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });
    on<GetPostByIdList>((event, emit) async {
      emit(HomeLoading());
      try {
        final List<PostByIdModel> list = await homeRepository.getPosts(event.postId);
        emit(PostByIdListSuccess(list));
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });
    on<LikePostStudents>((event, emit) async {
      try {
        emit(HomeLoading());
        final Response response = await homeRepository.likedPost(event.id,event.likeType);

        emit(LikeSuccess());
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });
    on<SavedPostStudents>((event, emit) async {
      try {
        emit(HomeLoading());
        final Response response = await homeRepository.savedPost(event.id);
        emit(SavedSuccess());
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });
    on<DeletePostStudents>((event, emit) async {
      try {
        emit(HomeLoading());
        final Response response = await homeRepository.deletePost(event.id);
        emit(DeletedSuccess());
      } catch (e) {
        emit(HomeFailure(e.toString()));
      }
    });
  }
}