class ExternalIds {
  ExternalIds({
    this.isrc,
  });

  final String? isrc;

  factory ExternalIds.fromMap(Map<String, dynamic> json) => ExternalIds(
        isrc: json["isrc"],
      );

  Map<String, dynamic> toMap() => {
        "isrc": isrc,
      };
}
