import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';
import 'package:hyperce_test/core/widgets/product_total_widget.dart';
import 'package:hyperce_test/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:hyperce_test/feature/cart/presentation/widgets/cart_item_widget.dart';
import 'package:hyperce_test/feature/cart/presentation/widgets/empty_cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: AppTextStyles.heading400),
        centerTitle: true,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.cartItems.isEmpty) {
            return EmptyCartWidget();
          }

          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.cartItems.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 30.h),
                    itemBuilder: (context, index) {
                      final cartItem = state.cartItems[index];
                      return CartItemWidget(cartItem: cartItem);
                    },
                  ),
                ),
              ),

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
                    amount: context.watch<CartCubit>().totalAmount,
                    label: 'Total',
                    buttonLabel: 'Checkout',
                    onBtnPress: () {
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
}
