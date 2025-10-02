import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';
import 'package:hyperce_test/feature/cart/presentation/cubit/cart_cubit.dart';

class SuccessDialogContent extends StatelessWidget {
  const SuccessDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    final cartState = context.watch<CartCubit>().state;
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
                Icons.check_rounded,
                color: AppColors.neutral500.withValues(alpha: 0.34),
                size: 36,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text("Added to cart", style: AppTextStyles.heading700),
          SizedBox(height: 5.h),
          Text(
            "${cartState.cartItems.length} Item(s) Total",
            style: AppTextStyles.bodyText200.copyWith(
              color: AppColors.neutral400,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 16.h,
                  ),
                ),
                onPressed: () {
                  context.go('/');
                },
                child: Text('BACK EXPLORE', style: AppTextStyles.heading300),
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 45.w,
                    vertical: 16.h,
                  ),
                ),
                onPressed: () {
                  context.go('/cart');
                },
                child: Text('TO CART', style: AppTextStyles.heading300),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
