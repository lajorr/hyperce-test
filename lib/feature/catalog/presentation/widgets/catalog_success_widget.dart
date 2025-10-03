import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce_test/feature/catalog/domain/entity/shoe.dart';
import 'package:hyperce_test/feature/catalog/presentation/cubits/filter/filter_cubit.dart';
import 'package:hyperce_test/feature/catalog/presentation/widgets/category_chips.dart';
import 'package:hyperce_test/feature/catalog/presentation/widgets/shoe_grid.dart';

class CatalogSuccessWidget extends StatelessWidget {
  const CatalogSuccessWidget({
    super.key,
    required this.data,
    required this.brands,
  });
  final List<Shoe> data;
  final List<String> brands;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FilterCubit()..applyBrandFilter(shoes: data, brand: "All"),
      child: BlocBuilder<FilterCubit, FilterState>(
        builder: (context, state) {
          final filteredShoes = state.filteredShoes;
          return Column(
            children: [
              SizedBox(height: 24.h),
              CategoryChips(brands: brands),
              SizedBox(height: 30.h),
              ShoeGrid(shoeList: filteredShoes),
              SizedBox(height: 24.h),
            ],
          );
        },
      ),
    );
  }
}
