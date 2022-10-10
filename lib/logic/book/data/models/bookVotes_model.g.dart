// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookVotes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookVotesModel _$BookVotesModelFromJson(Map<String, dynamic> json) =>
    BookVotesModel(
      json['id'] as String?,
      json['voterDetails'] as List<dynamic>?,
      json['options'] as List<dynamic>?,
      json['voteNumber'] as int?,
      json['name'] as String?,
      json['voted'] as bool?,
      json['image'] as String?,
    );

Map<String, dynamic> _$BookVotesModelToJson(BookVotesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'options': instance.options,
      'voterDetails': instance.voterDetails,
      'name': instance.name,
      'voteNumber': instance.voteNumber,
      'voted': instance.voted,
    };
