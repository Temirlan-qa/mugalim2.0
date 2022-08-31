// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCommentModel _$PostCommentModelFromJson(Map<String, dynamic> json) =>
    PostCommentModel(
      json['id'] as String?,
      json['eventLog'] as List<dynamic>?,
      json['content'] as String?,
      json['userId'] as String?,
      json['parentId'] as String?,
      json['commentNumber'] as int?,
      json['relativeId'] as String?,
      json['likeNumber'] as int?,
      json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      json['liked'] as bool?,
      json['saved'] as bool?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['deletedAt'] as String?,
    );

Map<String, dynamic> _$PostCommentModelToJson(PostCommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventLog': instance.eventLog,
      'content': instance.content,
      'userId': instance.userId,
      'parentId': instance.parentId,
      'commentNumber': instance.commentNumber,
      'relativeId': instance.relativeId,
      'likeNumber': instance.likeNumber,
      'user': instance.user,
      'liked': instance.liked,
      'saved': instance.saved,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };
