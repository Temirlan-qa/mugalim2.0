// ignore_for_file: file_names
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import 'bookVotes_model.dart';


part 'voteList_model.g.dart';

@JsonSerializable()
class VoteListModel {
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List? eventLog;
  final String? groupId;
  final int? semester;
  final List<BookVotesModel>? bookVotes;


  factory VoteListModel.fromJson(Map<String, dynamic> json) => _$VoteListModelFromJson(json);

  VoteListModel(this.id, this.createdAt, this.updatedAt, this.deletedAt, this.eventLog, this.groupId, this.semester, this.bookVotes, );

  Map<String, dynamic> toJson() => _$VoteListModelToJson(this);
}