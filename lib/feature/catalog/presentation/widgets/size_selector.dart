import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/core/extensions/double_ext.dart';
import 'package:hyperce_test/feature/catalog/presentation/cubits/shoe_variant/shoe_variant_cubit.dart';

import '../../../../core/theme/app_text_styles.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key, required this.sizes});
  final List<double> sizes;

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  @override
  void initState() {
    super.initState();
    context.read<ShoeVariantCubit>().changeSize(widget.sizes.first);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 15.w,
      runSpacing: 10.h,
      children: List.generate(widget.sizes.length, (i) {
        final size = widget.sizes[i];
        final isSelected =
            context.watch<ShoeVariantCubit>().state.selectedSize == size;
        return GestureDetector(
          onTap: () => context.read<ShoeVariantCubit>().changeSize(size),
          child: SizedBox.square(
            dimension: 40.w,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xffE7E7E7)),
                color: isSelected ? Colors.black : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  size.toFormattedString(),
                  style: AppTextStyles.heading300.copyWith(
                    color: isSelected ? Colors.white : AppColors.neutral400,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
