import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.imageCount,
    required this.currentIndex,
  });
  final int imageCount;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(imageCount, (i) {
        final bool active = i == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: 3.w),
          height: 8.h,
          width: active ? 20.w : 8.w,
          decoration: BoxDecoration(
            color: active
                ? AppColors.neutral500
                : AppColors.neutral300.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(100.r),
          ),
        );
      }),
    );
  }
}
