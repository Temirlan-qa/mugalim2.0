// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'readBookList_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadBookListModel _$ReadBookListModelFromJson(Map<String, dynamic> json) =>
    ReadBookListModel(
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['deletedAt'] as String?,
      json['eventLog'] as List<dynamic>?,
      json['id'] as String?,
      json['userId'] as String?,
      json['bookId'] as String?,
      json['book'] == null
          ? null
          : BookListModel.fromJson(json['book'] as Map<String, dynamic>),
      json['startedAt'] as String?,
      json['completedAt'] as String?,
      json['review'] as String?,
      json['rating'] as int?,
    );

Map<String, dynamic> _$ReadBookListModelToJson(ReadBookListModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'eventLog': instance.eventLog,
      'id': instance.id,
      'userId': instance.userId,
      'bookId': instance.bookId,
      'book': instance.bookListModel,
      'startedAt': instance.startedAt,
      'completedAt': instance.completedAt,
      'review': instance.review,
      'rating': instance.rating,
    };
