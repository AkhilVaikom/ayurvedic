import 'package:ayurvedic/core/constants/app_colors.dart';
import 'package:ayurvedic/core/constants/app_text_style.dart';
import 'package:ayurvedic/presentation/widgets/space_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCardWidget extends StatelessWidget {
  final String? patientName;
  final String? treatmentName;
  final String? date;
  final String? drName;
  final int? index;
  final Function()? onTapViewDetails;
  const AppCardWidget({
    super.key,
    this.patientName,
    this.treatmentName,
    this.date,
    this.drName,
    this.index,
    this.onTapViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      color: AppColors.cardColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$index.',
                  style: AppTextStyle.title.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HSpace(5),
                      Text(
                        drName ?? '',
                        style: AppTextStyle.title.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const VSpace(3),
                      Text(
                        treatmentName ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.bodyText.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: IconWithText(
                              icon: Icons.calendar_today_outlined,
                              text: date ?? '',
                            ),
                          ),
                          Expanded(
                            child: IconWithText(
                              icon: Icons.group_outlined,
                              text: patientName ?? '',
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.textPrimaryColor.withOpacity(0.2),
            thickness: 1.0,
          ),
          GestureDetector(
            onTap: onTapViewDetails,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              child: Row(
                children: [
                  const HSpace(13),
                  Text(
                    'View Booking details',
                    style: AppTextStyle.subTitle.copyWith(
                      fontWeight: FontWeight.w300,
                      color: AppColors.textPrimaryColor,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 30.w,
                    height: 30.h,
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.secondaryColor,
                        size: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final String? text;
  final IconData icon;
  const IconWithText({
    super.key,
    this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.errorColor, size: 16.sp),
        const HSpace(5),
        Text(
          text ?? '',
          style: AppTextStyle.bodyText.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimaryColor.withOpacity(.5),
          ),
        ),
      ],
    );
  }
}
