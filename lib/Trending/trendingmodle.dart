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
    required this.overview,
    required this.posterPath,
    required this.screen,
    required this.date,
    required this.voteAverage,
  });

  String backdropPath;
  int id;
  String title;
  String overview;
  String posterPath;
  String screen;
  DateTime date;
  double voteAverage;

  factory TrendingList.fromJson(Map<String, dynamic> json) => TrendingList(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        screen: json["screen"],
        date: DateTime.parse(json["date"]),
        voteAverage: json["vote_average"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "overview": overview,
        "poster_path": posterPath,
        "screen": screen,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "vote_average": voteAverage,
      };
}
