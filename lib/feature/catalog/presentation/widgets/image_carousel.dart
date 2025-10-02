import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/feature/catalog/presentation/widgets/color_selector.dart';
import 'package:hyperce_test/feature/catalog/presentation/widgets/page_indicator.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({
    super.key,
    required this.images,
    required this.colorVariants,
  });
  final List<String> images;
  final List<String> colorVariants;

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 315.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: ColoredBox(
          color: AppColors.neutral500.withValues(alpha: 0.04),
          child: Stack(
            children: [
              PageView.builder(
                itemCount: widget.images.length,
                onPageChanged: (idx) {
                  setState(() {
                    index = idx;
                  });
                },
                itemBuilder: (_, i) => Center(
                  child: Image.asset(widget.images[i], fit: BoxFit.cover),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 26,
                child: PageIndicator(
                  imageCount: widget.images.length,
                  currentIndex: index,
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: ColorSelector(colors: widget.colorVariants),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
