import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/todo_list_screen_provider.dart';

/// A stateless AppBar for the TodoListScreen.
/// It reads its state from and dispatches actions to the `todoListScreenProvider`.
class TodoListAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const TodoListAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider to get the current state.
    final screenState = ref.watch(todoListScreenProvider);
    // Read the notifier to call methods.
    final screenNotifier = ref.read(todoListScreenProvider.notifier);

    return AppBar(
      title: screenState.isSearching
          ? TextField(
              controller: screenNotifier.searchController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Search todos...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white54),
              ),
              style: const TextStyle(color: Colors.white, fontSize: 18),
              onChanged: screenNotifier.onSearchChanged,
            )
          : const Text('My Todos'),
      actions: [
        IconButton(
          icon: Icon(screenState.isSearching ? Icons.close : Icons.search),
          onPressed: screenNotifier.toggleSearch,
        ),
        if (!screenState.isSearching)
          PopupMenuButton<String>(
            onSelected: (value) {
              // TODO: Implement logic for menu item selection
            },
            itemBuilder: (BuildContext context) {
              return {'Filter', 'Sort by Date', 'Clear All'}.map((String choice) {
                return PopupMenuItem<String>(value: choice, child: Text(choice));
              }).toList();
            },
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
