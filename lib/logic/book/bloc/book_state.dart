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
  final List<BookVotesModel> votes;
  VoteListSuccess(this.votes);
}
class BookListSuccess extends BookState {
  final List<BookListModel> votes;

  BookListSuccess(this.votes);
}
class PostVoteSuccess extends BookState {}
class BookSemesterDeadlineSuccess extends BookState{
  final SemesterModel list;
  BookSemesterDeadlineSuccess(this.list);
}
class SemesterDeadlineSuccess extends BookState {
  final SemesterModel deadlineModel;

  SemesterDeadlineSuccess(this.deadlineModel);
}

class DeadlineSuccess extends BookState {
  final SemesterDeadlineModel deadlineModel;
  final List<BookVotesModel> list;
  DeadlineSuccess(this.deadlineModel,this.list);
}

class MyChoiceSuccess extends BookState{
  final List<BookListModel> list;
  MyChoiceSuccess(this.list);
}