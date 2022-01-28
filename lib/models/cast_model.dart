import 'dart:convert';

class CastModel {
  final String name;
  final String image;
  final String charater;
  CastModel({
    required this.name,
    required this.image,
    required this.charater,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'charater': charater,
    };
  }

  factory CastModel.fromMap(Map<String, dynamic> map) {
    return CastModel(
      name: map['original_name'] ?? '',
      image: 'http://image.tmdb.org/t/p/w200${map['profile_path']}',
      charater: map['charater'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CastModel.fromJson(String source) =>
      CastModel.fromMap(json.decode(source));
}
