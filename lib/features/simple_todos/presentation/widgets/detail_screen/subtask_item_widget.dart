import 'package:edusparkv4/features/simple_todos/presentation/utils/modal_bottom_sheet_utils.dart';
import 'package:edusparkv4/features/simple_todos/presentation/widgets/forms/add_edit_subtask_form.dart';
import 'package:flutter/material.dart';

class SubtaskItemWidget extends StatelessWidget {
  // final SubtaskEntity subtask;
  final Map<String, dynamic> subtask; // Using map for prototype

  const SubtaskItemWidget({super.key, required this.subtask});

  @override
  Widget build(BuildContext context) {
    final itemKey = Key('subtask_${subtask['id']}');
    return Dismissible(
      key: itemKey,
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        // TODO: Implement delete subtask logic
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Subtask "${subtask['title']}" deleted')));
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
          leading: Checkbox(
            value: subtask['isCompleted'],
            onChanged: (v) {
              // TODO: Implement toggle completion logic
            },
          ),
          title: Text(subtask['title']),
          trailing: IconButton(
            icon: const Icon(Icons.edit_outlined, size: 20, color: Colors.grey),
            onPressed: () {
              // Open the edit modal for the subtask
              ModalBottomSheetUtils.showAppModalBottomSheet(
                context: context,
                title: 'Edit Subtask',
                child: const AddEditSubtaskForm(/* subtask: actualSubtaskObject */),
              );
            },
          ),
        ),
      ),
    );
  }
}
