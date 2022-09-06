import 'package:json_annotation/json_annotation.dart';
import 'package:mugalim/logic/home/data/models/user_model.dart';


part 'post_by_id.g.dart';

@JsonSerializable()
class PostByIdModel {
  final String? id;
  final String? title;
  final String? content;
  final List? images;
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
  final bool? commented;
  final bool? saved;
  final String? createdAt;
  final String? updatedAt;


  factory PostByIdModel.fromJson(Map<String, dynamic> json) => _$PostByIdModelFromJson(json);

  PostByIdModel(this.id, this.title, this.content, this.userId,  this.likeNumber, this.liked, this.createdAt,  this.cityId, this.regionId, this.type, this.viewNumber, this.commentNumber, this.savedNumber, this.commented, this.saved, this.updatedAt, this.images, this.user);

  Map<String, dynamic> toJson() => _$PostByIdModelToJson(this);
}