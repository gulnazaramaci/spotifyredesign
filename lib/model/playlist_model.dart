// To parse this JSON data, do
//
//     final platlist = platlistFromMap(jsonString);

import 'dart:convert';

import 'package:spotifyredesign/model/external_urls_model.dart';
import 'package:spotifyredesign/model/image_model.dart';
import 'package:spotifyredesign/model/owner_model.dart';

Platlist platlistFromMap(String str) => Platlist.fromMap(json.decode(str));

String platlistToMap(Platlist data) => json.encode(data.toMap());

class Platlist {
  Platlist({
    this.collaborative,
    this.description,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.primaryColor,
    this.public,
    this.snapshotId,
    this.tracks,
    this.type,
    this.uri,
  });

  final bool? collaborative;
  final String? description;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final List<ImageModel>? images;
  final String? name;
  final String? primaryColor;
  final bool? public;
  final String? snapshotId;
  final Tracks? tracks;
  final String? type;
  final String? uri;

  factory Platlist.fromMap(Map<String, dynamic> json) => Platlist(
        collaborative: json["collaborative"],
        description: json["description"],
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<ImageModel>.from(
            json["images"].map((x) => ImageModel.fromMap(x))),
        name: json["name"],
        primaryColor: json["primary_color"],
        public: json["public"],
        snapshotId: json["snapshot_id"],
        tracks: Tracks.fromMap(json["tracks"]),
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toMap() => {
        "collaborative": collaborative,
        "description": description,
        "external_urls": externalUrls?.toMap(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images!.map((x) => x.toMap())),
        "name": name,
        "primary_color": primaryColor,
        "public": public,
        "snapshot_id": snapshotId,
        "tracks": tracks?.toMap(),
        "type": type,
        "uri": uri,
      };
}

class Tracks {
  Tracks({
    this.href,
    this.total,
  });

  final String? href;
  final int? total;

  factory Tracks.fromMap(Map<String, dynamic> json) => Tracks(
        href: json["href"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "href": href,
        "total": total,
      };
}
