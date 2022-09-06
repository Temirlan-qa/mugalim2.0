// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_by_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostByIdModel _$PostByIdModelFromJson(Map<String, dynamic> json) =>
    PostByIdModel(
      json['id'] as String?,
      json['title'] as String?,
      json['content'] as String?,
      json['userId'] as String?,
      json['likeNumber'] as int?,
      json['liked'] as bool?,
      json['createdAt'] as String?,
      json['cityId'] as String?,
      json['regionId'] as String?,
      json['type'] as String?,
      json['viewNumber'] as int?,
      json['commentNumber'] as int?,
      json['savedNumber'] as int?,
      json['commented'] as bool?,
      json['saved'] as bool?,
      json['updatedAt'] as String?,
      json['images'] as List<dynamic>?,
      json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostByIdModelToJson(PostByIdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'images': instance.images,
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
      'commented': instance.commented,
      'saved': instance.saved,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
