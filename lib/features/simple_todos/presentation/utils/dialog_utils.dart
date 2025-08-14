import 'package:flutter/material.dart';

/// An enhanced utility class for showing styled and functional dialogs.
class DialogUtils {
  /// Shows a generic confirmation dialog with customizable text and styling.
  static Future<bool?> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required Widget content,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    bool isDestructive = false,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: content,
          actions: <Widget>[
            TextButton(child: Text(cancelText), onPressed: () => Navigator.of(context).pop(false)),
            FilledButton(
              style: isDestructive
                  ? FilledButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.error)
                  : null,
              onPressed: () {
                // TODO: Implement the confirmed action
                Navigator.of(context).pop(true);
              },
              child: Text(confirmText),
            ),
          ],
        );
      },
    );
  }

  /// Shows a styled success dialog.
  static Future<void> showSuccessDialog({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    return _showStyledDialog(
      context: context,
      title: title,
      message: message,
      icon: Icons.check_circle,
      iconColor: Colors.green.shade400,
    );
  }

  /// Shows a styled error dialog.
  static Future<void> showErrorDialog({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    return _showStyledDialog(
      context: context,
      title: title,
      message: message,
      icon: Icons.error,
      iconColor: Theme.of(context).colorScheme.error,
    );
  }

  /// Private helper to build styled dialogs (Success, Error, Info).
  static Future<void> _showStyledDialog({
    required BuildContext context,
    required String title,
    required String message,
    required IconData icon,
    required Color iconColor,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          icon: Icon(icon, color: iconColor, size: 48),
          title: Text(title, textAlign: TextAlign.center),
          content: Text(message, textAlign: TextAlign.center),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        );
      },
    );
  }
}
