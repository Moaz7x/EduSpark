import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/todo_list_screen_provider.dart';

/// A stateless AppBar for the TodoListScreen.
/// It reads its state from and dispatches actions to the `todoListScreenProvider`.
class TodoListAppBar extends ConsumerWidget implements PreferredSizeWidget {
  // It now requires the TickerProvider to know which provider instance to use.
  final TickerProvider vsync;

  const TodoListAppBar({super.key, required this.vsync});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // =======================================================================
    // THE FIX IS HERE:
    // We pass the `vsync` ticker into the provider family.
    // This ensures the AppBar is listening to the exact same provider
    // instance as the main screen view.
    // =======================================================================
    final screenState = ref.watch(todoListScreenProvider(vsync));
    final screenNotifier = ref.read(todoListScreenProvider(vsync).notifier);

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
              // The onChanged listener is already set up in the provider,
              // so we don't need to call it here.
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
