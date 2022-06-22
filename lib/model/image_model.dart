class ImageModel {
  ImageModel({
    this.height,
    required this.url,
    this.width,
  });

  final int? height;
  final String url;
  final int? width;

  factory ImageModel.fromMap(Map<String, dynamic> json) => ImageModel(
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
