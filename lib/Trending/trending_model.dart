// To parse this JSON data, do
//
//     final trendingList = trendingListFromJson(jsonString);

import 'dart:convert';

List<TrendingList> trendingListFromJson(String str) => List<TrendingList>.from(
    json.decode(str).map((x) => TrendingList.fromJson(x)));

String trendingListToJson(List<TrendingList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrendingList {
  TrendingList({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.name,
    required this.originalName,
    required this.firstAirDate,
  });

  bool adult;
  String backdropPath;
  int id;
  String title;
  String originalTitle;
  String overview;
  String posterPath;
  String mediaType;
  double popularity;
  String releaseDate;
  bool video;
  double voteAverage;
  int voteCount;
  String name;
  String originalName;
  String firstAirDate;

  factory TrendingList.fromJson(Map<String, dynamic> json) => TrendingList(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: json["media_type"],
        popularity: json["popularity"].toDouble(),
        releaseDate: json["release_date"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        name: json["name"],
        originalName: json["original_name"],
        firstAirDate: json["first_air_date"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaType,
        "popularity": popularity,
        "release_date": releaseDate,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "name": name,
        "original_name": originalName,
        "first_air_date": firstAirDate,
      };
}
