import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VSpace extends StatelessWidget {
  const VSpace(
    this.height, {
    super.key,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: (height).h);
  }
}

class HSpace extends StatelessWidget {
  const HSpace(this.width, {super.key});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: (width).h);
  }
}
