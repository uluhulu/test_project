import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/domain/models/product/product.dart';
import 'package:test_project/presentation/cart/cart_page.dart';
import 'package:test_project/presentation/category/category_page.dart';
import 'package:test_project/presentation/navigation/scaffold_with_nav_bar.dart';

import '../menu/menu_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/menu',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: [
        GoRoute(
          path: '/menu',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                child: const MenuPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutBack)
                        .animate(animation),
                    child: child,
                  );
                });
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'category',
              name: 'category',
              builder: (BuildContext context, GoRouterState state) {
                List<Product> productList = state.extra as List<Product>;
                return CategoryPage(
                  productList: productList,
                  title: state.queryParameters["title"] ?? "",
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: '/cart',
          builder: (BuildContext context, GoRouterState state) {
            return const CartPage();
          },
          routes: const <RouteBase>[],
        ),
      ],
    ),
  ],
);
