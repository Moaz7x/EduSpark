import 'package:edusparkv4/features/simple_todos/domain/entities/todo_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/forms/add_edit_todo_form_provider.dart';
import '../../utils/date_time_utils.dart';

/// A stateless form for adding or editing a Todo.
/// State is managed externally by the `todoFormProvider`.
class AddEditTodoForm extends ConsumerWidget {
  // The widget now accepts an optional TodoEntity.
  // This will be null for "add" mode and non-null for "edit" mode.
  final TodoEntity? todo;

  const AddEditTodoForm({super.key, this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // =======================================================================
    // THE FIX IS HERE:
    // We pass the `todo` from the widget into the provider family.
    // This gives us a specific instance of the provider for this form.
    // =======================================================================
    final formState = ref.watch(todoFormProvider(todo));
    final formNotifier = ref.read(todoFormProvider(todo).notifier);

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
              if (isNarrow) {
                return Column(
                  children: [
                    _buildPriorityDropdown(formState, formNotifier),
                    const SizedBox(height: 16),
                    _buildDueDateField(context, formState, pickDueDate),
                  ],
                );
              } else {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildPriorityDropdown(formState, formNotifier)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildDueDateField(context, formState, pickDueDate)),
                  ],
                );
              }
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
              // Pass the context to the submitForm method
              onPressed: formState.isLoading ? null : () => formNotifier.submitForm(context),
              label: Text(formState.isEditMode ? 'Save Changes' : 'Add Todo'),
              style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Helper method for Priority Dropdown
  Widget _buildPriorityDropdown(TodoFormState formState, TodoFormNotifier formNotifier) {
    return DropdownButtonFormField<String>(
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
    );
  }

  // Helper method for Due Date Picker
  Widget _buildDueDateField(BuildContext context, TodoFormState formState, VoidCallback pickDueDate) {
    return GestureDetector(
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
    );
  }
}
