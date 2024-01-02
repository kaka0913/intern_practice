// Flutter imports:
import 'package:flutter/material.dart';

class AccountDetailScreen extends StatelessWidget {
  const AccountDetailScreen({super.key, this.label, this.child});

  final String? label;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      key: Key('feedPage'),
      body: Center(
        child: Text('Detail'),
      ),
    );
  }
}
