part of 'book_bloc.dart';

@immutable
abstract class BookState {}

class BookInitial extends BookState {

}
class BookLoading extends BookState {

}
class BookFailure extends BookState {
  final String message;

  BookFailure(this.message);
}


class VoteListSuccess extends BookState {
  final List<VoteListModel> votes;
  VoteListSuccess(this.votes);
}
class BookListSuccess extends BookState {
  final List<BookListModel> votes;

  BookListSuccess(this.votes);
}
class PostVoteSuccess extends BookState {}
class BookSemesterDeadlineSuccess extends BookState{
  final List<SemesterModel> list;
  BookSemesterDeadlineSuccess(this.list);
}
class SemesterDeadlineSuccess extends BookState {
  final SemesterModel deadlineModel;

  SemesterDeadlineSuccess(this.deadlineModel);
}