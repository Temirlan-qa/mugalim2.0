// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import 'authors_model.dart';
import 'genres_model.dart';


part 'book_list_model.g.dart';

@JsonSerializable()
class BookListModel {
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List? eventLog;
  final String? id;
  final String? name;
  final List? authorIds;
  final List<AuthorsModel?> authors;
  final List? genreIds;
  final List<GenresModel?> genres;
  final String? description;
  final String? avatarId;
  final String? level;


  factory BookListModel.fromJson(Map<String, dynamic> json) => _$BookListModelFromJson(json);

  BookListModel(this.createdAt, this.updatedAt, this.deletedAt, this.eventLog, this.id, this.name, this.authorIds, this.authors, this.genreIds, this.genres, this.description, this.avatarId, this.level);


  Map<String, dynamic> toJson() => _$BookListModelToJson(this);
}