// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import 'authors_model.dart';
import 'book_list_model.dart';
import 'genres_model.dart';


part 'readBooks_model.g.dart';

@JsonSerializable()
class ReadBooksModel {
  final String? userId;
  final String? bookId;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List? eventLog;
  final String? id;
  final String? startedAt;
  final List? authorIds;
  final List? completedAt;
  final BookListModel book;
  final String? description;
  final String? review;
  final String? rating;


  factory ReadBooksModel.fromJson(Map<String, dynamic> json) => _$ReadBooksModelFromJson(json);

  ReadBooksModel(this.id, this.createdAt, this.updatedAt, this.deletedAt, this.eventLog, this.userId, this.bookId, this.startedAt, this.authorIds, this.completedAt, this.description, this.review, this.rating, this.book,);

  Map<String, dynamic> toJson() => _$ReadBooksModelToJson(this);
}