import 'package:dio/dio.dart';
import '../../../../core/utils/dio/dio_wrapper.dart';

abstract class BookDatasource {
  Future<Response> getVoteList();
  Future<Response> getVoteById(String id);
  Future<Response> getDeadlineSemester(int id);
  Future<Response> postVote(String voteId,String resultOptionId);
}

class BookDataSourceImpl implements BookDatasource {
  final DioWrapper? dioWrapper;

  BookDataSourceImpl({this.dioWrapper}) {
    dioWrapper?.path = '';
  }


  @override
  Future<Response> getVoteList() async {
    Response response = await dioWrapper!.get('/books/voting/book-vote-group/my-list');
    return response;
  }
  @override
  Future<Response> getVoteById(String id) async {
    Response response = await dioWrapper!.get('/books/voting/vote/$id');
    return response;
  }
  @override
  Future<Response> getDeadlineSemester(int id) async {
    Response response = await dioWrapper!.get('/books/deadline/my/semester/$id');
    return response;
  }
  @override
  Future<Response> postVote(String voteId,String resultOptionId) async {
    Response response = await dioWrapper!.post('/books/voting/vote',
        data: {
          'voteId' : voteId,
          'resultOptionId' : resultOptionId,
        }
    );
    return response;
  }
}
