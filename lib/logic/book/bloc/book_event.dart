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
  final List<Map<String, String>> choiceList;
  PostVoteEvent(this.choiceList);
}

class GetSemesterDeadline extends BookEvent{
  final String semester;
  GetSemesterDeadline(this.semester);
 }
class BookSemesterDeadlineList extends BookEvent{
  final String semesterId;
  BookSemesterDeadlineList(this.semesterId);
}

class GetDeadline extends BookEvent {}