// To parse this JSON data, do
//
//     final owner = ownerFromMap(jsonString);

import 'dart:convert';

import 'package:spotifyredesign/model/external_urls_model.dart';
import 'package:spotifyredesign/model/followers_model.dart';

Owner ownerFromMap(String str) => Owner.fromMap(json.decode(str));

String ownerToMap(Owner data) => json.encode(data.toMap());

class Owner {
  Owner({
    this.owner,
  });

  OwnerClass? owner;

  factory Owner.fromMap(Map<String, dynamic> json) => Owner(
        owner: OwnerClass.fromMap(json["owner"]),
      );

  Map<String, dynamic> toMap() => {
        "owner": owner!.toMap(),
      };
}

class OwnerClass {
  OwnerClass({
    this.externalUrls,
    this.followers,
    this.href,
    this.id,
    this.type,
    this.uri,
    this.displayName,
  });

  ExternalUrls? externalUrls;
  Followers? followers;
  String? href;
  String? id;
  String? type;
  String? uri;
  String? displayName;

  factory OwnerClass.fromMap(Map<String, dynamic> json) => OwnerClass(
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        followers: Followers.fromMap(json["followers"]),
        href: json["href"],
        id: json["id"],
        type: json["type"],
        uri: json["uri"],
        displayName: json["display_name"],
      );

  Map<String, dynamic> toMap() => {
        "external_urls": externalUrls?.toMap(),
        "followers": followers?.toMap(),
        "href": href,
        "id": id,
        "type": type,
        "uri": uri,
        "display_name": displayName,
      };
}
