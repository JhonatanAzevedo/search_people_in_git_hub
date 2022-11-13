import 'dart:convert';

import '../../domain/entities/search_entity.dart';

class SearchModel extends SearchEntity {
  SearchModel({
    required super.login,
    required super.url,
    required super.avataUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'url': url,
      'avatar_url': avataUrl,
    };
  }

  factory SearchModel.fromMap(Map<String, dynamic> map) {
    return SearchModel(
      login: map['login'] as String,
      url: map['url'] as String,
      avataUrl: map['avatar_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchModel.fromJson(String source) =>
      SearchModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
