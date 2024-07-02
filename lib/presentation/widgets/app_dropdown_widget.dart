import 'package:ayurvedic/core/constants/app_colors.dart';
import 'package:ayurvedic/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropDownMenuWidget extends StatefulWidget {
  const AppDropDownMenuWidget(
      {super.key,
      required this.items,
      this.height,
      this.decoration,
      this.hintText,
      this.width,
      this.isExpanded = true});
  final List<DropdownMenuItem<String>> items;
  final double? height;
  final Decoration? decoration;
  final String? hintText;
  final double? width;
  final bool isExpanded;

  @override
  State<AppDropDownMenuWidget> createState() => _AppDropDownMenuWidgetState();
}

class _AppDropDownMenuWidgetState extends State<AppDropDownMenuWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 169.w,
      height: widget.height ?? 39.h,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      decoration: widget.decoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(33.0),
            border: Border.all(
                color: AppColors.textPrimaryColor.withOpacity(.3), width: 1.0),
            color: AppColors.primaryColor,
          ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(
            widget.hintText ?? '',
            style: AppTextStyle.bodyText.copyWith(
              fontSize: 14.sp,
            ),
          ),
          value: selectedValue,
          isExpanded: widget.isExpanded,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
          items: widget.items,
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AppColors.secondaryColor,
          ),
          style: AppTextStyle.bodyText.copyWith(
            fontSize: 14.sp,
          ),
          dropdownColor: Colors.white,
          itemHeight: 75.h,
        ),
      ),
    );
  }
}
