import 'package:ayurvedic/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle headLine = GoogleFonts.poppins(
    fontSize: 30.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimaryColor,
  );
  static TextStyle title = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimaryColor,
  );
  static TextStyle subTitle = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondaryColor,
  );

  static TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
  static TextStyle hintText = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.textPrimaryColor,
  );
  static TextStyle bodyText = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryColor,
  );
}
