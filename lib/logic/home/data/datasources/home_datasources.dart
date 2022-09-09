import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../core/routes/environment_config.dart';
import '../../../../core/utils/dio/dio_wrapper.dart';

abstract class HomeDatasource {
  Future<Response> getPostList();
  Future<Response> getPost(String postId);
  Future<Response> likedPost(String postId,String likeType);
  Future<Response> deletePost(String postId);
  Future<Response> savedPost(String postId);
  Future<Response> getPostComment(String parentId);
  Future<Response> createPostComment(String parentId,String content);
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
  @override
  Future<Response> savedPost(String postId) async {
    Response response = await dioWrapper!.post('/posts/saved/create',
        data: {
          'postId' : postId,
        }
    );
    return response;
  }
  //posts/comments/list/pageable/{parentId}
  @override
  Future<Response> deletePost(String postId) async {
    Response response = await dioWrapper!.delete('/posts/saved/delete/$postId');
    return response;
  }
  @override
  Future<Response> getPostComment(String parentId) async {
    Response response = await dioWrapper!.get('/posts/comments/list/pageable/$parentId');
    return response;
  }
  @override
  Future<Response> createPostComment(String parentId,String content) async {
    Response response = await dioWrapper!.post('/posts/comments/create',
        data: {
          'parentId' : parentId,
          'content' : content,
        }
    );
    return response;
  }
}
