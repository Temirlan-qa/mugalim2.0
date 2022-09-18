part of 'book_bloc.dart';

@immutable
abstract class BookEvent {}

class BookLoad extends BookEvent {}

class BookVoteList extends BookEvent{
  final String semesterId;
  BookVoteList(this.semesterId);
}

class GetBookList extends BookEvent{
  final String id;
  GetBookList(this.id);
}

class PostVoteEvent extends BookEvent{
  final String voteId;
  final String resultOptionId;
  PostVoteEvent(this.voteId,this.resultOptionId);
}

class GetSemesterDeadline extends BookEvent{
  final int semester;
  GetSemesterDeadline(this.semester);
 }
class BookSemesterDeadlineList extends BookEvent{
  final String semesterId;
  BookSemesterDeadlineList(this.semesterId);
}