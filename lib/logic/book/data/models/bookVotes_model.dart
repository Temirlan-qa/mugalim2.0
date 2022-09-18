// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';


part 'bookVotes_model.g.dart';

@JsonSerializable()
class BookVotesModel {
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final List? eventLog;
  final String? bookVoteGroupId;
  final String? voteId;
  final String? name;
  final int? orderNumber;
  final bool? voted;

  factory BookVotesModel.fromJson(Map<String, dynamic> json) => _$BookVotesModelFromJson(json);

  BookVotesModel(this.id, this.createdAt, this.updatedAt,  this.bookVoteGroupId, this.voteId, this.name, this.orderNumber, this.eventLog, this.voted);
  Map<String, dynamic> toJson() => _$BookVotesModelToJson(this);
}