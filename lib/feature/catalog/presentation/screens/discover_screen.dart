import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperce_test/config/services/service_locator.dart';
import 'package:hyperce_test/core/constants/app_assets.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';
import 'package:hyperce_test/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:hyperce_test/feature/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:hyperce_test/feature/catalog/presentation/widgets/catalog_success_widget.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  late CatalogBloc _catalogBloc;

  @override
  void initState() {
    super.initState();
    _catalogBloc = getIt<CatalogBloc>();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _catalogBloc.add(CatalogEvent.loadShoes());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _catalogBloc,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Discover', style: AppTextStyles.heading700),
                    GestureDetector(
                      onTap: () {
                        context.push('/cart');
                      },
                      child: Badge(
                        backgroundColor: Colors.transparent,
                        offset: Offset(4, -1),
                        isLabelVisible: context
                            .watch<CartCubit>()
                            .state
                            .cartItems
                            .isNotEmpty,
                        padding: EdgeInsets.zero,
                        label: SizedBox.square(
                          dimension: 8.w,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.error500,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        child: SizedBox.square(
                          dimension: 24.w,
                          child: SvgPicture.asset(
                            AppAssets.bagIcon,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                BlocBuilder<CatalogBloc, CatalogState>(
                  builder: (context, state) {
                    return state.when(
                      loading: () => SizedBox(
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      error: (msg) => SizedBox(
                        height: MediaQuery.of(context).size.height * 0.9,

                        child: Center(
                          child: Text(msg ?? "Something went wrong."),
                        ),
                      ),
                      success: (data, brands) =>
                          CatalogSuccessWidget(data: data, brands: brands),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
