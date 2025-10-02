import 'package:go_router/go_router.dart';
import 'package:hyperce_test/feature/cart/presentation/screens/cart_screen.dart';
import 'package:hyperce_test/feature/catalog/domain/entity/shoe.dart';
import 'package:hyperce_test/feature/catalog/presentation/screens/discover_screen.dart';
import 'package:hyperce_test/feature/catalog/presentation/screens/product_detail_screen.dart';

final GoRouter goRouterConfig = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const DiscoverScreen()),
    GoRoute(
      path: '/shoe-details',
      builder: (context, state) {
        final shoe = state.extra as Shoe;
        return ProductDetailScreen(shoe: shoe);
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) {
        return CartScreen();
      },
    ),
  ],
);
