// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      json['id'] as String?,
      json['title'] as String?,
      json['content'] as String?,
      (json['images'] as List<dynamic>).map((e) => e as String?).toList(),
      json['userId'] as String?,
      json['cityId'] as String?,
      json['regionId'] as String?,
      json['likeNumber'] as int?,
      json['type'] as String?,
      json['viewNumber'] as int?,
      json['commentNumber'] as int?,
      json['savedNumber'] as int?,
      json['liked'] as bool?,
      json['commented'] as bool?,
      json['saved'] as bool?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['userName'] as String?,
      json['userAvatarId'] as String?,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'images': instance.images,
      'userId': instance.userId,
      'cityId': instance.cityId,
      'regionId': instance.regionId,
      'likeNumber': instance.likeNumber,
      'type': instance.type,
      'viewNumber': instance.viewNumber,
      'commentNumber': instance.commentNumber,
      'savedNumber': instance.savedNumber,
      'liked': instance.liked,
      'commented': instance.commented,
      'saved': instance.saved,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'userName': instance.userName,
      'userAvatarId': instance.userAvatarId,
    };
