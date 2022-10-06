import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mugalim/logic/book/data/models/readBooks_model.dart';
import 'package:mugalim/logic/book/data/models/semester_model.dart';
import '../data/models/bookVotes_model.dart';
import '../data/models/book_list_model.dart';
import '../data/models/readBookList_model.dart';
import '../data/models/semesterDeadline_model.dart';
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
        if (kDebugMode) {
          print(response);
        }
        emit(PostVoteSuccess());
      } catch (e) {
        emit(BookFailure(e.toString()));
      }
    });
    on<GetDeadline>((event, emit) async {
      emit(BookLoading());
      try{
        final SemesterDeadlineModel deadlineModel = (await bookRepository.getDeadline());
        final List<BookVotesModel> list = (await bookRepository.getVoteList());
        emit(DeadlineSuccess(deadlineModel,list));
      } catch(e) {
        emit(BookFailure(e.toString()));
      }
    });
    on<GetMyChoice>((event, emit) async {
      emit(BookLoading());
      try{
        final List<BookListModel> list = await bookRepository.getMyChoiceList();
        emit(MyChoiceSuccess(list));
      } catch(e) {
        emit(BookFailure(e.toString()));
      }
    });
    on<GetMyReadBookList>((event, emit) async {
      emit(BookLoading());
      try {
        final List<ReadBookListModel> list = await bookRepository.getMyReadBookList();
        emit(MyReadBookListSuccess(list));
        }catch(e) {
        emit(BookFailure(e.toString()));
      }
     });
    on<GetReadBooks>((event, emit) async {
      emit(BookLoading());
      try{
        final List<ReadBooksModel> list = await bookRepository.getReadBooksList();
        emit(ReadBookListSuccess(list));
      } catch(e) {
        emit(BookFailure(e.toString()));
      }
    });
  }
}
