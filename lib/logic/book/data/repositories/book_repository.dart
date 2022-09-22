import 'package:dio/dio.dart';
import 'package:mugalim/logic/book/data/models/semester_model.dart';

import '../datasources/book_datasources.dart';
import '../models/bookVotes_model.dart';
import '../models/book_list_model.dart';



abstract class BookRepository {
  Future<List<BookListModel>> getVoteById(String id);
  Future<List<BookVotesModel>> getVoteList();
  Future<List<SemesterModel>> getSemesterDeadline(String semester);
  Future<SemesterModel> getSemesterDeadline2(int semester);
  Future<Response> postVote(List<Map<String, String>> choiceList);
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
  Future<List<SemesterModel>> getSemesterDeadline(String semester) async {
    Response response = await homeDatasource.getDeadlineSemester(semester);
    return (response.data as List).map((data) => SemesterModel.fromJson(data)).toList();
  }
  @override
  Future<SemesterModel> getSemesterDeadline2(int semester) async {
    Response response = await homeDatasource.getDeadlineSemester2(semester);
    return SemesterModel.fromJson(response.data);
  }
  @override
  Future<Response> postVote(List<Map<String, String>> choiceList) async {
    Response response = await homeDatasource.postVote(choiceList);
    return response;
  }
}