import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';
import 'package:hyperce_test/feature/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:hyperce_test/feature/catalog/presentation/cubits/filter/filter_cubit.dart';

class CategoryChips extends StatefulWidget {
  const CategoryChips({super.key, required this.brands});

  final List<String> brands;

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  @override
  Widget build(BuildContext context) {
    final catalogState = context.watch<CatalogBloc>().state;
    if (catalogState is Success) {
      final data = catalogState.data;

      final filterState = context.watch<FilterCubit>().state;
      return SizedBox(
        height: 30.h,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: widget.brands.length,
          separatorBuilder: (_, _) => SizedBox(width: 20.w),
          itemBuilder: (context, index) {
            final active = widget.brands[index] == filterState.selectedBrand;
            return GestureDetector(
              onTap: () {
                context.read<FilterCubit>().applyBrandFilter(
                  shoes: data,
                  brand: widget.brands[index],
                );
              },
              child: Text(
                widget.brands[index],
                style: AppTextStyles.heading600.copyWith(
                  color: active ? AppColors.neutral500 : AppColors.neutral300,
                ),
              ),
            );
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
