import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/forms/add_edit_todo_form_provider.dart';
import '../../utils/date_time_utils.dart';

/// A stateless form for adding or editing a Todo.
/// State is managed externally by the `todoFormProvider`.
class AddEditTodoForm extends ConsumerWidget {
  const AddEditTodoForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider to get the current state and the notifier to call methods.
    final formState = ref.watch(todoFormProvider);
    final formNotifier = ref.read(todoFormProvider.notifier);

    Future<void> pickDueDate() async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: formState.selectedDueDate ?? DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
      );
      if (picked != null && picked != formState.selectedDueDate) {
        formNotifier.setDueDate(picked);
      }
    }

    return Form(
      key: formState.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Title Field ---
          TextFormField(
            controller: formState.titleController,
            decoration: const InputDecoration(labelText: 'Title', border: OutlineInputBorder()),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Title cannot be empty.';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // --- Description Field ---
          TextFormField(
            controller: formState.descriptionController,
            decoration: const InputDecoration(
              labelText: 'Description (Optional)',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 16),

          // --- Responsive Priority and Due Date ---
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 350;
              return Flex(
                direction: isNarrow ? Axis.vertical : Axis.horizontal,
                children: [
                  // Priority Dropdown
                  Flexible(
                    child: DropdownButtonFormField<String>(
                      value: formState.selectedPriority,
                      decoration: const InputDecoration(
                        labelText: 'Priority',
                        border: OutlineInputBorder(),
                      ),
                      items: ['Low', 'Medium', 'High']
                          .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                          .toList(),
                      onChanged: (value) => formNotifier.setPriority(value!),
                      validator: (v) => v == null ? 'Please select a priority.' : null,
                    ),
                  ),
                  SizedBox(width: isNarrow ? 0 : 16, height: isNarrow ? 16 : 0),
                  // Due Date Picker
                  Flexible(
                    child: GestureDetector(
                      onTap: pickDueDate,
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Due Date',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                formState.selectedDueDate == null
                                    ? 'Not Set'
                                    : DateTimeUtils.formatDate(formState.selectedDueDate),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Icon(Icons.calendar_today, size: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 24),

          // --- Submit Button ---
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              icon: formState.isLoading
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  : Icon(formState.isEditMode ? Icons.save_alt : Icons.add_task),
              onPressed: formState.isLoading ? null : formNotifier.submitForm,
              label: Text(formState.isEditMode ? 'Save Changes' : 'Add Todo'),
              style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
