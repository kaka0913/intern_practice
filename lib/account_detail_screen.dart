// Flutter imports:
import 'package:flutter/material.dart';

class AccountDetailScreen extends StatelessWidget {
  const AccountDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Center(
            child: Text('Item $index'),
          );
        },
      ),
    );
  }
}
