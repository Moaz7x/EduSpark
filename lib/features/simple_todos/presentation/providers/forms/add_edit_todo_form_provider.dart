import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/todo_entity.dart';
import '../../../data/providers/simple_todos_data_providers.dart';
import '../todo_list_screen_provider.dart';

/// Represents the state of the Todo form.
@immutable
class TodoFormState {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final String selectedPriority;
  final DateTime? selectedDueDate;
  final bool isEditMode;
  final bool isLoading;

  const TodoFormState({
    required this.formKey,
    required this.titleController,
    required this.descriptionController,
    this.selectedPriority = 'Medium',
    this.selectedDueDate,
    this.isEditMode = false,
    this.isLoading = false,
  });

  TodoFormState copyWith({
    String? selectedPriority,
    DateTime? selectedDueDate,
    bool? isLoading,
  }) {
    return TodoFormState(
      formKey: formKey,
      titleController: titleController,
      descriptionController: descriptionController,
      selectedPriority: selectedPriority ?? this.selectedPriority,
      selectedDueDate: selectedDueDate ?? this.selectedDueDate,
      isEditMode: isEditMode,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

/// Notifier to manage the state of the AddEditTodoForm.
class TodoFormNotifier extends StateNotifier<TodoFormState> {
  // We need Ref to call use cases and refresh other providers.
  final Ref _ref;

  TodoFormNotifier(this._ref, {TodoEntity? initialTodo})
      : super(
          TodoFormState(
            formKey: GlobalKey<FormState>(),
            titleController: TextEditingController(text: initialTodo?.title ?? ''),
            descriptionController: TextEditingController(text: initialTodo?.description ?? ''),
            isEditMode: initialTodo != null,
            selectedPriority: initialTodo?.priority ?? 'Medium',
            selectedDueDate: initialTodo?.dueDate,
          ),
        );

  void setPriority(String priority) {
    state = state.copyWith(selectedPriority: priority);
  }

  void setDueDate(DateTime dueDate) {
    state = state.copyWith(selectedDueDate: dueDate);
  }

  /// Submits the form to create or update a Todo.
  Future<void> submitForm(BuildContext context) async {
    if (!state.formKey.currentState!.validate()) {
      return;
    }

    state = state.copyWith(isLoading: true);

    // In a real app, you would also handle the update case.
    // For now, we are focusing on the "Create" functionality.
    if (state.isEditMode) {
      // TODO: Implement update logic using the updateTodoUseCase
    } else {
      await _createTodo(context);
    }
  }

  Future<void> _createTodo(BuildContext context) async {
    final createTodoUseCase = _ref.read(createTodoUseCaseProvider);

    final newTodo = TodoEntity(
      title: state.titleController.text,
      description: state.descriptionController.text,
      priority: state.selectedPriority,
      dueDate: state.selectedDueDate,
      isCompleted: false,
      order: '', // Typically handled by the backend/repository
      createdAt: DateTime.now(),
    );

    final result = await createTodoUseCase.call(newTodo);

    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create todo: ${failure.message}'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      },
      (createdTodo) {
        state = state.copyWith(isLoading: false);
        Navigator.of(context).pop();
        // Invalidate the list provider to force a refresh with the new data.
        // This is a powerful Riverpod feature for ensuring data consistency.
        _ref.invalidate(todoListScreenProvider);
      },
    );
  }

  @override
  void dispose() {
    state.titleController.dispose();
    state.descriptionController.dispose();
    super.dispose();
  }
}

/// Riverpod provider for the TodoFormNotifier.
/// Using .autoDispose ensures the form's state is cleared when it's no longer in use.
final todoFormProvider =
    StateNotifierProvider.autoDispose.family<TodoFormNotifier, TodoFormState, TodoEntity?>(
  (ref, initialTodo) {
    // Pass the ref and an optional initialTodo for editing.
    return TodoFormNotifier(ref, initialTodo: initialTodo);
  },
);
