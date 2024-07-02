class AppAssets {
  AppAssets._();

  static const String _imagePath = "assets/svgs/";
  static const String _pngImagePath = "assets/pngs/";

  static String getImagePath(String imageName, {bool isSvg = true}) {
    if (isSvg) {
      return _imagePath + imageName;
    } else {
      return _pngImagePath + imageName;
    }
  }
}
