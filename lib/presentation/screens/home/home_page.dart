import 'package:ayurvedic/core/constants/app_colors.dart';
import 'package:ayurvedic/core/constants/app_text_style.dart';
import 'package:ayurvedic/presentation/routes/route_names.dart';
import 'package:ayurvedic/presentation/widgets/app_button.dart';
import 'package:ayurvedic/presentation/widgets/app_card_widget.dart';
import 'package:ayurvedic/presentation/widgets/app_dropdown_widget.dart';
import 'package:ayurvedic/presentation/widgets/app_text_form_field.dart';
import 'package:ayurvedic/presentation/widgets/asset_image_widget.dart';
import 'package:ayurvedic/presentation/widgets/space_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        surfaceTintColor: AppColors.primaryColor,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        //  Padding(
        //   padding: EdgeInsets.all(20.r),
        //   child: SvgAssetIcon(
        //     imageName: 'ic_back_arrow.svg',
        //     width: 16.h,
        //     height: 14.w,
        //   ),
        // ),
        actions: [
          SvgAssetIcon(
            imageName: 'ic_notification.svg',
            squareSize: 28.w,
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Expanded(
                        flex: 7,
                        child: SizedBox(
                          height: 40.h,
                          child: AppTextFormField(
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: SvgAssetIcon(
                                imageName: 'ic_search.svg',
                                squareSize: 20.w,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.53.r),
                              borderSide: BorderSide(
                                width: .85.h,
                                color: AppColors.textPrimaryColor
                                    .withOpacity(0.25),
                              ),
                            ),
                            hintText: 'Search for treatments',
                            hintStyle: AppTextStyle.bodyText.copyWith(
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.2),
                            ),
                          ),
                        )),
                    const HSpace(15),
                    Expanded(
                      flex: 3,
                      child: AppButton(
                        buttonText: 'Search',
                        textStyle: AppTextStyle.buttonText.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        onPressed: () {},
                        buttonMaxSize: Size(80.w, 40.h),
                        buttonMinSize: Size(80.w, 40.h),
                      ),
                    )
                  ],
                ),
              ),
              const VSpace(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sort by:',
                      style: AppTextStyle.bodyText.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondaryColor),
                    ),
                    AppDropDownMenuWidget(
                      hintText: 'Date',
                      items: [
                        DropdownMenuItem(
                          value: 'date',
                          child: Text(
                            'Date',
                            style: AppTextStyle.bodyText.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'time',
                          child: Text(
                            'Time',
                            style: AppTextStyle.bodyText.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const VSpace(13),
              Divider(
                color: AppColors.textPrimaryColor.withOpacity(0.2),
                thickness: 1.0,
              ),
              const VSpace(14),
              ListView.separated(
                padding: EdgeInsets.only(bottom: 50.h),
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return AppCardWidget(
                    index: index + 1,
                    drName: 'Vikram Singh',
                    treatmentName: 'Full body massage',
                    date: '12/12/2021',
                    patientName: 'Jithesh',
                    onTapViewDetails: () {
                      print("Tap View Details $index");
                    },
                  );
                },
                separatorBuilder: (context, index) => const VSpace(10),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: AppButton(
                buttonText: 'Register',
                onPressed: () => context.pushNamed(RouteNames.patientRegister),
              ),
            ),
          )
        ],
      ),
    );
  }
}
