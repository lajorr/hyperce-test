import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce_test/config/route/go_router_config.dart';
import 'package:hyperce_test/config/services/service_locator.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';
import 'package:hyperce_test/feature/cart/presentation/cubit/cart_cubit.dart';

void main() {
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (_, __) => BlocProvider(
        create: (context) => CartCubit(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: goRouterConfig,
          scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Urbanist',
            primaryColor: AppColors.neutral500,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.neutral500,
              primary: AppColors.neutral500,
            ),
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
