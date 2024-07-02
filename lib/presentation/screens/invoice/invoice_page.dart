import 'package:ayurvedic/presentation/widgets/asset_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

class InvoicePage extends StatelessWidget {
  final DateTime bookingDate = DateTime.now();
  final DateTime treatmentDate = DateTime(2024, 2, 21);
  final String name = "Salih T";
  final String address = "Nadakkave, Kozhikkode";
  final String whatsappNumber = "+91 987654321";
  final List<Map<String, dynamic>> treatments = [
    {
      "name": "Panchakarma",
      "price": 230,
      "male": 4,
      "female": 4,
      "total": 2540
    },
    {
      "name": "Njavara Kizhi Treatment",
      "price": 230,
      "male": 4,
      "female": 4,
      "total": 2540
    },
    {
      "name": "Panchakarma",
      "price": 230,
      "male": 4,
      "female": 6,
      "total": 2540
    },
  ];
  final int totalAmount = 7620;
  final int discount = 500;
  final int advance = 1200;
  final int balance = 5920;

  InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 16.h),
              _buildPatientDetails(),
              SizedBox(height: 16.h),
              _buildTreatmentDetails(),
              SizedBox(height: 16.h),
              _buildSummary(),
              SizedBox(height: 16.h),
              _buildFooter(),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () async {
                  final pdf = await _generatePdf();
                  await Printing.layoutPdf(
                      onLayout: (PdfPageFormat format) async => pdf);
                },
                child: Text('Generate PDF'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AssetImageWidget(
          imageName: 'logo.png',
          squareSize: 80.h,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('KUMARAKOM',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              Text('Cheepunkal P.O. Kumarakom, kottayam, Kerala - 686563'),
              Text('e-mail: unknown@gmail.com'),
              Text('Mob: +91 9786543210 | +91 9786543210'),
              Text('GST No: 32AABCU9603R1ZW'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPatientDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Patient Details',
            style: TextStyle(
                color: Colors.green,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(name),
                SizedBox(height: 8.h),
                Text('Address', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(address),
                SizedBox(height: 8.h),
                Text('WhatsApp Number',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(whatsappNumber),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Booked On',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(DateFormat('dd/MM/yyyy | hh:mma').format(bookingDate)),
                SizedBox(height: 8.h),
                Text('Treatment Date',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(DateFormat('dd/MM/yyyy').format(treatmentDate)),
                SizedBox(height: 8.h),
                Text('Treatment Time',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('11:00 am'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTreatmentDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Table(
          border: TableBorder.all(color: Colors.grey),
          children: [
            TableRow(
              children: [
                _buildTableHeader('Treatment'),
                _buildTableHeader('Price'),
                _buildTableHeader('Male'),
                _buildTableHeader('Female'),
                _buildTableHeader('Total'),
              ],
            ),
            ...treatments.map((treatment) {
              return TableRow(
                children: [
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(treatment['name'])),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('₹${treatment['price']}')),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('${treatment['male']}')),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('${treatment['female']}')),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('₹${treatment['total']}')),
                ],
              );
            }).toList(),
          ],
        ),
      ],
    );
  }

  Widget _buildTableHeader(String title) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
      ),
    );
  }

  Widget _buildSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('Total Amount: ₹$totalAmount',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 4.h),
        Text('Discount: ₹$discount'),
        SizedBox(height: 4.h),
        Text('Advance: ₹$advance'),
        SizedBox(height: 4.h),
        Text('Balance: ₹$balance',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Text('Thank you for choosing us',
            style: TextStyle(
                color: Colors.green,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold)),
        Text(
          "Your well-being is our commitment, and we're honored you've entrusted us with your health journey",
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        // Add your signature image here
        // Image.asset('assets/signature.png', height: 40.h),
      ],
    );
  }

  Future<Uint8List> _generatePdf() async {
    final pdf = pw.Document();

    // Preload the logo image data
    final logoImageData =
        (await rootBundle.load('assets/logo.png')).buffer.asUint8List();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _buildPdfHeader(logoImageData),
              pw.SizedBox(height: 16),
              _buildPdfPatientDetails(),
              pw.SizedBox(height: 16),
              _buildPdfTreatmentDetails(),
              pw.SizedBox(height: 16),
              _buildPdfSummary(),
              pw.SizedBox(height: 16),
              _buildPdfFooter(),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget _buildPdfHeader(Uint8List logoImageData) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.Image(pw.MemoryImage(logoImageData)),
        pw.Text('KUMARAKOM',
            style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
        pw.Text('Cheepunkal P.O. Kumarakom, kottayam, Kerala - 686563'),
        pw.Text('e-mail: unknown@gmail.com'),
        pw.Text('Mob: +91 9786543210 | +91 9786543210'),
        pw.Text('GST No: 32AABCU9603R1ZW'),
      ],
    );
  }

  pw.Widget _buildPdfPatientDetails() {
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
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Name',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text(name),
                pw.SizedBox(height: 8),
                pw.Text('Address',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text(address),
                pw.SizedBox(height: 8),
                pw.Text('WhatsApp Number',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text(whatsappNumber),
              ],
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Booked On',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text(DateFormat('dd/MM/yyyy | hh:mma').format(bookingDate)),
                pw.SizedBox(height: 8),
                pw.Text('Treatment Date',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text(DateFormat('dd/MM/yyyy').format(treatmentDate)),
                pw.SizedBox(height: 8),
                pw.Text('Treatment Time',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text('11:00 am'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  pw.Widget _buildPdfTreatmentDetails() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Treatment',
            style: pw.TextStyle(
                color: PdfColors.green,
                fontSize: 16,
                fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 8),
        pw.Table.fromTextArray(
          headers: ['Treatment', 'Price', 'Male', 'Female', 'Total'],
          data: treatments
              .map((treatment) => [
                    treatment['name'],
                    '₹${treatment['price']}',
                    treatment['male'].toString(),
                    treatment['female'].toString(),
                    '₹${treatment['total']}',
                  ])
              .toList(),
        ),
      ],
    );
  }

  pw.Widget _buildPdfSummary() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Summary',
            style: pw.TextStyle(
                color: PdfColors.green,
                fontSize: 16,
                fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 8),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('Total Amount'),
            pw.Text('₹$totalAmount'),
          ],
        ),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('Discount'),
            pw.Text('₹$discount'),
          ],
        ),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('Advance'),
            pw.Text('₹$advance'),
          ],
        ),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('Balance'),
            pw.Text('₹$balance'),
          ],
        ),
      ],
    );
  }

  pw.Widget _buildPdfFooter() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.Text('Thank you for choosing us',
            style: pw.TextStyle(
                color: PdfColors.green,
                fontSize: 16,
                fontWeight: pw.FontWeight.bold)),
        pw.Text(
            "Your well-being is our commitment, and we're honored you've entrusted us with your health journey"),
        pw.SizedBox(height: 16),
        pw.Text(
            "Booking amount is non-refundable, and it's important to arrive on the allotted time for your treatment",
            style: pw.TextStyle(fontSize: 10)),
      ],
    );
  }
}
