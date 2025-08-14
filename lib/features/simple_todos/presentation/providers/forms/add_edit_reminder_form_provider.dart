import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// In a real app, you would import your entity
// import '../../../domain/entities/reminder_entity.dart';

/// Represents the state of the Reminder form.
@immutable
class ReminderFormState {
  final GlobalKey<FormState> formKey;
  final TextEditingController messageController;
  final DateTime? selectedTime;
  final bool isRecurring;
  final String recurrencePattern;
  final bool isEditMode;
  final bool isLoading;

  const ReminderFormState({
    required this.formKey,
    required this.messageController,
    this.selectedTime,
    this.isRecurring = false,
    this.recurrencePattern = 'Does not repeat',
    this.isEditMode = false,
    this.isLoading = false,
  });

  ReminderFormState copyWith({
    DateTime? selectedTime,
    bool? isRecurring,
    String? recurrencePattern,
    bool? isLoading,
  }) {
    return ReminderFormState(
      formKey: formKey,
      messageController: messageController,
      selectedTime: selectedTime ?? this.selectedTime,
      isRecurring: isRecurring ?? this.isRecurring,
      recurrencePattern: recurrencePattern ?? this.recurrencePattern,
      isEditMode: isEditMode,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

/// Notifier to manage the state of the AddEditReminderForm.
class ReminderFormNotifier extends StateNotifier<ReminderFormState> {
  ReminderFormNotifier(/* ReminderEntity? initialReminder */)
    : super(
        ReminderFormState(
          formKey: GlobalKey<FormState>(),
          messageController: TextEditingController(/* text: initialReminder?.message ?? '' */),
          // isEditMode: initialReminder != null,
          // selectedTime: initialReminder?.time,
          // isRecurring: initialReminder?.isRecurring ?? false,
          // recurrencePattern: initialReminder?.recurrencePattern ?? 'Does not repeat',
        ),
      );

  void setRecurrence(String pattern) {
    state = state.copyWith(recurrencePattern: pattern, isRecurring: pattern != 'Does not repeat');
  }

  void setReminderTime(DateTime time) {
    state = state.copyWith(selectedTime: time);
  }

  void submitForm(BuildContext context) {
    if (state.formKey.currentState!.validate()) {
      if (state.selectedTime == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Please select a reminder time.')));
        return;
      }

      state = state.copyWith(isLoading: true);

      // TODO: Call the appropriate use case (create or update reminder)
      // final reminder = ReminderEntity(...);

      // Simulate network call
      Future.delayed(const Duration(seconds: 1), () {
        state = state.copyWith(isLoading: false);
        Navigator.of(context).pop(); // Pop navigation after successful submission
      });
    }
  }

  @override
  void dispose() {
    state.messageController.dispose();
    super.dispose();
  }
}

/// Riverpod provider for the ReminderFormNotifier.
final reminderFormProvider =
    StateNotifierProvider.autoDispose<ReminderFormNotifier, ReminderFormState>((ref) {
      // TODO: When editing, you would pass the existing reminder here.
      // final reminderToEdit = ref.watch(selectedReminderProvider);
      // return ReminderFormNotifier(reminderToEdit);
      return ReminderFormNotifier();
    });
