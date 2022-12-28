// To parse this JSON data, do
//
//     final trendingPost = trendingPostFromJson(jsonString);

import 'dart:convert';

List<TrendingPost> trendingPostFromJson(String str) => List<TrendingPost>.from(
    json.decode(str).map((x) => TrendingPost.fromJson(x)));

String trendingPostToJson(List<TrendingPost> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrendingPost {
  TrendingPost({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.screenpath,
    required this.date,
    required this.voteAverage,
  });

  String backdropPath;
  int id;
  String title;
  String overview;
  String posterPath;
  String screenpath;
  DateTime date;
  double voteAverage;

  factory TrendingPost.fromJson(Map<String, dynamic> json) => TrendingPost(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        screenpath: json["screenpath"],
        date: DateTime.parse(json["date"]),
        voteAverage: json["vote_average"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "overview": overview,
        "poster_path": posterPath,
        "screenpath": screenpath,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "vote_average": voteAverage,
      };
}
