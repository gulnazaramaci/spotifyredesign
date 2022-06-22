import 'package:spotifyredesign/model/external_urls_model.dart';

class AddedBy {
  AddedBy({
    this.externalUrls,
    this.href,
    this.id,
    this.type,
    this.uri,
    this.name,
  });

  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final String? type;
  final String? uri;
  final String? name;

  factory AddedBy.fromMap(Map<String, dynamic> json) => AddedBy(
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        type: json["type"],
        uri: json["uri"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toMap() => {
        "external_urls": externalUrls?.toMap(),
        "href": href,
        "id": id,
        "type": type,
        "uri": uri,
        "name": name == null ? null : name,
      };
}
