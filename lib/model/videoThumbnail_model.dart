class VideoThumbnail {
  VideoThumbnail({
    this.url,
  });

  final dynamic url;

  factory VideoThumbnail.fromMap(Map<String, dynamic> json) => VideoThumbnail(
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
      };
}
