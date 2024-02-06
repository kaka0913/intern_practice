import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EventListScreen extends StatelessWidget {
  const EventListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => context.go('/sub'),
          child: const Text('Go to Sub ')),
        ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Event $index'),
            );
          },
        ),
      ],
    );
  }
}
