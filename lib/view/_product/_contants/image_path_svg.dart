import '../../../core/extension/string_extension.dart';

class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  final design = "design".toSVG;
  final entries = "entries".toSVG;
  final cv = "cv".toSVG;
}
