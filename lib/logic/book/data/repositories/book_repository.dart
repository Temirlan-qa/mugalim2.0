import 'package:dio/dio.dart';
import 'package:mugalim/logic/book/data/models/semester_model.dart';

import '../datasources/book_datasources.dart';
import '../models/book_list_model.dart';
import '../models/voteList_model.dart';



abstract class BookRepository {
  Future<List<BookListModel>> getVoteById(String id);
  Future<List<VoteListModel>> getVoteList();
  Future<SemesterModel> getSemesterDeadline(String semester);
  Future<Response> postVote(String voteId,String resultOptionId);
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
  Future<List<VoteListModel>> getVoteList() async {
    Response response = await homeDatasource.getVoteList();
    return (response.data as List).map((data) => VoteListModel.fromJson(data)).toList();
  }
  @override
  Future<SemesterModel> getSemesterDeadline(String semester) async {
    Response response = await homeDatasource.getDeadlineSemester(semester);
    return SemesterModel.fromJson(response.data);
  }
  @override
  Future<Response> postVote(String voteId,String resultOptionId) async {
    Response response = await homeDatasource.postVote(voteId,resultOptionId);
    return response;
  }
}