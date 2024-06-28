import 'package:ayurvedic/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle headLine = GoogleFonts.poppins(
    fontSize: 30.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimaryColor,
  );
  static TextStyle title = GoogleFonts.barlowCondensed(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimaryColor,
  );
  static TextStyle subTitle = GoogleFonts.barlow(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondaryColor,
  );

  static TextStyle numberText = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
  );
  static TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
  );
}
