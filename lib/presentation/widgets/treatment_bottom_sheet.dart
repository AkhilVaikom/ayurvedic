import 'package:ayurvedic/core/constants/app_colors.dart';
import 'package:ayurvedic/core/constants/app_text_style.dart';
import 'package:ayurvedic/presentation/widgets/app_button.dart';
import 'package:ayurvedic/presentation/widgets/app_dropdown_widget.dart';
import 'package:ayurvedic/presentation/widgets/space_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TreatmentBottomSheet extends StatefulWidget {
  const TreatmentBottomSheet({super.key});

  @override
  State<TreatmentBottomSheet> createState() => _TreatmentBottomSheetState();
}

class _TreatmentBottomSheetState extends State<TreatmentBottomSheet> {
  String? selectedTreatment;
  int maleCount = 0;
  int femaleCount = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              'Choose Treatment',
              style: AppTextStyle.subTitle,
            ),
          ),
          const VSpace(10),
          AppDropDownMenuWidget(
            hintText: 'Choose preferred treatment',
            height: 50.h,
            width: double.infinity,
            items: [
              DropdownMenuItem(
                value: 'Branch 1',
                child: Text(
                  'Branch 1',
                  style: AppTextStyle.bodyText.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'Branch 2',
                child: Text(
                  'Branch 2',
                  style: AppTextStyle.bodyText.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.5),
              border: Border.all(
                  color: AppColors.textPrimaryColor.withOpacity(.1),
                  width: .85),
              color: AppColors.textBgColor.withOpacity(.25),
            ),
          ),
          const VSpace(20),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              'Add Patients',
              style: AppTextStyle.subTitle,
            ),
          ),
          const VSpace(5),
          Row(
            children: [
              Container(
                  height: 50.h,
                  width: 120.w,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.5),
                    border: Border.all(
                        color: AppColors.textPrimaryColor.withOpacity(.25),
                        width: .85),
                    color: AppColors.textBgColor.withOpacity(.25),
                  ),
                  child: Text(
                    'Male',
                    style: AppTextStyle.hintText,
                  )),
              const Spacer(),
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.secondaryColor,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.remove,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      if (maleCount > 0) maleCount--;
                    });
                  },
                ),
              ),
              const HSpace(8),
              Container(
                  height: 44.h,
                  width: 48.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.5),
                    border: Border.all(
                      color: AppColors.textPrimaryColor.withOpacity(.3),
                    ),
                    color: AppColors.textBgColor.withOpacity(.25),
                  ),
                  child: Text('$maleCount')),
              const HSpace(8),
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.secondaryColor,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.add,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      maleCount++;
                    });
                  },
                ),
              ),
            ],
          ),
          const VSpace(20),
          Row(
            children: [
              Container(
                  height: 50.h,
                  width: 120.w,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.5),
                    border: Border.all(
                        color: AppColors.textPrimaryColor.withOpacity(.25),
                        width: .85),
                    color: AppColors.textBgColor.withOpacity(.25),
                  ),
                  child: Text(
                    'Female',
                    style: AppTextStyle.hintText,
                  )),
              const Spacer(),
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.secondaryColor,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.remove,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      if (femaleCount > 0) femaleCount--;
                    });
                  },
                ),
              ),
              const HSpace(8),
              Container(
                  height: 44.h,
                  width: 48.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.5),
                    border: Border.all(
                      color: AppColors.textPrimaryColor.withOpacity(.3),
                    ),
                    color: AppColors.textBgColor.withOpacity(.25),
                  ),
                  child: Text('$femaleCount')),
              const HSpace(8),
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.secondaryColor,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.add,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      femaleCount++;
                    });
                  },
                ),
              ),
            ],
          ),
          const VSpace(20),
          AppButton(
            buttonText: 'Save',
            onPressed: () async {
              
            },
          ),
        ],
      ),
    );
  }

}
