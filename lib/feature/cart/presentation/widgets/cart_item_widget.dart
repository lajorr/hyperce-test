import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';
import 'package:hyperce_test/feature/cart/domain/entity/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.cartItem,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  final CartItem cartItem;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final colorObj = Color(
      int.parse('0xff${cartItem.color.substring(1)}'),
    );

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.black100,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(
                imageUrl: cartItem.image,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: AppColors.neutral200,
                  child: Icon(
                    Icons.image,
                    color: AppColors.neutral300,
                    size: 24.w,
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: AppColors.neutral200,
                  child: Icon(
                    Icons.image_not_supported,
                    color: AppColors.neutral300,
                    size: 24.w,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Name and Remove Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItem.itemName,
                            style: AppTextStyles.heading400.copyWith(
                              color: AppColors.neutral500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            cartItem.brand,
                            style: AppTextStyles.bodyText100.copyWith(
                              color: AppColors.neutral400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: onRemove,
                      child: Icon(
                        Icons.close,
                        size: 20.w,
                        color: AppColors.neutral400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                // Size and Color
                Row(
                  children: [
                    Text(
                      'Size: ${cartItem.size}',
                      style: AppTextStyles.bodyText100.copyWith(
                        color: AppColors.neutral400,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Row(
                      children: [
                        Text(
                          'Color: ',
                          style: AppTextStyles.bodyText100.copyWith(
                            color: AppColors.neutral400,
                          ),
                        ),
                        Container(
                          width: 14.w,
                          height: 14.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorObj,
                            border: colorObj == Colors.white
                                ? Border.all(
                                    color: AppColors.neutral200,
                                    width: 1,
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                // Price and Quantity Controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${cartItem.price.toStringAsFixed(2)}',
                      style: AppTextStyles.heading400.copyWith(
                        color: AppColors.neutral500,
                      ),
                    ),
                    // Quantity Controls
                    Row(
                      children: [
                        GestureDetector(
                          onTap: cartItem.quantity > 1 ? onDecrement : null,
                          child: Container(
                            width: 32.w,
                            height: 32.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: cartItem.quantity > 1
                                  ? AppColors.neutral500
                                  : AppColors.neutral200,
                            ),
                            child: Icon(
                              Icons.remove,
                              size: 16.w,
                              color: cartItem.quantity > 1
                                  ? Colors.white
                                  : AppColors.neutral400,
                            ),
                          ),
                        ),
                        Container(
                          width: 40.w,
                          alignment: Alignment.center,
                          child: Text(
                            cartItem.quantity.toString(),
                            style: AppTextStyles.heading300.copyWith(
                              color: AppColors.neutral500,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: onIncrement,
                          child: Container(
                            width: 32.w,
                            height: 32.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.neutral500,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 16.w,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
