part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeLoad extends HomeEvent {}

class GetPostsList extends HomeEvent{}

class GetPostCommentList extends HomeEvent{
  final String parentId;

  GetPostCommentList(this.parentId);
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
