import 'package:ayurvedic/core/constants/app_colors.dart';
import 'package:ayurvedic/core/constants/app_text_style.dart';
import 'package:ayurvedic/presentation/widgets/space_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TreatmentCardWidget extends StatelessWidget {
  final int index;
  final Function()? onTapRemove;
  final Function()? onTapEdit;
  const TreatmentCardWidget(
      {super.key, required this.index, this.onTapRemove, this.onTapEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardColor,
      child: Padding(
        padding:
            EdgeInsets.only(left: 20.w, top: 10.h, right: 5.w, bottom: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$index.',
              style: AppTextStyle.title.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const HSpace(2),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Couple Combo package i...",
                    style: AppTextStyle.subTitle.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GenderWithCountWidget(
                        count: 2,
                        gender: 'Male',
                      ),
                      GenderWithCountWidget(
                        count: 1,
                        gender: 'Female',
                      )
                    ],
                  ),
                ],
              ),
            ),
            const HSpace(5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 15.r,
                  backgroundColor: AppColors.errorColor.withOpacity(.5),
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: onTapRemove,
                      icon: Icon(
                        Icons.close,
                        color: AppColors.primaryColor,
                        size: 24.sp,
                      )),
                ),
                const VSpace(3),
                SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: onTapEdit,
                      icon: Icon(Icons.edit_outlined,
                          size: 24.sp, color: AppColors.secondaryColor),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class GenderWithCountWidget extends StatelessWidget {
  final int? count;
  final String gender;
  const GenderWithCountWidget({
    super.key,
    required this.count,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          gender,
          style: AppTextStyle.bodyText
              .copyWith(fontSize: 16.sp, color: AppColors.secondaryColor),
        ),
        const HSpace(10),
        Container(
          height: 26.h,
          width: 44.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.5),
            border: Border.all(
              color: AppColors.textPrimaryColor.withOpacity(.3),
            ),
            color: AppColors.textBgColor.withOpacity(.25),
          ),
          child: Text(
            '${count ?? 0}',
            style: AppTextStyle.bodyText
                .copyWith(fontSize: 16.sp, color: AppColors.secondaryColor),
          ),
        ),
      ],
    );
  }
}
