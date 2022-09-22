part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeLoad extends HomeEvent {}

class GetPostsList extends HomeEvent{
  final bool? loadingState;

  GetPostsList({this.loadingState});
}

class GetTrendingPostsList extends HomeEvent{
  final bool? loadingState;

  GetTrendingPostsList({this.loadingState});
}

class GetSavedPostsList extends HomeEvent{
  final bool? loadingState;

  GetSavedPostsList({this.loadingState});
}

class GetPostCommentList extends HomeEvent{
  final String parentId;
  final bool? loadingState;

  GetPostCommentList({required this.parentId, this.loadingState});
}

class GetPostByIdList extends HomeEvent{
  final String postId;

  GetPostByIdList(this.postId);
}
class LikePostStudents extends HomeEvent {
  final String id;
  final String likeType;
  LikePostStudents(this.id,this.likeType);
}

class SavedPostStudents extends HomeEvent {
  final String id;
  SavedPostStudents(this.id);
}
class DeletePostStudents extends HomeEvent {
  final String id;
  DeletePostStudents(this.id);
}























@immutable
abstract class ZhassulanEvent {}

class ZhassulanGoingToReadBook extends ZhassulanEvent {}

class ZhassulanGoingToCook extends ZhassulanEvent {}

class ZhassulanGoingToSleep extends ZhassulanEvent {}

class ZhassulanGoingToEat extends ZhassulanEvent {}
