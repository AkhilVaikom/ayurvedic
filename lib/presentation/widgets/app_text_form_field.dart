import 'package:ayurvedic/core/constants/app_colors.dart';
import 'package:ayurvedic/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isReadOnly;
  const AppTextFormField({
    super.key,
    this.hintText,
    this.hintStyle,
    this.border,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: AppColors.textBgColor.withOpacity(0.25),
        filled: true,
        hintText: hintText,
        hintStyle: hintStyle ??
            AppTextStyle.hintText.copyWith(
              color: AppColors.textSecondaryColor.withOpacity(0.4),
            ),
        border: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.53.r),
              borderSide: BorderSide(
                width: .85.h,
                color: AppColors.textBgColor.withOpacity(0.25),
              ),
            ),
        enabledBorder: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.53.r),
              borderSide: BorderSide(
                width: .85.h,
                color: AppColors.textBgColor.withOpacity(0.25),
              ),
            ),
      ),
    );
  }
}
