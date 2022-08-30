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
class LikeSuccess extends HomeState {}
