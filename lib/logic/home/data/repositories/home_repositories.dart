import 'package:dio/dio.dart';
import 'package:mugalim/logic/home/data/models/post_by_id.dart';
import 'package:mugalim/logic/home/data/models/posts_model.dart';

import '../datasources/home_datasources.dart';


abstract class HomeRepository {
  Future<List<PostModel>> getPostsList();
  Future<List<PostByIdModel>> getPosts(String postId);
  Future<Response> likedPost(String postId,String likeType);
}

class HomeRepositoryImpl extends HomeRepository {

  final HomeDatasource homeDatasource;

  HomeRepositoryImpl(this.homeDatasource);

  @override
  Future<List<PostModel>> getPostsList() async {
    Response response = await homeDatasource.getPostList();
    // print(response.data['content'][0]['content']);

    return (response.data['content'] as List).map((data) => PostModel.fromJson(data)).toList();
  }
  @override
  Future<List<PostByIdModel>> getPosts(String postId) async {
    Response response = await homeDatasource.getPost(postId);

    return (response.data as List).map((data) => PostByIdModel.fromJson(data)).toList();
  }
  @override
  Future<Response> likedPost(String postId,String likeType) async {
    Response response = await homeDatasource.likedPost(postId,likeType);
    return response;
  }
}