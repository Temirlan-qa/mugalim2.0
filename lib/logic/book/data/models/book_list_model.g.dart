// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookListModel _$BookListModelFromJson(Map<String, dynamic> json) =>
    BookListModel(
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['deletedAt'] as String?,
      json['eventLog'] as List<dynamic>?,
      json['id'] as String?,
      json['name'] as String?,
      json['authorIds'] as List<dynamic>?,
      (json['authors'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : AuthorsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['genreIds'] as List<dynamic>?,
      (json['genres'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : GenresModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['description'] as String?,
      json['avatarId'] as String?,
      json['level'] as String?,
    );

Map<String, dynamic> _$BookListModelToJson(BookListModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'eventLog': instance.eventLog,
      'id': instance.id,
      'name': instance.name,
      'authorIds': instance.authorIds,
      'authors': instance.authors,
      'genreIds': instance.genreIds,
      'genres': instance.genres,
      'description': instance.description,
      'avatarId': instance.avatarId,
      'level': instance.level,
    };
