// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voteList_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoteListModel _$VoteListModelFromJson(Map<String, dynamic> json) =>
    VoteListModel(
      json['id'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['deletedAt'] as String?,
      json['eventLog'] as List<dynamic>?,
      json['groupId'] as String?,
      json['semester'] as int?,
      (json['bookVotes'] as List<dynamic>?)
          ?.map((e) => BookVotesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VoteListModelToJson(VoteListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'eventLog': instance.eventLog,
      'groupId': instance.groupId,
      'semester': instance.semester,
      'bookVotes': instance.bookVotes,
    };
