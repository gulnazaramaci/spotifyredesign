// To parse this JSON data, do
//
//     final track = trackFromMap(jsonString);

import 'dart:convert';

import 'package:spotifyredesign/model/addedBy_model.dart';
import 'package:spotifyredesign/model/album_model.dart';
import 'package:spotifyredesign/model/external_ids_model.dart';
import 'package:spotifyredesign/model/external_urls_model.dart';
import 'package:spotifyredesign/model/image_model.dart';
import 'package:spotifyredesign/model/videoThumbnail_model.dart';

Track trackFromMap(String str) => Track.fromMap(json.decode(str));

String trackToMap(Track data) => json.encode(data.toMap());

class Track {
  Track({
    this.addedBy,
    this.isLocal,
    this.primaryColor,
    this.track,
    this.videoThumbnail,
  });

  final AddedBy? addedBy;
  final bool? isLocal;
  final dynamic primaryColor;
  final TrackClass? track;
  final VideoThumbnail? videoThumbnail;

  factory Track.fromMap(Map<String, dynamic> json) => Track(
        addedBy: AddedBy.fromMap(json["added_by"]),
        isLocal: json["is_local"],
        primaryColor: json["primary_color"],
        track: TrackClass.fromMap(json["track"]),
        videoThumbnail: VideoThumbnail.fromMap(json["video_thumbnail"]),
      );

  Map<String, dynamic> toMap() => {
        "added_by": addedBy?.toMap(),
        "is_local": isLocal,
        "primary_color": primaryColor,
        "track": track?.toMap(),
        "video_thumbnail": videoThumbnail?.toMap(),
      };
}

class TrackClass {
  TrackClass({
    this.album,
    this.artists,
    this.discNumber,
    this.durationMs,
    this.episode,
    this.explicit,
    this.externalIds,
    this.externalUrls,
    this.href,
    this.id,
    this.isLocal,
    this.isPlayable,
    this.name,
    this.popularity,
    this.previewUrl,
    this.track,
    this.trackNumber,
    this.type,
    this.uri,
  });

  final Album? album;
  final List<AddedBy>? artists;
  final int? discNumber;
  final int? durationMs;
  final bool? episode;
  final bool? explicit;
  final ExternalIds? externalIds;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final bool? isLocal;
  final bool? isPlayable;
  final String? name;
  final int? popularity;
  final String? previewUrl;
  final bool? track;
  final int? trackNumber;
  final String? type;
  final String? uri;

  factory TrackClass.fromMap(Map<String, dynamic> json) => TrackClass(
        album: Album.fromMap(json["album"]),
        artists:
            List<AddedBy>.from(json["artists"].map((x) => AddedBy.fromMap(x))),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        episode: json["episode"],
        explicit: json["explicit"],
        externalIds: ExternalIds.fromMap(json["external_ids"]),
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isLocal: json["is_local"],
        isPlayable: json["is_playable"],
        name: json["name"],
        popularity: json["popularity"],
        previewUrl: json["preview_url"],
        track: json["track"],
        trackNumber: json["track_number"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toMap() => {
        "album": album?.toMap(),
        "artists": List<dynamic>.from(artists!.map((x) => x.toMap())),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "episode": episode,
        "explicit": explicit,
        "external_ids": externalIds?.toMap(),
        "external_urls": externalUrls?.toMap(),
        "href": href,
        "id": id,
        "is_local": isLocal,
        "is_playable": isPlayable,
        "name": name,
        "popularity": popularity,
        "preview_url": previewUrl,
        "track": track,
        "track_number": trackNumber,
        "type": type,
        "uri": uri,
      };
}
