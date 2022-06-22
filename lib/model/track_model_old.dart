// To parse this JSON data, do
//
//     final track = trackFromJson(jsonString);

import 'dart:convert';

Track trackFromJson(String str) => Track.fromJson(json.decode(str));

String trackToJson(Track data) => json.encode(data.toJson());

class Track {
  Track({
    this.addedAt,
    this.addedBy,
    this.isLocal,
    this.primaryColor,
    this.track,
    this.videoThumbnail,
  });

  final DateTime? addedAt;
  final AddedBy? addedBy;
  final bool? isLocal;
  final dynamic primaryColor;
  final TrackClass? track;
  final VideoThumbnail? videoThumbnail;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        addedAt:
            json["added_at"] == null ? null : DateTime.parse(json["added_at"]),
        addedBy: json["added_by"] == null
            ? null
            : AddedBy.fromJson(json["added_by"]),
        isLocal: json["is_local"] == null ? null : json["is_local"],
        primaryColor: json["primary_color"],
        track:
            json["track"] == null ? null : TrackClass.fromJson(json["track"]),
        videoThumbnail: json["video_thumbnail"] == null
            ? null
            : VideoThumbnail.fromJson(json["video_thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "added_at": addedAt == null ? null : addedAt?.toIso8601String(),
        "added_by": addedBy == null ? null : addedBy?.toJson(),
        "is_local": isLocal == null ? null : isLocal,
        "primary_color": primaryColor,
        "track": track == null ? null : track?.toJson(),
        "video_thumbnail":
            videoThumbnail == null ? null : videoThumbnail?.toJson(),
      };
}

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

  factory AddedBy.fromJson(Map<String, dynamic> json) => AddedBy(
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"] == null ? null : json["href"],
        id: json["id"] == null ? null : json["id"],
        type: json["type"] == null ? null : json["type"],
        uri: json["uri"] == null ? null : json["uri"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "external_urls": externalUrls == null ? null : externalUrls?.toJson(),
        "href": href == null ? null : href,
        "id": id == null ? null : id,
        "type": type == null ? null : type,
        "uri": uri == null ? null : uri,
        "name": name == null ? null : name,
      };
}

class ExternalUrls {
  ExternalUrls({
    this.spotify,
  });

  final String? spotify;

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"] == null ? null : json["spotify"],
      );

  Map<String, dynamic> toJson() => {
        "spotify": spotify == null ? null : spotify,
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

  factory TrackClass.fromJson(Map<String, dynamic> json) => TrackClass(
        album: json["album"] == null ? null : Album.fromJson(json["album"]),
        artists: json["artists"] == null
            ? null
            : List<AddedBy>.from(
                json["artists"].map((x) => AddedBy.fromJson(x))),
        discNumber: json["disc_number"] == null ? null : json["disc_number"],
        durationMs: json["duration_ms"] == null ? null : json["duration_ms"],
        episode: json["episode"] == null ? null : json["episode"],
        explicit: json["explicit"] == null ? null : json["explicit"],
        externalIds: json["external_ids"] == null
            ? null
            : ExternalIds.fromJson(json["external_ids"]),
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"] == null ? null : json["href"],
        id: json["id"] == null ? null : json["id"],
        isLocal: json["is_local"] == null ? null : json["is_local"],
        isPlayable: json["is_playable"] == null ? null : json["is_playable"],
        name: json["name"] == null ? null : json["name"],
        popularity: json["popularity"] == null ? null : json["popularity"],
        previewUrl: json["preview_url"] == null ? null : json["preview_url"],
        track: json["track"] == null ? null : json["track"],
        trackNumber: json["track_number"] == null ? null : json["track_number"],
        type: json["type"] == null ? null : json["type"],
        uri: json["uri"] == null ? null : json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "album": album == null ? null : album?.toJson(),
        "artists": artists == null
            ? null
            : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "disc_number": discNumber == null ? null : discNumber,
        "duration_ms": durationMs == null ? null : durationMs,
        "episode": episode == null ? null : episode,
        "explicit": explicit == null ? null : explicit,
        "external_ids": externalIds == null ? null : externalIds?.toJson(),
        "external_urls": externalUrls == null ? null : externalUrls?.toJson(),
        "href": href == null ? null : href,
        "id": id == null ? null : id,
        "is_local": isLocal == null ? null : isLocal,
        "is_playable": isPlayable == null ? null : isPlayable,
        "name": name == null ? null : name,
        "popularity": popularity == null ? null : popularity,
        "preview_url": previewUrl == null ? null : previewUrl,
        "track": track == null ? null : track,
        "track_number": trackNumber == null ? null : trackNumber,
        "type": type == null ? null : type,
        "uri": uri == null ? null : uri,
      };
}

class Album {
  Album({
    this.albumType,
    this.artists,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.totalTracks,
    this.type,
    this.uri,
  });

  final String? albumType;
  final List<AddedBy>? artists;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final List<Image>? images;
  final String? name;
  final DateTime? releaseDate;
  final String? releaseDatePrecision;
  final int? totalTracks;
  final String? type;
  final String? uri;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumType: json["album_type"] == null ? null : json["album_type"],
        artists: json["artists"] == null
            ? null
            : List<AddedBy>.from(
                json["artists"].map((x) => AddedBy.fromJson(x))),
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"] == null ? null : json["href"],
        id: json["id"] == null ? null : json["id"],
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"] == null ? null : json["name"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        releaseDatePrecision: json["release_date_precision"] == null
            ? null
            : json["release_date_precision"],
        totalTracks: json["total_tracks"] == null ? null : json["total_tracks"],
        type: json["type"] == null ? null : json["type"],
        uri: json["uri"] == null ? null : json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "album_type": albumType == null ? null : albumType,
        "artists": artists == null
            ? null
            : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "external_urls": externalUrls == null ? null : externalUrls?.toJson(),
        "href": href == null ? null : href,
        "id": id == null ? null : id,
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "name": name == null ? null : name,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
        "release_date_precision":
            releaseDatePrecision == null ? null : releaseDatePrecision,
        "total_tracks": totalTracks == null ? null : totalTracks,
        "type": type == null ? null : type,
        "uri": uri == null ? null : uri,
      };
}

class Image {
  Image({
    this.height,
    required this.url,
    this.width,
  });

  final int? height;
  final String url;
  final int? width;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"] == null ? null : json["height"],
        url: json["url"] == null ? null : json["url"],
        width: json["width"] == null ? null : json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height == null ? null : height,
        "url": url == null ? null : url,
        "width": width == null ? null : width,
      };
}

class ExternalIds {
  ExternalIds({
    this.isrc,
  });

  final String? isrc;

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        isrc: json["isrc"] == null ? null : json["isrc"],
      );

  Map<String, dynamic> toJson() => {
        "isrc": isrc == null ? null : isrc,
      };
}

class VideoThumbnail {
  VideoThumbnail({
    this.url,
  });

  final dynamic url;

  factory VideoThumbnail.fromJson(Map<String, dynamic> json) => VideoThumbnail(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
