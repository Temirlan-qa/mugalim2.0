import 'package:dio/dio.dart';
import 'package:mugalim/logic/home/data/models/posts_model.dart';

import '../datasources/home_datasources.dart';


abstract class HomeRepository {
  Future<List<PostModel>> getPostsList();
  Future<List<PostModel>> getPosts(String postId);
}

class HomeRepositoryImpl extends HomeRepository {

  final HomeDatasource homeDatasource;

  HomeRepositoryImpl(this.homeDatasource);

  @override
  Future<List<PostModel>> getPostsList() async {
    Response response = await homeDatasource.getPostList();

    print(response.data['content'][0]['content']);

    return (response.data['content'] as List).map((data) => PostModel.fromJson(data)).toList();
  }
  @override
  Future<List<PostModel>> getPosts(String postId) async {
    Response response = await homeDatasource.getPost(postId);

    return (response.data as List).map((data) => PostModel.fromJson(data)).toList();
  }
}