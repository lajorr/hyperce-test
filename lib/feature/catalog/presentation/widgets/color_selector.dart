import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/core/extensions/color_ext.dart';
import 'package:hyperce_test/feature/catalog/domain/entity/shoe.dart';
import 'package:hyperce_test/feature/catalog/presentation/cubits/shoe_variant/shoe_variant_cubit.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector({super.key, required this.colors});

  final List<ItemColor> colors;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  @override
  void initState() {
    super.initState();
    context.read<ShoeVariantCubit>().changeColor(widget.colors.first);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.r),
        child: ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            child: Row(
              spacing: 10.w,
              children: [
                ...widget.colors.map((color) {
                  final isSelected =
                      context.watch<ShoeVariantCubit>().state.selectedColor ==
                      color;
                  final isWhite = color.name.toLowerCase() == "white";
                  return GestureDetector(
                    onTap: () {
                      context.read<ShoeVariantCubit>().changeColor(color);
                    },
                    child: Container(
                      width: 20.w,
                      height: 20.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: isWhite
                            ? Border.all(width: 2, color: AppColors.neutral200)
                            : null,
                        shape: BoxShape.circle,
                        color: color.hex.toColorObj(),
                      ),
                      child: isSelected
                          ? Icon(
                              Icons.check,
                              size: 14,
                              color: isWhite ? Colors.black : Colors.white,
                            )
                          : null,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
