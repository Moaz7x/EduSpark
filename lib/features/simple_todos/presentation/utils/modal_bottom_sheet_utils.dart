import 'package:flutter/material.dart';

/// An enhanced utility class for showing modal bottom sheets.
class ModalBottomSheetUtils {
  /// Shows a modal bottom sheet with a given child widget and optional title.
  static Future<T?> showAppModalBottomSheet<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    bool isScrollControlled = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20,
            left: 24,
            right: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Draggable handle
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              // Optional Title
              if (title != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(title, style: Theme.of(context).textTheme.headlineSmall),
                ),
              // Content
              Flexible(child: SingleChildScrollView(child: child)),
            ],
          ),
        );
      },
    );
  }
}

/// A form for adding or editing a Todo, reflecting the necessary fields from TodoModel.
