import 'dart:typed_data';

import 'package:ayurvedic/core/constants/app_colors.dart';
import 'package:ayurvedic/core/constants/app_text_style.dart';
import 'package:ayurvedic/core/utils/app_utils.dart';
import 'package:ayurvedic/presentation/widgets/app_button.dart';
import 'package:ayurvedic/presentation/widgets/app_dropdown_widget.dart';
import 'package:ayurvedic/presentation/widgets/app_text_form_field.dart';
import 'package:ayurvedic/presentation/widgets/asset_image_widget.dart';
import 'package:ayurvedic/presentation/widgets/payment_option_radio_button.dart';
import 'package:ayurvedic/presentation/widgets/space_widgets.dart';
import 'package:ayurvedic/presentation/widgets/treatment_bottom_sheet.dart';
import 'package:ayurvedic/presentation/widgets/treatment_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

class PatientRegisterPage extends StatelessWidget {
  PatientRegisterPage({super.key});
  final dobController = TextEditingController();

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
        actions: [
          SvgAssetIcon(
            imageName: 'ic_notification.svg',
            squareSize: 28.w,
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text('Name', style: AppTextStyle.subTitle),
          ),
          const VSpace(8),
          const AppTextFormField(
            hintText: 'Enter your full Name',
          ),
          const VSpace(20),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text('Whatsapp Number', style: AppTextStyle.subTitle),
          ),
          const VSpace(8),
          const AppTextFormField(
            hintText: 'Enter your Whatsapp number',
          ),
          const VSpace(20),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text('Address', style: AppTextStyle.subTitle),
          ),
          const VSpace(8),
          const AppTextFormField(
            hintText: 'Enter your full address',
          ),
          const VSpace(20),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text('Location', style: AppTextStyle.subTitle),
          ),
          const VSpace(8),
          AppDropDownMenuWidget(
            hintText: 'Choose your location',
            height: 50.h,
            items: [
              DropdownMenuItem(
                value: 'location 1',
                child: Text(
                  'Location 1',
                  style: AppTextStyle.bodyText.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'location 2',
                child: Text(
                  'Location 2',
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
            ),
          ),
          const VSpace(20),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text('Branch', style: AppTextStyle.subTitle),
          ),
          const VSpace(8),
          AppDropDownMenuWidget(
            hintText: 'Select the branch',
            height: 50.h,
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
            ),
          ),
          const VSpace(20),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text('Treatments', style: AppTextStyle.subTitle),
          ),
          const VSpace(8),
          TreatmentCardWidget(index: 1),
          const VSpace(8),
          AppButton(
            buttonText: '+ Add Treatment',
            onPressed: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
              ),
              builder: (context) => const TreatmentBottomSheet(),
            ),
            buttonColor: AppColors.lightButton.withOpacity(.3),
            textStyle: AppTextStyle.hintText
                .copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text('Total Amount', style: AppTextStyle.subTitle),
          ),
          const VSpace(8),
          const AppTextFormField(),
          const VSpace(20),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text('Discount Amount', style: AppTextStyle.subTitle),
          ),
          const VSpace(8),
          const AppTextFormField(),
          const VSpace(20),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text('Payment Option', style: AppTextStyle.subTitle),
          ),
          const VSpace(8),
          const PaymentOptions(),
          const VSpace(20),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text('Advance Amount', style: AppTextStyle.subTitle),
          ),
          const VSpace(8),
          const AppTextFormField(),
          const VSpace(20),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text('Balance Amount', style: AppTextStyle.subTitle),
          ),
          const VSpace(8),
          const AppTextFormField(),
          const VSpace(20),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text('Treatmenet Date', style: AppTextStyle.subTitle),
          ),
          const VSpace(8),
          AppTextFormField(
            controller: dobController,
            isReadOnly: true,
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.calendar_today_outlined,
                color: AppColors.secondaryColor,
              ),
              onPressed: () async {
                final today = DateTime.now();
                final dateTime = await showDatePicker(
                  context: context,
                  keyboardType: TextInputType.datetime,
                  confirmText: 'Select',
                  cancelText: 'Cancel',
                  firstDate: today,
                  lastDate: DateTime(today.year + 1),
                  initialDate: today,
                  builder: (context, child) {
                    return Theme(
                        data: ThemeData.light().copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: AppColors.secondaryColor,
                            onPrimary: AppColors.primaryColor,
                            surface: AppColors.primaryColor,
                            onSurface: AppColors.textPrimaryColor,
                          ),
                          dialogBackgroundColor: AppColors.primaryColor,
                        ),
                        child: child!);
                  },
                );
                if (dateTime != null) {
                  dobController.text = dateTime
                      .toIso8601String()
                      .split('T')
                      .first
                      .split('-')
                      .reversed
                      .join('/');
                }
              },
            ),
          ),
          const VSpace(20),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text('Treatmenet Time', style: AppTextStyle.subTitle),
          ),
          const VSpace(8),
          Row(
            children: [
              Expanded(
                child: AppDropDownMenuWidget(
                  hintText: 'Hours',
                  height: 50.h,
                  items: List.generate(24, (index) {
                    final time = index;
                    final timeStr = time.toString().padLeft(2, '0');
                    return DropdownMenuItem(
                      value: time.toString(),
                      child: Text(
                        timeStr.toString(),
                        style: AppTextStyle.bodyText.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                    );
                  }),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.5),
                    border: Border.all(
                        color: AppColors.textPrimaryColor.withOpacity(.1),
                        width: .85),
                    color: AppColors.textBgColor.withOpacity(.25),
                  ),
                ),
              ),
              const HSpace(10),
              Expanded(
                child: AppDropDownMenuWidget(
                  hintText: 'Minutes',
                  height: 50.h,
                  items: List.generate(60, (index) {
                    final time = index;
                    final timeStr = time.toString().padLeft(2, '0');
                    return DropdownMenuItem(
                      value: time.toString(),
                      child: Text(
                        timeStr,
                        style: AppTextStyle.bodyText.copyWith(fontSize: 14.sp),
                      ),
                    );
                  }),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.5),
                    border: Border.all(
                      color: AppColors.textPrimaryColor.withOpacity(.1),
                      width: 0.85,
                    ),
                    color: AppColors.textBgColor.withOpacity(.25),
                  ),
                ),
              ),
            ],
          ),
          const VSpace(20),
          AppButton(
            buttonText: 'Save',
            onPressed: () async {
              final pdf = await _generatePdf();
              await Printing.layoutPdf(
                  onLayout: (PdfPageFormat format) async => pdf);
            },
          ),
        ],
      ),
    );
  }

  Future<Uint8List> _generatePdf() async {
    final pdf = pw.Document();
    print('Generating PDF...');

    final logoImageData = (await rootBundle
            .load(AppAssets.getImagePath('logo.png', isSvg: false)))
        .buffer
        .asUint8List();
    final loadSign = (await rootBundle
            .load(AppAssets.getImagePath('sign.png', isSvg: false)))
        .buffer
        .asUint8List();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Stack(children: [
            pw.Align(
                alignment: pw.Alignment.center,
                child: _buildWatermark(logoImageData)),
            pw.Column(
              children: [
                _buildHeader(logoImageData),
                pw.SizedBox(height: 20),
                _buildPatientDetails(),
                pw.SizedBox(height: 20),
                _buildTreatmentDetails(),
                pw.SizedBox(height: 20),
                _buildSummary(),
                pw.SizedBox(height: 20),
                _buildFooter(loadSign),
              ],
            ),
          ]);
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget _buildWatermark(logoImageData) {
    return pw.Transform.rotate(
      angle: 0,
      child: pw.Opacity(
        opacity: 0.05,
        child: pw.Center(
          child: pw.Container(
            height: 436,
            width: 414,
            decoration: pw.BoxDecoration(
              image: pw.DecorationImage(
                image: pw.MemoryImage(logoImageData),
                fit: pw.BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  pw.Widget _buildHeader(Uint8List logoImageData) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Image(pw.MemoryImage(logoImageData), width: 80, height: 76),
        pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
          pw.Text('KUMARAKOM',
              style:
                  pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
          pw.Text('Cheepunkal P.O. Kumarakom, kottayam, Kerala - 686563'),
          pw.Text('e-mail: unknown@gmail.com'),
          pw.Text('Mob: +91 9786543210 | +91 9786543210'),
          pw.Text('GST No: 32AABCU9603R1ZW'),
        ]),
      ],
    );
  }

  pw.Widget _buildPatientDetails() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Patient Details',
            style: pw.TextStyle(
                color: PdfColors.green,
                fontSize: 16,
                fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 8),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Name',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      pw.Text('Address',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      pw.Text('WhatsApp Number',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ]),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Salih T'),
                      pw.Text('Nadakkave, Kozhikkode'),
                      pw.Text('+91 9736487001'),
                    ])
              ],
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Booking Date',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      pw.Text('Treatment Date',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      pw.Text('Treatment Time',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ]),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('31/01/2024 | 12:12pm'),
                      pw.Text('21/02/2024'),
                      pw.Text('11:00 am'),
                    ]),
              ],
            ),
          ],
        ),
      ],
    );
  }

  pw.Widget _buildTreatmentDetails() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Expanded(
              flex: 3,
              child: pw.Text('Treatment',
                  style: pw.TextStyle(
                      color: PdfColors.green,
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold)),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Text('Price',
                  style: pw.TextStyle(
                      color: PdfColors.green,
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold)),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Text('Male',
                  style: pw.TextStyle(
                      color: PdfColors.green,
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold)),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Text('Female',
                  style: pw.TextStyle(
                      color: PdfColors.green,
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold)),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Text('Total',
                  style: pw.TextStyle(
                      color: PdfColors.green,
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold)),
            ),
          ],
        ),
        pw.SizedBox(height: 10),
        pw.ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return pw.Row(
              children: [
                pw.Expanded(
                  flex: 3,
                  child: pw.Text('Panchakarma'),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text('₹230'),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text('4'),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text('4'),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text('₹2,540'),
                ),
              ],
            );
          },
        ),
      ],
    );
    // return pw.Column(
    //   crossAxisAlignment: pw.CrossAxisAlignment.start,
    //   children: [
    //     pw.Text('Treatment',
    //         style: pw.TextStyle(
    //             color: PdfColors.green,
    //             fontSize: 16,
    //             fontWeight: pw.FontWeight.bold)),
    //     pw.SizedBox(height: 8),
    //     pw.Table.fromTextArray(
    //       headers: ['Treatment', 'Price', 'Male', 'Female', 'Total'],
    //       data: [
    //         ['Panchakarma', '₹230', '4', '4', '₹2,540'],
    //         ['Njavara Kizhi Treatment', '₹230', '4', '4', '₹2,540'],
    //         ['Panchakarma', '₹230', '4', '6', '₹2,540'],
    //       ],
    //     ),
    //   ],
    // );
  }

  pw.Widget _buildSummary() {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.end,
      children: [
        pw.Spacer(flex: 2),
        pw.Row(children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Total Amount'),
              pw.SizedBox(height: 5),
              pw.Text('Discount'),
              pw.SizedBox(height: 5),
              pw.Text('Advance'),
              pw.SizedBox(height: 5),
              pw.Text('Balance'),
            ],
          ),
          pw.SizedBox(width: 40),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Text('₹7,620'),
              pw.SizedBox(height: 5),
              pw.Text('₹500'),
              pw.SizedBox(height: 5),
              pw.Text('₹1,200'),
              pw.SizedBox(height: 5),
              pw.Text('₹5,920'),
            ],
          ),
        ]),
      ],
    );
  }

  pw.Widget _buildFooter(sign) {
    return pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Spacer(flex: 2),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text('Thank you for choosing us',
                  style: pw.TextStyle(
                      color: PdfColors.green,
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text(
                  'Your well-being is our commitment, and we\'re honored \nyou\'ve entrusted us with your health journey',
                  style: const pw.TextStyle(fontSize: 10),
                  textAlign: pw.TextAlign.right,
                  maxLines: 2),
              pw.SizedBox(height: 10),
              pw.Image(pw.MemoryImage(sign), width: 107, height: 40),
            ],
          )
        ]);
  }
}
