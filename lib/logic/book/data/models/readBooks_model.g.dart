// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'readBooks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadBooksModel _$ReadBooksModelFromJson(Map<String, dynamic> json) =>
    ReadBooksModel(
      json['id'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['deletedAt'] as String?,
      json['eventLog'] as List<dynamic>?,
      json['userId'] as String?,
      json['bookId'] as String?,
      json['startedAt'] as String?,
      json['authorIds'] as List<dynamic>?,
      json['completedAt'] as List<dynamic>?,
      json['description'] as String?,
      json['review'] as String?,
      json['rating'] as String?,
      json['book'],
    );

Map<String, dynamic> _$ReadBooksModelToJson(ReadBooksModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'bookId': instance.bookId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'eventLog': instance.eventLog,
      'id': instance.id,
      'startedAt': instance.startedAt,
      'authorIds': instance.authorIds,
      'completedAt': instance.completedAt,
      'book': instance.book,
      'description': instance.description,
      'review': instance.review,
      'rating': instance.rating,
    };
