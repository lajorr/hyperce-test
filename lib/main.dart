import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce_test/config/route/go_router_config.dart';
import 'package:hyperce_test/config/services/service_locator.dart';
import 'package:hyperce_test/core/constants/app_colors.dart';

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

      builder: (_, __) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: goRouterConfig,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Urbanist',
          primaryColor: AppColors.neutral500,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.neutral500,
            primary: AppColors.neutral500,
          ),
        ),
      ),
    );
  }
}
