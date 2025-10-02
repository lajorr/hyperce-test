import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';

class CustomDialogContent extends StatelessWidget {
  const CustomDialogContent({
    super.key,
    required this.iconData,
    required this.title,
    required this.subTitle,
    required this.positiveBtnText,
    required this.negativeBtnText,
    required this.onPositiveBtnPress,
    required this.onNegativeBtnPress,
  });

  final IconData iconData;
  final String title;
  final String subTitle;
  final String positiveBtnText;
  final String negativeBtnText;
  final VoidCallback onPositiveBtnPress;
  final VoidCallback onNegativeBtnPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.w, 16.h, 30.w, 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.square(
            dimension: 100.w,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(width: 3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                color: AppColors.neutral500.withValues(alpha: 0.34),
                size: 36,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(title, style: AppTextStyles.heading700),
          SizedBox(height: 5.h),
          Text(
            subTitle,
            style: AppTextStyles.bodyText200.copyWith(
              color: AppColors.neutral400,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 15.w,
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.w,
                      vertical: 16.h,
                    ),
                  ),
                  onPressed: onNegativeBtnPress,
                  child: Text(negativeBtnText, style: AppTextStyles.heading300),
                ),
              ),
              Expanded(
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                  ),
                  onPressed: onPositiveBtnPress,
                  child: Text(positiveBtnText, style: AppTextStyles.heading300),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
