import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../core/routes/environment_config.dart';
import '../../../../core/utils/dio/dio_wrapper.dart';

abstract class HomeDatasource {

  Future<Response> getPostList();
  Future<Response> getPost(String postId);
  Future<Response> likedPost(String postId,String likeType);
}

class HomeDataSourceImpl implements HomeDatasource {
  final DioWrapper? dioWrapper;

  HomeDataSourceImpl({this.dioWrapper}) {
    dioWrapper?.path = '';
  }


  @override
  Future<Response> getPost(String postId) async {
    Response response = await dioWrapper!.get('/posts/post/$postId');
    print(response);
    return response;
  }
  @override
  Future<Response> getPostList() async {
    Response response = await dioWrapper!.get('/posts/post/list/pageable?page=1&size=20');
    print(response);
    return response;
  }
  @override
  Future<Response> likedPost(String postId,String likeType) async {
    Response response = await dioWrapper!.post('/posts/likes/like',
        data: {
          'postId' : postId,
          'likeType' : likeType
        }
    );
    return response;
  }
}
