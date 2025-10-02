import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperce_test/config/services/service_locator.dart';
import 'package:hyperce_test/core/constants/app_assets.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';
import 'package:hyperce_test/feature/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:hyperce_test/feature/catalog/presentation/widgets/category_chips.dart';
import 'package:hyperce_test/feature/catalog/presentation/widgets/shoe_grid.dart';

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
                      child: SvgPicture.asset(AppAssets.bagIcon),
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
                      success: (data, brands) => Column(
                        children: [
                          SizedBox(height: 24.h),
                          CategoryChips(brands: brands),
                          SizedBox(height: 30.h),
                          ShoeGrid(shoeList: data),
                          SizedBox(height: 24.h),
                        ],
                      ),
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
