import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';
import 'package:hyperce_test/feature/catalog/domain/entity/shoe.dart';

class ShoeGrid extends StatelessWidget {
  const ShoeGrid({super.key, required this.shoeList});
  final List<Shoe> shoeList;

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = ScreenUtil().screenWidth > 600 ? 3 : 2;
    final itemHeight = 224.h;
    return GridView.builder(
      itemCount: shoeList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: itemHeight,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 30.h,
      ),
      itemBuilder: (_, index) => _ShoeCard(shoe: shoeList[index]),
    );
  }
}

class _ShoeCard extends StatelessWidget {
  const _ShoeCard({required this.shoe});
  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/shoe-details', extra: shoe),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox.square(
            dimension: 150.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: ColoredBox(
                color: AppColors.neutral500.withValues(alpha: 0.05),
                child: Stack(
                  children: [
                    Positioned(
                      left: 16.w,
                      top: 16.h,
                      child: SizedBox.square(
                        dimension: 24.w,
                        child: CachedNetworkImage(
                          imageUrl: shoe.brandLogo,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 16.w,
                      right: 16.w,
                      bottom: 22.h,
                      child: SizedBox(
                        height: 85.h,
                        width: 120.w,
                        child: Icon(Icons.image),
                      ),
                    ),
                  ],
                ),
              ),
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
          Text('\$${shoe.price}', style: AppTextStyles.heading300),
        ],
      ),
    );
  }
}
