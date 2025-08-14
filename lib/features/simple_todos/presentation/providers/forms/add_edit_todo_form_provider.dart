import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// In a real app, you would import your entity
// import '../../../domain/entities/todo_entity.dart';

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

  TodoFormState copyWith({String? selectedPriority, DateTime? selectedDueDate, bool? isLoading}) {
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
  TodoFormNotifier(/* TodoEntity? initialTodo */)
    : super(
        TodoFormState(
          formKey: GlobalKey<FormState>(),
          titleController: TextEditingController(/* text: initialTodo?.title ?? '' */),
          descriptionController: TextEditingController(/* text: initialTodo?.description ?? '' */),
          // isEditMode: initialTodo != null,
          // selectedPriority: initialTodo?.priority ?? 'Medium',
          // selectedDueDate: initialTodo?.dueDate,
        ),
      );

  void setPriority(String priority) {
    state = state.copyWith(selectedPriority: priority);
  }

  void setDueDate(DateTime dueDate) {
    state = state.copyWith(selectedDueDate: dueDate);
  }

  void submitForm() {
    if (state.formKey.currentState!.validate()) {
      state = state.copyWith(isLoading: true);

      // TODO: Call the appropriate use case (create or update)
      // final todo = TodoEntity(
      //   title: state.titleController.text,
      //   description: state.descriptionController.text,
      //   priority: state.selectedPriority,
      //   dueDate: state.selectedDueDate,
      //   ...
      // );
      //
      // if (state.isEditMode) {
      //   ref.read(updateTodoUseCaseProvider).call(todo);
      // } else {
      //   ref.read(createTodoUseCaseProvider).call(todo);
      // }

      // Simulate network call
      Future.delayed(const Duration(seconds: 1), () {
        state = state.copyWith(isLoading: false);
        // Pop navigation after successful submission
      });
    }
  }

  // It's crucial to dispose of controllers when the provider is disposed.
  @override
  void dispose() {
    state.titleController.dispose();
    state.descriptionController.dispose();
    super.dispose();
  }
}

/// Riverpod provider for the TodoFormNotifier.
///
/// We use .autoDispose to ensure the form's state is cleared when the
/// user leaves the screen, preventing stale data.
final todoFormProvider = StateNotifierProvider.autoDispose<TodoFormNotifier, TodoFormState>((ref) {
  // TODO: When editing, you would pass the existing todo here.
  // final todoToEdit = ref.watch(selectedTodoProvider);
  // return TodoFormNotifier(todoToEdit);
  return TodoFormNotifier();
});
