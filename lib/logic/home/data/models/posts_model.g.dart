// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      json['id'] as String?,
      json['title'] as String?,
      json['content'] as String?,
      json['userId'] as String?,
      json['likeNumber'] as int?,
      json['liked'] as bool?,
      json['createdAt'] as String?,
      json['imgs'] as List<dynamic>?,
      json['cityId'] as String?,
      json['regionId'] as String?,
      json['type'] as String?,
      json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      json['viewNumber'] as int?,
      json['commentNumber'] as int?,
      json['savedNumber'] as int?,
      json['commeted'] as bool?,
      json['saved'] as bool?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'imgs': instance.imgs,
      'userId': instance.userId,
      'cityId': instance.cityId,
      'regionId': instance.regionId,
      'likeNumber': instance.likeNumber,
      'type': instance.type,
      'user': instance.user,
      'viewNumber': instance.viewNumber,
      'commentNumber': instance.commentNumber,
      'savedNumber': instance.savedNumber,
      'liked': instance.liked,
      'commeted': instance.commeted,
      'saved': instance.saved,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
