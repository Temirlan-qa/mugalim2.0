import 'package:dio/dio.dart';
import '../../../../core/utils/dio/dio_wrapper.dart';

abstract class BookDatasource {
  Future<Response> getVoteList();
  Future<Response> getVoteById(String id);
  Future<Response> getDeadlineSemester(String id);
  Future<Response> getDeadlineSemester2(int id);
  Future<Response> postVote(List<Map<String, String>> choiceList);
}

class BookDataSourceImpl implements BookDatasource {
  final DioWrapper? dioWrapper;

  BookDataSourceImpl({this.dioWrapper}) {
    dioWrapper?.path = '';
  }


  @override
  Future<Response> getVoteList() async {
    Response response = await dioWrapper!.get('/books/voting/my-list');
    // print(response);
    return response;
  }
  @override
  Future<Response> getVoteById(String id) async {
    Response response = await dioWrapper!.get('/books/voting/vote/$id');
    return response;
  }
  @override
  Future<Response> getDeadlineSemester(String id) async {
    Response response = await dioWrapper!.get('/books/deadline/my/semester/$id');
    return response;
  }
  @override
  Future<Response> postVote(List<Map<String, String>> choiceList) async {
    Response response = await dioWrapper!.post('/books/voting/vote', data: choiceList
    );
    return response;
  }
  @override
  Future<Response> getDeadlineSemester2(int id) async{
    Response response = await dioWrapper!.get('/books/deadline/my/semester/$id');
    return response;
  }
}
