class ExternalUrls {
  ExternalUrls({
    this.spotify,
  });

  final String? spotify;

  factory ExternalUrls.fromMap(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
      );

  Map<String, dynamic> toMap() => {
        "spotify": spotify,
      };
}
