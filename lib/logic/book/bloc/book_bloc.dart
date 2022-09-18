
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:mugalim/logic/book/data/models/semester_model.dart';
import '../data/models/book_list_model.dart';
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
        final List<VoteListModel> list = await bookRepository.getVoteList();

        emit(VoteListSuccess(list));
      } catch (e) {
        emit(BookFailure(e.toString()));
      }
    });
    on<BookSemesterDeadlineList>((event, emit) async {
      emit(BookLoading());
      try {
        final List<SemesterModel> list = await bookRepository.getSemesterDeadline(event.semesterId);
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
        final Response response = await bookRepository.postVote(event.voteId,event.resultOptionId);
        emit(PostVoteSuccess());
      } catch (e) {
        emit(BookFailure(e.toString()));
      }
    });
  }
}
