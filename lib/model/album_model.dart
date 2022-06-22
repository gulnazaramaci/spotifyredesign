import 'package:spotifyredesign/model/addedBy_model.dart';
import 'package:spotifyredesign/model/external_urls_model.dart';
import 'package:spotifyredesign/model/image_model.dart';

class Album {
  Album({
    this.albumType,
    this.artists,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.totalTracks,
    this.type,
    this.uri,
  });

  final String? albumType;
  final List<AddedBy>? artists;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final List<ImageModel>? images;
  final String? name;

  final int? totalTracks;
  final String? type;
  final String? uri;

  factory Album.fromMap(Map<String, dynamic> json) => Album(
        albumType: json["album_type"],
        artists:
            List<AddedBy>.from(json["artists"].map((x) => AddedBy.fromMap(x))),
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<ImageModel>.from(
            json["images"].map((x) => ImageModel.fromMap(x))),
        name: json["name"],
        totalTracks: json["total_tracks"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toMap() => {
        "album_type": albumType,
        "artists": List<dynamic>.from(artists!.map((x) => x.toMap())),
        "external_urls": externalUrls?.toMap(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images!.map((x) => x.toMap())),
        "name": name,
        "type": type,
        "uri": uri,
      };
}
