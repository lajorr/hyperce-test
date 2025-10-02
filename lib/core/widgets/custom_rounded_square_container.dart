import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';

class CustomRoundedSquareContainer extends StatelessWidget {
  const CustomRoundedSquareContainer({
    super.key,
    required this.dimension,
    this.bgColor,
    required this.child,
  });

  final double dimension;
  final Color? bgColor;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: ColoredBox(
          color: bgColor ?? AppColors.neutral500.withValues(alpha: 0.05),
          child: child,
        ),
      ),
    );
  }
}
