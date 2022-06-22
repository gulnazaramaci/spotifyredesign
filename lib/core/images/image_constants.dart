class ImageConstants {
  static ImageConstants? _instace;
  static ImageConstants get instance {
    if (_instace != null) return _instace!;
    _instace = ImageConstants._init();
    return _instace!;
  }

  ImageConstants._init();

  final temaBackground = 'bg'.toPng;
  final image1 = 'image1'.toPng;
  final image2 = 'image2'.toPng;
  final image3 = 'image3'.toPng;
  final image4 = 'image4'.toPng;
  final playImage = 'play'.toPng;
}

extension _ImageExtension on String {
  // Add to png path on image string
  String get toPng => 'assets/images/$this.png';
}
