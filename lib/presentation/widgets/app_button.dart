import 'package:ayurvedic/core/constants/app_colors.dart';
import 'package:ayurvedic/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;
  final Color? buttonColor;
  final TextStyle? textStyle;
  final Size? buttonMaxSize;
  final Size? buttonMinSize;
  const AppButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.buttonColor,
    this.textStyle,
    this.buttonMaxSize,
    this.buttonMinSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        maximumSize: buttonMaxSize?? Size(double.infinity, 50.h),
        minimumSize: buttonMinSize?? Size(double.infinity, 50.h),
        backgroundColor: buttonColor?? AppColors.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.53.r),
        ),
      ),
      child: Text(buttonText, style: textStyle??AppTextStyle.buttonText),
    );
  }
}
