import 'package:ayurvedic/core/constants/app_colors.dart';
import 'package:ayurvedic/core/utils/app_utils.dart';
import 'package:ayurvedic/presentation/routes/route_names.dart';
import 'package:ayurvedic/presentation/widgets/asset_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 2), () => context.pushNamed(RouteNames.login));
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                AppAssets.getImagePath('splash_bg.png', isSvg: false)),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: AppColors.imageBlurColor.withOpacity(0.6),
          child: Center(
            child: AssetImageWidget(
              imageName: 'logo.png',
              height: 142.h,
              width: 134.w,
            ),
          ),
        ),
      ),
    );
  }
}
