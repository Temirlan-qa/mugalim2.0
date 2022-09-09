// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:mugalim/logic/home/data/models/user_model.dart';


part 'post_comment.g.dart';

@JsonSerializable()
class PostCommentModel {
  final String? id;
  final List? eventLog;
  final String? content;
  final String? userId;
  final String? parentId;
  final int? commentNumber;
  final String? relativeId;
  final int? likeNumber;
  final String? userName;
  final String? userAvatarId;
  final bool? fromStructure;
  final bool? liked;
  final bool? saved;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;


  factory PostCommentModel.fromJson(Map<String, dynamic> json) => _$PostCommentModelFromJson(json);

  PostCommentModel(this.id, this.eventLog, this.content, this.userId, this.parentId, this.commentNumber, this.relativeId, this.likeNumber, this.userName, this.userAvatarId, this.fromStructure, this.liked, this.saved, this.createdAt, this.updatedAt, this.deletedAt);

  Map<String, dynamic> toJson() => _$PostCommentModelToJson(this);
}