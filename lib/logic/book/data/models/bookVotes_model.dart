// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';


part 'bookVotes_model.g.dart';

@JsonSerializable()
class BookVotesModel {
  final String? id;
  final List? options;
  final List? voterDetails;
  final String? name;
  final int? voteNumber;
  final bool? voted;

  factory BookVotesModel.fromJson(Map<String, dynamic> json) => _$BookVotesModelFromJson(json);

  BookVotesModel(this.id, this.voterDetails, this.options,  this.voteNumber, this.name,this.voted);
  Map<String, dynamic> toJson() => _$BookVotesModelToJson(this);
}