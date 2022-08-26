import 'package:json_annotation/json_annotation.dart';
import 'package:mugalim/logic/home/data/models/user_model.dart';


part 'posts_model.g.dart';

@JsonSerializable()
class PostModel {
  final String? id;
  final String? title;
  final String? content;
  final List? imgs;
  final String? userId;
  final String? cityId;
  final String? regionId;
  final int? likeNumber;
  final String? type;
  final UserModel? user;
  final int? viewNumber;
  final int? commentNumber;
  final int? savedNumber;
  final bool? liked;
  final bool? commeted;
  final bool? saved;
  final String? createdAt;
  final String? updatedAt;


  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

  PostModel(this.id, this.title, this.content, this.userId,  this.likeNumber, this.liked, this.createdAt, this.imgs, this.cityId, this.regionId, this.type, this.user, this.viewNumber, this.commentNumber, this.savedNumber, this.commeted, this.saved, this.updatedAt);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}