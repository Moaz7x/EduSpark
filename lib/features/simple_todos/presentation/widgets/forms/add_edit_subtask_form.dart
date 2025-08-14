import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/forms/add_edit_subtask_form_provider.dart';

/// A stateless form for adding or editing a Subtask.
/// State is managed externally by the `subtaskFormProvider`.
class AddEditSubtaskForm extends ConsumerWidget {
  const AddEditSubtaskForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider to get the current state and the notifier to call methods.
    final formState = ref.watch(subtaskFormProvider);
    final formNotifier = ref.read(subtaskFormProvider.notifier);

    return Form(
      key: formState.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: formState.titleController,
            decoration: const InputDecoration(labelText: 'Subtask Title'),
            validator: (value) =>
                (value == null || value.trim().isEmpty) ? 'Title cannot be empty.' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: formState.minutesController,
            decoration: const InputDecoration(labelText: 'Estimated Minutes (e.g., 30)'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: formState.notesController,
            decoration: const InputDecoration(labelText: 'Notes (Optional)'),
            maxLines: 3,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              icon: formState.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                  : Icon(formState.isEditMode ? Icons.save_alt : Icons.add_task),
              onPressed: formState.isLoading ? null : formNotifier.submitForm,
              label: Text(formState.isEditMode ? 'Save Subtask' : 'Add Subtask'),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
