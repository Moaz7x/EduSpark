import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/todo_list_screen_provider.dart';
import '../utils/modal_bottom_sheet_utils.dart';
import '../widgets/forms/add_edit_todo_form.dart';
import '../widgets/todo_list_screen/todo_list_app_bar.dart';
import '../widgets/todo_list_screen/todo_tab_view.dart';

/// A thin StatefulWidget wrapper whose ONLY purpose is to provide the TickerProvider.
class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

// =======================================================================
// THE FIX IS HERE:
// We change the mixin from 'SingleTickerProviderStateMixin' to the more
// robust 'TickerProviderStateMixin'.
// =======================================================================
class _TodoListScreenState extends State<TodoListScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // The actual UI is built by this stateless child widget.
    // We pass `this` (which is now a full TickerProvider) as the family parameter.
    return _TodoListScreenView(vsync: this);
  }
}

/// The actual UI for the screen, now a stateless ConsumerWidget.
class _TodoListScreenView extends ConsumerWidget {
  final TickerProvider vsync;
  const _TodoListScreenView({required this.vsync});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // The UI now watches the provider family, passing the TickerProvider.
    final screenState = ref.watch(todoListScreenProvider(vsync));
    final screenNotifier = ref.read(todoListScreenProvider(vsync).notifier);

    return Scaffold(
      appBar: TodoListAppBar(vsync: vsync),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ModalBottomSheetUtils.showAppModalBottomSheet(
            context: context,
            title: 'Add New Todo',
            child: const AddEditTodoForm(todo: null),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: TodoTabView(
        // The TabController is now accessed directly from the notifier.
        tabController: screenNotifier.tabController,
        todos: screenState.todos,
        searchQuery: screenState.searchQuery,
      ),
    );
  }
}
