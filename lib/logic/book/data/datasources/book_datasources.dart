import 'package:dio/dio.dart';
import '../../../../core/utils/dio/dio_wrapper.dart';

abstract class BookDatasource {
  Future<Response> getVoteList();
  Future<Response> getVoteById(String id);
  Future<Response> getDeadlineSemester();
  Future<Response> postVote(List<Map<String, String>> choiceList);
  Future<Response> getMyChoiceList();
  Future<Response> getReadBooks();
}

class BookDataSourceImpl implements BookDatasource {
  final DioWrapper? dioWrapper;

  BookDataSourceImpl({this.dioWrapper}) {
    dioWrapper?.path = '';
  }


  @override
  Future<Response> getVoteList() async {
    Response response = await dioWrapper!.get('/books/voting/my-list');
    return response;
  }
  //https://portal.mugalim.academy/bcspc/books/voting/my-votes
  @override
  Future<Response> getMyChoiceList() async {
    Response response = await dioWrapper!.get('/books/voting/my-votes');
    return response;
  }
  @override
  Future<Response> getVoteById(String id) async {
    Response response = await dioWrapper!.get('/books/voting/vote/$id');
    return response;
  }
  @override
  Future<Response> getDeadlineSemester() async {
    Response response = await dioWrapper!.get('/books/voting/my-list/exists');
    return response;
  }
  @override
  Future<Response> postVote(List<Map<String, String>> choiceList) async {
    Response response = await dioWrapper!.post('/books/voting/vote',
        data: choiceList
    );
    return response;
  }
  @override
  Future<Response> getReadBooks() async {
    Response response = await dioWrapper!.get('/books/book-read/list/my');
    print(response);
    return response;
  }
}
