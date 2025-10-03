import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';
import 'package:hyperce_test/core/widgets/custom_rounded_square_container.dart';
import 'package:hyperce_test/feature/catalog/domain/entity/shoe.dart';

class ShoeCard extends StatelessWidget {
  const ShoeCard({super.key, required this.shoe});
  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/shoe-details', extra: shoe),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRoundedSquareContainer(
            dimension: 150.w,
            child: Stack(
              children: [
                Positioned(
                  left: 16.w,
                  top: 16.h,
                  child: SizedBox.square(
                    dimension: 24.w,
                    child: SvgPicture.asset(
                      shoe.brandLogo,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image);
                      },
                    ),
                  ),
                ),

                Positioned(
                  left: 16.w,
                  right: 16.w,
                  bottom: 22.h,
                  child: Image.asset(
                    'assets/images/shoe.png',
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            shoe.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodyText100,
          ),
          SizedBox(height: 4.h),
          Row(
            spacing: 5.w,
            children: [
              Icon(Icons.star_rounded, size: 12.w, color: AppColors.yellow500),
              Text(
                shoe.rating.toString(),
                style: AppTextStyles.bodyText10.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "(${shoe.reviews} Reviews)",
                style: AppTextStyles.bodyText10,
              ),
            ],
          ),
          Text(
            '\$${shoe.price.toStringAsFixed(2)}',
            style: AppTextStyles.heading300,
          ),
        ],
      ),
    );
  }
}
