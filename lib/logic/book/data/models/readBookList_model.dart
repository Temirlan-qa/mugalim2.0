// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

import 'book_list_model.dart';

part 'readBookList_model.g.dart';

@JsonSerializable()
class ReadBookListModel {
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List? eventLog;
  final String? id;
  final String? userId;
  final String? bookId;
  @JsonKey(name: "book")
  final BookListModel? bookListModel;
  final String? startedAt;
  final String? completedAt;
  final String? review;
  final int? rating;

  factory ReadBookListModel.fromJson(Map<String, dynamic> json) => _$ReadBookListModelFromJson(json);

  ReadBookListModel(this.createdAt, this.updatedAt, this.deletedAt, this.eventLog, this.id, this.userId, this.bookId, this.bookListModel, this.startedAt, this.completedAt, this.review, this.rating);





  Map<String, dynamic> toJson() => _$ReadBookListModelToJson(this);
}