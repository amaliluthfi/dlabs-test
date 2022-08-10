// To parse this JSON data, do
//
//     final movieList = movieListFromJson(jsonString);

import 'dart:convert';

List<MovieList> movieListFromJson(String str) =>
    List<MovieList>.from(json.decode(str).map((x) => MovieList.fromJson(x)));

String movieListToJson(List<MovieList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MovieList {
  MovieList({
    this.id,
    this.title,
    this.description,
    this.poster,
    this.createdDate,
  });

  int? id;
  String? title;
  String? description;
  String? poster;
  DateTime? createdDate;

  factory MovieList.fromJson(Map<String, dynamic> json) => MovieList(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        poster: json["poster"],
        createdDate: DateTime.parse(json["created_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "poster": poster,
        "created_date":
            createdDate != null ? createdDate!.toIso8601String() : null,
      };
}
