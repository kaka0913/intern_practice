import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


final prefsProvider = FutureProvider<SharedPreferences>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs;
});

final counterProvider = StateProvider<int>((ref) => 0);

class SharedPreferencesDemo extends ConsumerWidget {
  const SharedPreferencesDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = ref.watch(counterProvider.notifier);
    final prefctures = ref.watch(prefsProvider);

    return Scaffold(
      body: Center(
        child: prefctures.when(
          data: (prefs) {
            final counter = prefs.getInt('counter') ?? 0;
            counterState.state = counter;
            return Text(
              'Button tapped ${ref.watch(counterProvider)} time${counter == 1 ? '' : 's'}.\n\n'
              'This should persist across restarts.',
            );
          },
          loading: () =>  const CircularProgressIndicator(),
          error: (err, _) => Text('Error: $err'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          counterState.state++;
          prefctures.whenData((prefs) async {
            await prefs.setInt('counter', counterState.state);
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
