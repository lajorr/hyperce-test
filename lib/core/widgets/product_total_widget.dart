import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';

class ProductTotalWidget extends StatelessWidget {
  const ProductTotalWidget({
    super.key,
    required this.amount,
    required this.onBtnPress,
    this.label = 'Price',
    this.buttonLabel = "Add to cart",
  });
  final double amount;
  final VoidCallback onBtnPress;
  final String label;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 5.h,
          children: [
            Text(
              label,
              style: AppTextStyles.bodyText100.copyWith(
                color: AppColors.neutral300,
              ),
            ),
            Text(
              '\$${amount.toStringAsFixed(2)}',
              style: AppTextStyles.heading600,
            ),
          ],
        ),
        FilledButton(
          onPressed: onBtnPress,
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.neutral500,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
          ),
          child: Text(
            buttonLabel,
            style: AppTextStyles.heading300.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
