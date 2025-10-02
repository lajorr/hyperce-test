import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';

class OrderInfoTile extends StatelessWidget {
  const OrderInfoTile({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4.h,
          children: [
            Text(title, style: AppTextStyles.heading300),
            Text(subTitle, style: AppTextStyles.bodyText200),
          ],
        ),
        Icon(Icons.keyboard_arrow_right_rounded, color: Color(0xffB7B7B7)),
      ],
    );
  }
}
