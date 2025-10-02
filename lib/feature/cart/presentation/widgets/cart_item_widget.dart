import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperce_test/core/constants/app_assets.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';
import 'package:hyperce_test/core/widgets/custom_dialog_content.dart';
import 'package:hyperce_test/core/widgets/custom_rounded_square_container.dart';
import 'package:hyperce_test/core/widgets/quantity_counter_widget.dart';
import 'package:hyperce_test/feature/cart/domain/entity/cart_item.dart';
import 'package:hyperce_test/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.cartItem});

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return SwipeableTile.swipeToTrigger(
      key: Key(cartItem.id),
      color: Colors.white,
      direction: SwipeDirection.endToStart,
      swipeThreshold: 0.25,
      isElevated: false,
      backgroundBuilder: (_, _, _) => Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          height: 88.h,
          width: 80.w,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.error500,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                bottomLeft: Radius.circular(20.r),
              ),
            ),
            child: Center(child: SvgPicture.asset(AppAssets.trashIcon)),
          ),
        ),
      ),
      onSwiped: (direction) {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          builder: (BuildContext context) {
            return CustomDialogContent(
              iconData: Icons.close_rounded,
              title: "Remote Item?",
              subTitle: "Total quantity ${cartItem.quantity}",
              negativeBtnText: "CANCEL",
              positiveBtnText: "REMOVE",
              onNegativeBtnPress: () {
                context.pop();
              },
              onPositiveBtnPress: () {
                context.read<CartCubit>().removeFromCart(cartItem);
                context.pop();
              },
            );
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Row(
          children: [
            CustomRoundedSquareContainer(
              dimension: 88.w,
              child: Center(
                child: Image.asset(
                  cartItem.image,
                  height: 50.h,
                  width: 70.w,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.image,
                    color: AppColors.neutral300,
                    size: 24.w,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.itemName,
                    style: AppTextStyles.heading400,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "${cartItem.brand} . ${cartItem.color.name} . ${cartItem.size}",
                    style: AppTextStyles.bodyText100.copyWith(
                      color: AppColors.neutral400,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${context.read<CartCubit>().calculateProductTotal(cartItem).toStringAsFixed(2)}',
                        style: AppTextStyles.heading400.copyWith(
                          color: AppColors.neutral500,
                        ),
                      ),
                      QuantityCounterWidget(
                        quantity: cartItem.quantity,
                        showQuantity: true,
                        onDecrement: () =>
                            context.read<CartCubit>().decrement(cartItem),
                        onIncrement: () =>
                            context.read<CartCubit>().increment(cartItem),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
