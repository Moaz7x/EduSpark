import 'package:edusparkv4/features/simple_todos/presentation/utils/date_time_utils.dart';
import 'package:edusparkv4/features/simple_todos/presentation/utils/modal_bottom_sheet_utils.dart';
import 'package:edusparkv4/features/simple_todos/presentation/widgets/forms/add_edit_reminder_form.dart';
import 'package:flutter/material.dart';

class ReminderItemWidget extends StatelessWidget {
  // final ReminderEntity reminder;
  final Map<String, dynamic> reminder; // Using map for prototype

  const ReminderItemWidget({super.key, required this.reminder});

  @override
  Widget build(BuildContext context) {
    final itemKey = Key('reminder_${reminder['id']}');
    return Dismissible(
      key: itemKey,
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        // TODO: Implement delete reminder logic
      },
      background: Container(
        color: Colors.red.shade900,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete_sweep_outlined, color: Colors.white),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: ListTile(
          leading: const Icon(Icons.notifications_active_outlined),
          title: Text(reminder['message']),
          subtitle: Text(DateTimeUtils.formatTime(reminder['time'])),
          trailing: IconButton(
            icon: const Icon(Icons.edit_outlined, size: 20, color: Colors.grey),
            onPressed: () {
              // Open the edit modal for the reminder
              ModalBottomSheetUtils.showAppModalBottomSheet(
                context: context,
                title: 'Edit Reminder',
                child: const AddEditReminderForm(/* reminder: actualReminderObject */),
              );
            },
          ),
        ),
      ),
    );
  }
}
