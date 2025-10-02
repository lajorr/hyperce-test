import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hyperce_test/core/constants/app_assets.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.bagIcon,
              width: 120.w,
              height: 120.w,
              colorFilter: ColorFilter.mode(
                AppColors.neutral300,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              'Your cart is empty',
              style: AppTextStyles.heading600.copyWith(
                color: AppColors.neutral500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Text(
              'Looks like you haven\'t added any shoes to your cart yet.',
              style: AppTextStyles.bodyText200.copyWith(
                color: AppColors.neutral400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.neutral500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                minimumSize: Size(200.w, 50.h),
              ),
              child: Text(
                'Start Shopping',
                style: AppTextStyles.heading300.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
