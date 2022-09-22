import 'package:json_annotation/json_annotation.dart';
import 'package:mugalim/logic/home/data/models/user_model.dart';


part 'posts_model.g.dart';

@JsonSerializable()
class PostModel {
  final String? id;
  final String? title;
  final String? content;
  final List<String?> images;
  final String? userId;
  final String? cityId;
  final String? regionId;
  final int? likeNumber;
  final String? type;
  final int? viewNumber;
  final int? commentNumber;
  final int? savedNumber;
  final bool? liked;
  final bool? commented;
  final bool? saved;
  final String? createdAt;
  final String? updatedAt;
  final String? userName;
  final String? userAvatarId;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

  PostModel(this.id, this.title, this.content, this.images, this.userId, this.cityId, this.regionId, this.likeNumber, this.type, this.viewNumber, this.commentNumber, this.savedNumber, this.liked, this.commented, this.saved, this.createdAt, this.updatedAt, this.userName, this.userAvatarId);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}