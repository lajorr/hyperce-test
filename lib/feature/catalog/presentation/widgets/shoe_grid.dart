import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce_test/feature/catalog/domain/entity/shoe.dart';
import 'package:hyperce_test/feature/catalog/presentation/widgets/shoe_card.dart';

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
      itemBuilder: (_, index) => ShoeCard(shoe: shoeList[index]),
    );
  }
}
