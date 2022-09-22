
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:mugalim/logic/book/data/models/semester_model.dart';
import '../data/models/bookVotes_model.dart';
import '../data/models/book_list_model.dart';
import '../data/models/semesterDeadline_model.dart';
import '../data/models/semester_model.dart';
import '../data/models/voteList_model.dart';
import '../data/repositories/book_repository.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;
  BookBloc(this.bookRepository) : super(BookInitial()) {
    on<BookVoteList>((event, emit) async {
      emit(BookLoading());
      try {
        final List<BookVotesModel> list = await bookRepository.getVoteList();
        emit(VoteListSuccess(list));
      } catch (e) {
        emit(BookFailure(e.toString()));
      }
    });
    on<BookSemesterDeadlineList>((event, emit) async {
      emit(BookLoading());
      try {
        final SemesterModel list = await bookRepository.getSemesterDeadline(event.semesterId);
        emit(BookSemesterDeadlineSuccess(list));
      } catch (e) {
        emit(BookFailure(e.toString()));
      }
    });
    on<GetBookList>((event, emit) async {
      emit(BookLoading());
      try {
        final List<BookListModel> list = await bookRepository.getVoteById(event.id);
        emit(BookListSuccess(list));
      } catch (e) {
        emit(BookFailure(e.toString()));
      }
    });
    on<PostVoteEvent>((event, emit) async {
      emit(BookLoading());
      try {
        final Response response = await bookRepository.postVote(event.choiceList);
        emit(PostVoteSuccess());
      } catch (e) {
        emit(BookFailure(e.toString()));
      }
    });
    on<GetSemesterDeadline>((event, emit) async {
      emit(BookLoading());
      try{
        final SemesterModel deadlineModel = (await bookRepository.getSemesterDeadline2(event.semester));
        emit(SemesterDeadlineSuccess(deadlineModel));
      } catch(e) {
        emit(BookFailure(e.toString()));
      }
    });
    on<GetDeadline>((event, emit) async {
      emit(BookLoading());
      try{
        final SemesterDeadlineModel deadlineModel = (await bookRepository.getDeadline());
        emit(DeadlineSuccess(deadlineModel));
      } catch(e) {
        emit(BookFailure(e.toString()));
      }
    });
  }
}
