import 'package:go_router/go_router.dart';
import 'package:hyperce_test/feature/catalog/presentation/screens/discover_screen.dart';

final GoRouter goRouterConfig = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const DiscoverScreen()),
  ],
);
