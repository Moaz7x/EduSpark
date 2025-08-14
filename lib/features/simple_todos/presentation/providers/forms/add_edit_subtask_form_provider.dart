import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// In a real app, you would import your entity
// import '../../../domain/entities/subtask_entity.dart';

/// Represents the state of the Subtask form.
@immutable
class SubtaskFormState {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController notesController;
  final TextEditingController minutesController;
  final bool isEditMode;
  final bool isLoading;

  const SubtaskFormState({
    required this.formKey,
    required this.titleController,
    required this.notesController,
    required this.minutesController,
    this.isEditMode = false,
    this.isLoading = false,
  });

  SubtaskFormState copyWith({bool? isLoading}) {
    return SubtaskFormState(
      formKey: formKey,
      titleController: titleController,
      notesController: notesController,
      minutesController: minutesController,
      isEditMode: isEditMode,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

/// Notifier to manage the state of the AddEditSubtaskForm.
class SubtaskFormNotifier extends StateNotifier<SubtaskFormState> {
  SubtaskFormNotifier(/* SubtaskEntity? initialSubtask */)
    : super(
        SubtaskFormState(
          formKey: GlobalKey<FormState>(),
          titleController: TextEditingController(/* text: initialSubtask?.title ?? '' */),
          notesController: TextEditingController(/* text: initialSubtask?.notes ?? '' */),
          minutesController: TextEditingController(
            /* text: initialSubtask?.estimatedMinutes ?? '' */
          ),
          // isEditMode: initialSubtask != null,
        ),
      );

  void submitForm() {
    if (state.formKey.currentState!.validate()) {
      state = state.copyWith(isLoading: true);

      // TODO: Call the appropriate use case (create or update subtask)
      // final subtask = SubtaskEntity(
      //   title: state.titleController.text,
      //   notes: state.notesController.text,
      //   estimatedMinutes: state.minutesController.text,
      //   ...
      // );

      // Simulate network call
      Future.delayed(const Duration(seconds: 1), () {
        state = state.copyWith(isLoading: false);
        // Pop navigation after successful submission
      });
    }
  }

  @override
  void dispose() {
    state.titleController.dispose();
    state.notesController.dispose();
    state.minutesController.dispose();
    super.dispose();
  }
}

/// Riverpod provider for the SubtaskFormNotifier.
final subtaskFormProvider =
    StateNotifierProvider.autoDispose<SubtaskFormNotifier, SubtaskFormState>((ref) {
      // TODO: When editing, you would pass the existing subtask here.
      // final subtaskToEdit = ref.watch(selectedSubtaskProvider);
      // return SubtaskFormNotifier(subtaskToEdit);
      return SubtaskFormNotifier();
    });
