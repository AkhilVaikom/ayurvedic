import 'package:ayurvedic/core/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetImageWidget extends StatelessWidget {
  const AssetImageWidget(
      {super.key,
      required this.imageName,
      this.squareSize,
      this.width,
      this.height})
      : assert(
          (squareSize == null && (height != null && width != null)) ||
              (squareSize != null && (height == null && width == null)),
          "Either squareSize or height & width should be provided",
        );
  final String imageName;
  final double? squareSize;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    double? h = height;
    double? w = width;
    if (squareSize != null) {
      h = squareSize;
      w = squareSize;
    }
    return Image.asset(
      AppAssets.getImagePath(imageName, isSvg: false),
      height: h!,
      width: w!,
    );
  }
}

class SvgAssetIcon extends StatelessWidget {
  const SvgAssetIcon({
    super.key,
    required this.imageName,
    this.squareSize,
    this.height,
    this.width,
    this.colorFilter,
  }) : assert(
          (squareSize == null && (height != null && width != null)) ||
              (squareSize != null && (height == null && width == null)),
          "Either squareSize or height & width should be provided",
        );
  final String imageName;
  final double? squareSize;
  final double? width;
  final double? height;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    double? h = height;
    double? w = width;
    if (squareSize != null) {
      h = squareSize;
      w = squareSize;
    }
    return SvgPicture.asset(
      AppAssets.getImagePath(imageName),
      height: h!,
      width: w!,
      allowDrawingOutsideViewBox: true,
      colorFilter: colorFilter,
    );
  }
}
