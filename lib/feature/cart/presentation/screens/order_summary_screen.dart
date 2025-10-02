import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';
import 'package:hyperce_test/core/widgets/custom_dialog_content.dart';
import 'package:hyperce_test/core/widgets/product_total_widget.dart';
import 'package:hyperce_test/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:hyperce_test/feature/cart/presentation/widgets/order_detail_tile.dart';
import 'package:hyperce_test/feature/cart/presentation/widgets/order_info_tile.dart';
import 'package:hyperce_test/feature/cart/presentation/widgets/payment_detail_tile.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    final items = cartCubit.state.cartItems;
    final double subtotal = cartCubit.totalAmount;
    const double shipping = 20.00;
    final double grandTotal = subtotal + shipping;
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Summary', style: AppTextStyles.heading400),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20.h,
                children: [
                  Text('Information', style: AppTextStyles.heading500),
                  OrderInfoTile(
                    title: 'Payment Method',
                    subTitle: 'Credit Card',
                  ),

                  Divider(color: AppColors.neutral100),

                  OrderInfoTile(
                    title: 'Location',
                    subTitle: 'Semarang, Indonesia',
                  ),

                  SizedBox(height: 10.h),

                  Text('Order Detail', style: AppTextStyles.heading500),

                  ...items.map((item) => OrderDetailTile(item: item)),

                  SizedBox(height: 10.h),

                  Text('Payment Detail', style: AppTextStyles.heading500),
                  PaymentDetailTile(label: 'Sub Total', value: subtotal),
                  PaymentDetailTile(label: 'Shipping', value: shipping),

                  Divider(color: AppColors.neutral100),

                  PaymentDetailTile(
                    label: 'Total Order',
                    value: grandTotal,
                    isGrand: true,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
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
                amount: grandTotal,
                label: 'Grand Total',
                buttonLabel: 'PLACE ORDER',
                onBtnPress: () async {
                  cartCubit.clearCart();
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    builder: (BuildContext context) {
                      return CustomDialogContent(
                        iconData: Icons.check_rounded,
                        title: "Order Placed!",
                        subTitle: "Items on the way.",
                        negativeBtnText: "BACK EXPLORE",
                        positiveBtnText: "DETAILS",
                        onNegativeBtnPress: () {
                          context.go('/');
                        },
                        onPositiveBtnPress: () {
                          context.pop();
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
