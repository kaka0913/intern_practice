// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:intern_practice/account_detail_screen.dart';
import 'package:intern_practice/account_screen.dart';
import 'package:intern_practice/scafford_with_navbar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavbar(navigationShell);
        },
        // branchesとは、IndexedStackの子ウィジェットとして表示されるGoRouterのブランチを指定します。
        branches: [
          // ボトムナビゲーションバーのルート分岐1
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorKey,
            // このブランチルートを追加する
            // 各ルートとそのサブルート (利用可能な場合) 例: feed/uuid/details
            routes: <RouteBase>[
              GoRoute(
                path: '/',
                builder: (context, state) => const AccountScreen(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (context, state) {
                      return const AccountDetailScreen();
                    },
                  )
                ],
              ),
            ],
          ),
          // ボトムナビゲーションバーのルート分岐2
          StatefulShellBranch(
            routes: <RouteBase>[
              // このブランチルートを追加する
              // 各ルートとそのサブルート (利用可能な場合) 例: shope/uuid/details
              GoRoute(
                path: '/account-detail',
                builder: (context, state) {
                  return const AccountDetailScreen();
                },
              ),
            ],
          ),
          // ボトムナビゲーションバーのルート分岐3を追加
          StatefulShellBranch(
            routes: <RouteBase>[
              // このブランチルートを追加する
              // 各ルートとそのサブルート (利用可能な場合) 例: profile/uuid/details
              GoRoute(
                path: '/account-detail',
                builder: (context, state) {
                  return const AccountDetailScreen();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
