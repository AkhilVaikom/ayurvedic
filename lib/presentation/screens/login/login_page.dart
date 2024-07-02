import 'package:ayurvedic/core/constants/app_colors.dart';
import 'package:ayurvedic/core/constants/app_text_style.dart';
import 'package:ayurvedic/core/utils/app_utils.dart';
import 'package:ayurvedic/presentation/routes/route_names.dart';
import 'package:ayurvedic/presentation/widgets/app_button.dart';
import 'package:ayurvedic/presentation/widgets/app_text_form_field.dart';
import 'package:ayurvedic/presentation/widgets/asset_image_widget.dart';
import 'package:ayurvedic/presentation/widgets/space_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 217.h,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      AppAssets.getImagePath('login_bg.png', isSvg: false)),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                height: 217.h,
                width: double.infinity,
                color: AppColors.imageBlurColor.withOpacity(0.6),
                child: Center(
                  child: AssetImageWidget(
                    imageName: 'logo.png',
                    height: 84.h,
                    width: 80.w,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login or register to book your appointments',
                    style: AppTextStyle.title.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                  const VSpace(30),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Text('Email', style: AppTextStyle.subTitle),
                  ),
                  const VSpace(8),
                  const AppTextFormField(
                    hintText: 'Enter your email',
                  ),
                  const VSpace(25),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Text('Password', style: AppTextStyle.subTitle),
                  ),
                  const VSpace(8),
                  const AppTextFormField(
                    hintText: 'Enter password',
                  ),
                  const VSpace(84),
                  AppButton(
                    buttonText: 'Login',
                    onPressed: () => context.pushReplacementNamed(RouteNames.home),),
                  const VSpace(50),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text:
                          'By creating or logging into an account you are agreeing with our ',
                      style: AppTextStyle.bodyText
                          .copyWith(fontWeight: FontWeight.w300),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: AppTextStyle.bodyText
                              .copyWith(color: AppColors.linkTextColor),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        TextSpan(
                          text: ' and ',
                          style: AppTextStyle.bodyText
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: AppTextStyle.bodyText.copyWith(
                              color: AppColors.linkTextColor,
                              fontWeight: FontWeight.w500),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                  const VSpace(15)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

