// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext BuildContext) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: 'Favorites',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0: // 1番左のタブが選ばれた時の画面
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    leading: Icon(CupertinoIcons.back),
                    middle: Text('Page Title'), // ナビゲーションバーの中央に表示されるウィジェット
                  ),
                  child: SearchScreen(), // 表示したい画面のWidget
                );
              },
            );
          case 1: // ほぼ同じなので割愛

          default:
            return SizedBox(
              child: Center(child: Text('Invalid index: $index')),
            );
        }
      },
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ギフトを探す'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ギフトを探す',
            ),
          ],
        ),
      ),
    );
  }
}
