// To parse this JSON data, do
//
//     final artists = artistsFromMap(jsonString);

import 'dart:convert';

import 'package:spotifyredesign/model/external_urls_model.dart';
import 'package:spotifyredesign/model/followers_model.dart';
import 'package:spotifyredesign/model/image_model.dart';

Artists artistsFromMap(String str) => Artists.fromMap(json.decode(str));

String artistsToMap(Artists data) => json.encode(data.toMap());

class Artists {
  Artists({
    this.externalUrls,
    this.followers,
    this.genres,
    this.href,
    this.id,
    required this.images,
    required this.name,
    this.popularity,
    this.type,
    this.uri,
  });

  final ExternalUrls? externalUrls;
  final Followers? followers;
  final List<String>? genres;
  final String? href;
  final String? id;
  final List<ImageModel> images;
  final String name;
  final int? popularity;
  final String? type;
  final String? uri;

  factory Artists.fromMap(Map<String, dynamic> json) => Artists(
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        followers: Followers.fromMap(json["followers"]),
        genres: List<String>.from(json["genres"].map((x) => x)),
        href: json["href"],
        id: json["id"],
        images: List<ImageModel>.from(
            json["images"].map((x) => ImageModel.fromMap(x))),
        name: json["name"],
        popularity: json["popularity"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toMap() => {
        "external_urls": externalUrls?.toMap(),
        "followers": followers?.toMap(),
        "genres": List<dynamic>.from(genres!.map((x) => x)),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
        "name": name,
        "popularity": popularity,
        "type": type,
        "uri": uri,
      };
}
