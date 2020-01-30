import 'package:flutter_movi_demo/data/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_list_responce.g.dart';

@JsonSerializable()
class MovieListResponse {
  MovieListResponse(this.page, this.totalResults, this.totalPages, this.movies);

  int page;
  @JsonKey(name: 'total_results')
  int totalResults;
  @JsonKey(name: 'total_pages')
  int totalPages;
  @JsonKey(name: 'results')
  List<Movie> movies;

  factory MovieListResponse.fromJson(Map<String, dynamic> json) => _$MovieListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListResponseToJson(this);
}
