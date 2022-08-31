part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeFailure extends HomeState {
  final String message;

  HomeFailure(this.message);
}
class PostListSuccess extends HomeState {
  final List<PostModel> posts;

  PostListSuccess(this.posts);
}

class PostByIdListSuccess extends HomeState {
  final List<PostByIdModel> posts;

  PostByIdListSuccess(this.posts);
}

class PostCommentListSuccess extends HomeState {
  final List<PostCommentModel> comments;

  PostCommentListSuccess(this.comments);
}
class LikeSuccess extends HomeState {}

class SavedSuccess extends HomeState {}

class DeletedSuccess extends HomeState {}
