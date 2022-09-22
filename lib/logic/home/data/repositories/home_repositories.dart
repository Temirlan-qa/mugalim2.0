import 'package:dio/dio.dart';
import 'package:mugalim/logic/home/data/models/post_by_id.dart';
import 'package:mugalim/logic/home/data/models/posts_model.dart';

import '../datasources/home_datasources.dart';
import '../models/post_comment.dart';


abstract class HomeRepository {
  Future<List<PostModel>> getPostsList();
  Future<List<PostModel>> getTrendingPostsList();
  Future<List<PostModel>> getSavedPostsList();
  Future<List<PostByIdModel>> getPosts(String postId);
  Future<Response> likedPost(String postId,String likeType);
  Future<Response> savedPost(String postId);
  Future<Response> deletePost(String postId);
  Future<Response> createPostComment(String parentId,String content);
  Future<List<PostCommentModel>> getPostComment(String postId);
}

class HomeRepositoryImpl extends HomeRepository {

  final HomeDatasource homeDatasource;

  HomeRepositoryImpl(this.homeDatasource);

  @override
  Future<List<PostModel>> getPostsList() async {
    Response response = await homeDatasource.getPostList();
    // print(response.data['content'][0]['content']);


    return (response.data['content'] as List).map((post) => PostModel.fromJson(post)).toList();
  }

  @override
  Future<List<PostModel>> getTrendingPostsList() async {
    Response response = await homeDatasource.getTrendingPostList();
    // print(response.data['content'][0]['content']);


    return (response.data['content'] as List).map((post) => PostModel.fromJson(post)).toList();
  }

  @override
  Future<List<PostModel>> getSavedPostsList() async {
    Response response = await homeDatasource.getSavedPostList();
    // print(response.data['content'][0]['content']);


    return (response.data['content'] as List).map((post) => PostModel.fromJson(post)).toList();
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
  @override
  Future<Response> savedPost(String postId) async {
    Response response = await homeDatasource.savedPost(postId);
    return response;
  }
  @override
  Future<Response> deletePost(String postId) async {
    Response response = await homeDatasource.deletePost(postId);
    return response;
  }
  @override
  Future<Response> createPostComment(String parentId,String content) async {
    Response response = await homeDatasource.createPostComment(parentId,content);
    return response;
  }
  @override
  Future<List<PostCommentModel>> getPostComment(String postId) async {
    Response response = await homeDatasource.getPostComment(postId);

    return (response.data['content'] as List).map((data) => PostCommentModel.fromJson(data)).toList();
  }
}