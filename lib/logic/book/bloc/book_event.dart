part of 'book_bloc.dart';

@immutable
abstract class BookEvent {}

class BookLoad extends BookEvent {}

class BookVoteList extends BookEvent{

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