// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:intern_practice/account_detail_screen.dart';
import 'package:intern_practice/account_screen.dart';
import 'package:intern_practice/my_home_page.dart';

final goRouter = GoRouter(
  // アプリが起動した時
  initialLocation: '/',
  // パスと画面の組み合わせ
  routes: [
    GoRoute(
      path: '/',
      name: 'initial',
      builder: (context, state) =>
          const MyHomePage(title: 'Flutter Demo Home Page'),
    ),
    // ex) アカウント画面
    GoRoute(
      path: '/account',
      name: 'account',
      builder: (context, state) => const AccountScreen(),
      routes: [
        GoRoute(
          path: 'details',
          name: 'accountDetails',
          builder: (context, state) => const AccountDetailScreen(),
        ),
      ],
    ),
    // ex) アカウント詳細画面
    GoRoute(
      path: '/account-detail',
      name: 'accountDetail',
      builder: (context, state) => const AccountDetailScreen(),
    ),
  ],
  // 遷移ページがないなどのエラーが発生した時に、このページに行く
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(state.error.toString()),
    ),
  ),
);
