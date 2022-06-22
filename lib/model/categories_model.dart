// To parse this JSON data, do
//
//     final categories = categoriesFromMap(jsonString);

import 'dart:convert';

Categories categoriesFromMap(String str) =>
    Categories.fromMap(json.decode(str));

String categoriesToMap(Categories data) => json.encode(data.toMap());

class Categories {
  Categories({
    required this.href,
    required this.icons,
    required this.id,
    required this.name,
  });

  final String href;
  final List<IconModel> icons;
  final String id;
  final String name;

  factory Categories.fromMap(Map<String, dynamic> json) => Categories(
        href: json["href"],
        icons: List<IconModel>.from(
            json["icons"].map((x) => IconModel.fromMap(x))),
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "href": href,
        "icons": List<dynamic>.from(icons.map((x) => x.toMap())),
        "id": id,
        "name": name,
      };
}

class IconModel {
  IconModel({
    this.height,
    this.url,
    this.width,
  });

  final int? height;
  final String? url;
  final int? width;

  factory IconModel.fromMap(Map<String, dynamic> json) => IconModel(
        height: json["height"],
        url: json["url"],
        width: json["width"],
      );

  Map<String, dynamic> toMap() => {
        "height": height,
        "url": url,
        "width": width,
      };
}
