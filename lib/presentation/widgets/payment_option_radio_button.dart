import 'package:ayurvedic/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

enum PaymentMethod { cash, card, upi }

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({super.key});

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  final ValueNotifier<PaymentMethod> _selectedMethod =
      ValueNotifier<PaymentMethod>(PaymentMethod.cash);

  @override
  void dispose() {
    _selectedMethod.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<PaymentMethod>(
      valueListenable: _selectedMethod,
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RadioOption(
              title: 'Cash',
              value: PaymentMethod.cash,
              groupValue: value,
              onChanged: (PaymentMethod? newValue) {
                if (newValue != null) _selectedMethod.value = newValue;
              },
            ),
            RadioOption(
              title: 'Card',
              value: PaymentMethod.card,
              groupValue: value,
              onChanged: (PaymentMethod? newValue) {
                if (newValue != null) _selectedMethod.value = newValue;
              },
            ),
            RadioOption(
              title: 'UPI',
              value: PaymentMethod.upi,
              groupValue: value,
              onChanged: (PaymentMethod? newValue) {
                if (newValue != null) _selectedMethod.value = newValue;
              },
            ),
          ],
        );
      },
    );
  }
}

class RadioOption<T> extends StatelessWidget {
  final String title;
  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;

  const RadioOption({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<T>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: AppColors.secondaryColor,
        ),
        Text(title),
      ],
    );
  }
}
