part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeLoad extends HomeEvent {}

class GetPostsList extends HomeEvent{}
class GetPostByIdList extends HomeEvent{
  final String postId;

  GetPostByIdList(this.postId);
}
