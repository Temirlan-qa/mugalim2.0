// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookVotes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookVotesModel _$BookVotesModelFromJson(Map<String, dynamic> json) =>
    BookVotesModel(
      json['id'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['bookVoteGroupId'] as String?,
      json['voteId'] as String?,
      json['name'] as String?,
      json['orderNumber'] as int?,
      json['eventLog'] as List<dynamic>?,
    );

Map<String, dynamic> _$BookVotesModelToJson(BookVotesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'eventLog': instance.eventLog,
      'bookVoteGroupId': instance.bookVoteGroupId,
      'voteId': instance.voteId,
      'name': instance.name,
      'orderNumber': instance.orderNumber,
    };
