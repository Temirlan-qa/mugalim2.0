// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';


part 'genres_model.g.dart';

@JsonSerializable()
class GenresModel {
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List? eventLog;
  final String? nameKZ;
  final String? nameEN;
  final int? genreOrder;


  factory GenresModel.fromJson(Map<String, dynamic> json) => _$GenresModelFromJson(json);

  GenresModel(this.id, this.createdAt, this.updatedAt, this.deletedAt, this.eventLog, this.nameKZ, this.nameEN, this.genreOrder);

  Map<String, dynamic> toJson() => _$GenresModelToJson(this);
}