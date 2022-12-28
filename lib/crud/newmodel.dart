// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
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
  String date;
  double voteAverage;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        screenpath: json["screenpath"],
        date: json["date"],
        voteAverage: json["vote_average"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "overview": overview,
        "poster_path": posterPath,
        "screenpath": screenpath,
        "date": date,
        "vote_average": voteAverage,
      };
}
