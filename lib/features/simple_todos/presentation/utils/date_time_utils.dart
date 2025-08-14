import 'package:intl/intl.dart';

/// Utility class for handling date and time formatting and operations.
class DateTimeUtils {
  /// Formats a DateTime into a user-friendly date string.
  /// Example: August 14, 2025
  static String formatDate(DateTime? date) {
    if (date == null) return 'No Date';
    return DateFormat.yMMMMd().format(date);
  }

  /// Formats a DateTime into a user-friendly time string.
  /// Example: 10:30 AM
  static String formatTime(DateTime? time) {
    if (time == null) return 'No Time';
    return DateFormat.jm().format(time);
  }

  /// Formats a DateTime into a combined date and time string.
  /// Example: Aug 14, 2025, 10:30 AM
  static String formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return 'N/A';
    return DateFormat.yMd().add_jm().format(dateTime);
  }

  /// Provides a relative time string from now.
  /// Examples: "Just now", "5 minutes ago", "Yesterday", "Tomorrow", "In 2 days"
  static String timeAgo(DateTime? date) {
    if (date == null) return 'N/A';

    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 5) {
      return 'Just now';
    } else if (difference.inMinutes < 1) {
      return '${difference.inSeconds}s ago';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24 && now.day == date.day) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays == 1 || (now.day - date.day == 1 && difference.inHours < 48)) {
      return 'Yesterday';
    } else if (difference.inDays > 1 && difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return formatDate(date);
    }
  }

  /// Checks if a date is today.
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month && date.day == now.day;
  }
}
