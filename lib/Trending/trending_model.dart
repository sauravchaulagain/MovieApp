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
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.name,
    required this.originalName,
    required this.firstAirDate,
  });

  String backdropPath;
  int id;
  String title;

  String originalTitle;
  String overview;
  String posterPath;
  double popularity;
  String releaseDate;
  bool video;
  double voteAverage;
  int voteCount;
  String name;
  String originalName;
  String firstAirDate;

  factory TrendingList.fromJson(Map<String, dynamic> json) => TrendingList(
        backdropPath: json["backdrop_path"],
        releaseDate: json["releaseDate"],
        id: json["id"],
        title: json["title"] == null ? null : json["title"],
        originalTitle:
            json["original_title"] == null ? null : json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        popularity: json["popularity"].toDouble(),
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        name: json["name"] == null ? null : json["name"],
        originalName:
            json["original_name"] == null ? null : json["original_name"],
        firstAirDate: json["first_air_date"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "title": title == null ? null : title,
        "original_title": originalTitle == null ? null : originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "popularity": popularity,
        "release_date": releaseDate,
        "video": video == null ? null : video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "name": name == null ? null : name,
        "original_name": originalName == null ? null : originalName,
        "first_air_date": firstAirDate,
      };
}