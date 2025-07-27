import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:r6/search_provider.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(searchProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Search App')),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              ref.read(searchProvider.notifier).search(value);
            },
          ),

          // Text(search)
          Consumer(
            builder: (context, ref, child) {
              final search = ref.watch(searchProvider);
              return Text(search.search);
            },
          ),

          Consumer(
            builder: (context, ref, child) {
              // final search = ref.watch(searchProvider);
              final isChange = ref.watch(
                (searchProvider).select((state) => state.isChange),
              );
              return Switch(
                value: search.isChange,
                onChanged: (value) {
                  ref.read(searchProvider.notifier).onChange(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
