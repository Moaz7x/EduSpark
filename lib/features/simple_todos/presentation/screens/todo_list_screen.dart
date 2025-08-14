import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/todo_list_screen_provider.dart';
import '../utils/modal_bottom_sheet_utils.dart';
import '../widgets/forms/add_edit_todo_form.dart';
import '../widgets/todo_list_screen/todo_list_app_bar.dart';
import '../widgets/todo_list_screen/todo_tab_view.dart';

/// A wrapper widget whose only purpose is to provide a Ticker for the TabController.
class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> with SingleTickerProviderStateMixin {
  // This is the key: we create the provider override here, passing `this` as the TickerProvider.
  late final StateNotifierProvider<TodoListScreenNotifier, TodoListScreenState> _provider;

  @override
  void initState() {
    super.initState();
    _provider = StateNotifierProvider<TodoListScreenNotifier, TodoListScreenState>(
      (ref) => TodoListScreenNotifier(this),
    );
  }

  @override
  Widget build(BuildContext context) {
    // We wrap the actual UI in a ProviderScope to override the provider.
    return ProviderScope(
      overrides: [
        todoListScreenProvider.overrideWith((ref) => ref.watch(_provider.notifier)),
      ],
      child: const _TodoListScreenView(),
    );
  }
}

/// The actual UI for the screen, now a stateless ConsumerWidget.
class _TodoListScreenView extends ConsumerWidget {
  const _TodoListScreenView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // The UI now watches the provider as usual.
    final screenState = ref.watch(todoListScreenProvider);
    final screenNotifier = ref.read(todoListScreenProvider.notifier);

    return Scaffold(
      appBar: const TodoListAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ModalBottomSheetUtils.showAppModalBottomSheet(
            context: context,
            title: 'Add New Todo',
            child: const AddEditTodoForm(),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: TodoTabView(
        // The TabController is now accessed directly from the notifier.
        tabController: screenNotifier.tabController,
        allTodos: screenState.allTodos,
        searchQuery: screenState.searchQuery,
      ),
    );
  }
}
