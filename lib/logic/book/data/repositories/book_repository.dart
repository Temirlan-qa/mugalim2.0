import 'package:dio/dio.dart';
import 'package:mugalim/logic/book/data/models/semesterDeadline_model.dart';
import '../datasources/book_datasources.dart';
import '../models/bookVotes_model.dart';
import '../models/book_list_model.dart';
import '../models/readBookList_model.dart';
import '../models/readBooks_model.dart';



abstract class BookRepository {
  Future<List<BookListModel>> getVoteById(String id);
  Future<List<BookVotesModel>> getVoteList();
  Future<SemesterDeadlineModel> getDeadline();
  Future<Response> postVote(List<Map<String, String>> choiceList);
  Future<List<BookListModel>> getMyChoiceList();
  Future<List<ReadBookListModel>> getMyReadBookList();
  Future<List<ReadBooksModel>> getReadBooksList();
  Future<Response> reviewPost(String bookId, String review, int rating);
}

class BookRepositoryImpl extends BookRepository {

  final BookDatasource homeDatasource;

  BookRepositoryImpl(this.homeDatasource);

  @override
  Future<List<BookListModel>> getVoteById(String id) async {
    Response response = await homeDatasource.getVoteById(id);

    return (response.data['options'] as List).map((data) => BookListModel.fromJson(data)).toList();
  }
  //VoteListModel
  @override
  Future<List<BookVotesModel>> getVoteList() async {
    Response response = await homeDatasource.getVoteList();
    return (response.data['votes'] as List).map((data) => BookVotesModel.fromJson(data)).toList();
  }
  @override
  Future<SemesterDeadlineModel> getDeadline() async {
    Response response = await homeDatasource.getDeadlineSemester();
    return SemesterDeadlineModel.fromJson(response.data);
  }
  @override
  Future<Response> postVote(List<Map<String, String>> choiceList) async {
    Response response = await homeDatasource.postVote(choiceList);
    return response;
  }
  @override
  Future<List<BookListModel>> getMyChoiceList() async {
    Response response = await homeDatasource.getMyChoiceList();
    return (response.data as List).map((data) => BookListModel.fromJson(data)).toList();
  }
  @override
  Future<List<ReadBookListModel>> getMyReadBookList() async {
    Response response = await homeDatasource.getMyReadBookList();
    return (response.data as List).map((data) => ReadBookListModel.fromJson(data)).toList();
  }
  @override
  Future<List<ReadBooksModel>> getReadBooksList() async {
    Response response = await homeDatasource.getReadBooks();
    return (response.data as List).map((data) => ReadBooksModel.fromJson(data)).toList();
  }

  @override
  Future<Response> reviewPost(String bookId, String review, int rating) async {
    Response response = await homeDatasource.reviewPost(bookId, review, rating);
    return response;
  }
}