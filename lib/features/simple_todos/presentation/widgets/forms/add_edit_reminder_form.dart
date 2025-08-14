import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/forms/add_edit_reminder_form_provider.dart';
import '../../utils/date_time_utils.dart';

/// A stateless form for adding or editing a Reminder.
/// State is managed externally by the `reminderFormProvider`.
class AddEditReminderForm extends ConsumerWidget {
  const AddEditReminderForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider to get the current state and the notifier to call methods.
    final formState = ref.watch(reminderFormProvider);
    final formNotifier = ref.read(reminderFormProvider.notifier);

    Future<void> pickReminderTime() async {
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: formState.selectedTime ?? DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
      );
      if (pickedDate == null) return;

      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(formState.selectedTime ?? DateTime.now()),
      );
      if (pickedTime == null) return;

      final newTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      formNotifier.setReminderTime(newTime);
    }

    return Form(
      key: formState.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: formState.messageController,
            decoration: const InputDecoration(labelText: 'Reminder Message'),
            validator: (value) =>
                (value == null || value.trim().isEmpty) ? 'Message cannot be empty.' : null,
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: pickReminderTime,
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Reminder Time',
                border: OutlineInputBorder(),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formState.selectedTime == null
                        ? 'Select Time'
                        : DateTimeUtils.formatDateTime(formState.selectedTime),
                  ),
                  const Icon(Icons.calendar_today, size: 20),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: formState.recurrencePattern,
            decoration: const InputDecoration(labelText: 'Recurrence'),
            items: [
              'Does not repeat',
              'Daily',
              'Weekly',
              'Monthly',
            ].map((pattern) => DropdownMenuItem(value: pattern, child: Text(pattern))).toList(),
            onChanged: (value) {
              if (value != null) {
                formNotifier.setRecurrence(value);
              }
            },
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
                  : Icon(formState.isEditMode ? Icons.save_alt : Icons.add_alert),
              onPressed: formState.isLoading ? null : () => formNotifier.submitForm(context),
              label: Text(formState.isEditMode ? 'Save Reminder' : 'Add Reminder'),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
