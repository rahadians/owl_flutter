// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    required this.idNews,
    required this.image,
    required this.title,
    required this.content,
    required this.description,
    // required this.dateNews,
    required this.idUser,
    required this.username,
  });

  String idNews;
  String image;
  String title;
  String content;
  String description;
  // DateTime dateNews;
  String idUser;
  String username;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        idNews: json["id_news"],
        image: json["image"],
        title: json["title"],
        content: json["content"],
        description: json["description"],
        // dateNews: DateTime.parse(json["date_news"]),
        idUser: json["id_user"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id_news": idNews,
        "image": image,
        "title": title,
        "content": content,
        "description": description,
        // "date_news": dateNews.toIso8601String(),
        "id_user": idUser,
        "username": username,
      };

  static List<NewsModel> fromJsonList(List list) {
    if (list == null) return List<NewsModel>.empty();
    return list.map((item) => NewsModel.fromJson(item)).toList();
  }
}
