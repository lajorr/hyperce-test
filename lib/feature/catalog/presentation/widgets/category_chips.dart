import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';

class CategoryChips extends StatefulWidget {
  const CategoryChips({super.key, required this.brands});

  final List<String> brands;

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: widget.brands.length,
        separatorBuilder: (_, __) => SizedBox(width: 20.w),
        itemBuilder: (context, index) {
          final active = index == selected;
          return GestureDetector(
            onTap: () => setState(() {
              selected = index;
            }),
            child: Text(
              widget.brands[index],
              style: AppTextStyles.heading600.copyWith(
                color: active ? AppColors.neutral500 : AppColors.neutral300,
              ),
            ),
          );
        },
      ),
    );
  }
}
