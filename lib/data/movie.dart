import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  Movie(this.voteCount, this.id, this.video, this.voteAverage, this.title, this.popularity, this.posterPath, this.originalLanguage, this.originalTitle,
      this.genreIds, this.backdropPath, this.adult, this.overview, this.releaseDate);

  @JsonKey(name: 'vote_count')
  int voteCount;
  int id;
  bool video;
  @JsonKey(name: 'vote_average')
  var voteAverage;
  String title;
  double popularity;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'genre_ids')
  List<int> genreIds = [];
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  bool adult;
  String overview;
  @JsonKey(name: 'release_date')
  String releaseDate;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
