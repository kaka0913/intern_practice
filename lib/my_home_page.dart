// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          // ex) アカウント画面へ遷移
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () => context.push('/account'),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/account-detail'),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
