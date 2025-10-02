import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce_test/config/services/service_locator.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';
import 'package:hyperce_test/core/widgets/product_total_widget.dart';
import 'package:hyperce_test/feature/catalog/domain/entity/shoe.dart';
import 'package:hyperce_test/feature/catalog/presentation/cubits/shoe_variant/shoe_variant_cubit.dart';
import 'package:hyperce_test/feature/catalog/presentation/widgets/add_to_cart_dialog_content.dart';
import 'package:hyperce_test/feature/catalog/presentation/widgets/image_carousel.dart';
import 'package:hyperce_test/feature/catalog/presentation/widgets/size_selector.dart';
import 'package:hyperce_test/feature/catalog/presentation/widgets/success_dialog_content.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.shoe});
  final Shoe shoe;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final Shoe shoe = widget.shoe;
    final intRating = shoe.rating.toInt();

    return BlocProvider(
      create: (context) => getIt<ShoeVariantCubit>(),
      child: Builder(
        builder: (ctx) {
          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageCarousel(
                      images: shoe.images,
                      colorVariants: shoe.colors,
                    ),
                    SizedBox(height: 30.h),

                    Text(shoe.name, style: AppTextStyles.heading600),
                    SizedBox(height: 10.h),
                    Row(
                      spacing: 5.w,
                      children: [
                        _buildStars(filledStars: intRating),
                        Text(
                          shoe.rating.toStringAsFixed(1),
                          style: AppTextStyles.bodyText200.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '(${shoe.reviews} Reviews)',
                          style: AppTextStyles.bodyText100.copyWith(
                            color: AppColors.neutral300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Text('Size', style: AppTextStyles.heading400),
                    SizedBox(height: 10.h),
                    SizeSelector(sizes: shoe.sizes),
                    SizedBox(height: 30.h),
                    Text('Description', style: AppTextStyles.heading400),
                    SizedBox(height: 10.h),
                    Text(
                      shoe.description,
                      style: AppTextStyles.bodyText200.copyWith(
                        color: AppColors.neutral400,
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffD7D7D7).withValues(alpha: 0.2),
                    blurRadius: 30,
                    offset: const Offset(0, -20),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),

                child: ProductTotalWidget(
                  amount: shoe.price,
                  onBtnPress: () async {
                    final String action = await showModalBottomSheet(
                      context: ctx,
                      showDragHandle: true,
                      backgroundColor: Colors.white,
                      builder: (BuildContext context) {
                        return AddToCartDialogContent(
                          shoe: shoe,
                          shoeVariantCubit: ctx.read<ShoeVariantCubit>(),
                        );
                      },
                    );
                    if (action == "success" && ctx.mounted) {
                      showModalBottomSheet(
                        context: ctx,
                        backgroundColor: Colors.white,

                        builder: (BuildContext context) {
                          return SuccessDialogContent();
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStars({required int filledStars, int totalStars = 5}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 5.w,
      children: List.generate(totalStars, (index) {
        final isFilled = index < filledStars;
        return Icon(
          Icons.star_rounded,
          color: isFilled ? AppColors.yellow500 : AppColors.black100,
          size: 12.w,
        );
      }),
    );
  }
}
