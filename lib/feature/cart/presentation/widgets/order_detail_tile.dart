import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/core/extensions/double_ext.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';
import 'package:hyperce_test/feature/cart/domain/entity/cart_item.dart';

class OrderDetailTile extends StatelessWidget {
  const OrderDetailTile({super.key, required this.item});
  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 10.h,
      children: [
        Text(item.itemName, style: AppTextStyles.heading400),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${item.brand} . ${item.color.name} . ${item.size.toFormattedString()} . Qty ${item.quantity}",
                style: AppTextStyles.bodyText200.copyWith(
                  color: AppColors.darkGray,
                ),
              ),
              Text(
                "\$${(item.quantity * item.price).toStringAsFixed(2)}",
                style: AppTextStyles.heading300,
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
