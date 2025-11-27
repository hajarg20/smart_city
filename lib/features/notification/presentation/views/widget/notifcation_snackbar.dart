// features/notification/presentation/views/widgets/notification_snackbar.dart
import 'package:flutter/material.dart';

class NotificationSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    String? actionLabel,
    VoidCallback? onUndo,
    required MaterialColor backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.grey.shade800,
        action:
            actionLabel != null
                ? SnackBarAction(
                  label: actionLabel,
                  textColor: Colors.yellow,
                  onPressed: () {
                    onUndo?.call();
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                )
                : null,
      ),
    );
  }
}
