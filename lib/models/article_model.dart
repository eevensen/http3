import 'dart:convert';

import '../config/defaults.dart';

class ArticleModel {
  ArticleModel({
    this.nodeId,
    this.title,
    this.introText,
    this.imageUrl,
    this.bodyText,
    this.country,
  });

  final String? nodeId;
  final String? title;
  final String? introText;
  final String? imageUrl;
  final String? bodyText;
  final String? country;

  Map<String, dynamic> toMap() {
    return {
      'nodeId': nodeId,
      'title': title,
      'introText': introText,
      'imageUrl': imageUrl,
      'bodyText': bodyText,
      'country': country,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      nodeId: (map['nodeId'] == '' || map['nodeId'] == null)
          ? Default.nodeId
          : map['nodeId'],
      title: (map['title'] == '' || map['title'] == null)
          ? Default.title
          : map['title'],
      introText: (map['introText'] == '' || map['introText'] == null)
          ? Default.introText
          : map['introText'],
      imageUrl: (map['imageUrl'] == '' || map['imageUrl'] == null)
          ? Default.imageUrl
          : map['imageUrl'],
      bodyText: (map['bodyText'] == '' || map['bodyText'] == null)
          ? Default.bodyText
          : map['bodyText'],
      country: (map['country'] == '' || map['country'] == null)
          ? Default.country
          : map['country'],
      //TODO Is this kind of empty string and null checking smart to do here? What are your thoughts on this code?
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) =>
      ArticleModel.fromMap(json.decode(source));
}
