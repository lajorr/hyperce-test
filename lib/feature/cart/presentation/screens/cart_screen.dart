import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';
import 'package:hyperce_test/core/widgets/product_total_widget.dart';
import 'package:hyperce_test/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:hyperce_test/feature/cart/presentation/widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Cart', style: AppTextStyles.heading400),
        centerTitle: true,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.cartItems.isEmpty) {
            return _buildEmptyCartState(context);
          }

          final totalAmount = state.cartItems.fold<double>(
            0.0,
            (sum, item) => sum + (item.price * item.quantity),
          );

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      // Cart Items List
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.cartItems.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16.h),
                        itemBuilder: (context, index) {
                          final cartItem = state.cartItems[index];
                          return CartItemWidget(
                            cartItem: cartItem,
                            onIncrement: () {
                              context.read<CartCubit>().increment(cartItem);
                            },
                            onDecrement: () {
                              context.read<CartCubit>().decrement(cartItem);
                            },
                            onRemove: () {
                              context.read<CartCubit>().removeFromCart(
                                cartItem,
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
              // Bottom Section with Total and Checkout
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: ProductTotalWidget(
                    amount: totalAmount,
                    label: 'Total',
                    buttonLabel: 'Checkout',
                    onBtnPress: () {
                      // Handle checkout
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Checkout functionality coming soon!'),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEmptyCartState(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/bag-2.svg',
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
