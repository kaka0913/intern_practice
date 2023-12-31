// Flutter imports:
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(80),
          child: Column(
            children: [
              const Center(
                child: Text('Account'),
              ),
              ElevatedButton(
                onPressed: () => context.push('/account/details'),
                child:const Text('Go to Account Details'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
