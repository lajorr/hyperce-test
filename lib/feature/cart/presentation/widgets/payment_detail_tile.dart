import 'package:flutter/material.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';

class PaymentDetailTile extends StatelessWidget {
  const PaymentDetailTile({
    super.key,
    required this.label,
    required this.value,
    this.isGrand = false,
  });
  final String label;
  final double value;
  final bool isGrand;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyText200.copyWith(color: AppColors.darkGray),
        ),
        Text(
          '\$${value.toStringAsFixed(2)}',
          style: isGrand ? AppTextStyles.heading500 : AppTextStyles.heading400,
        ),
      ],
    );
  }
}
