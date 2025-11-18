import 'package:flutter/material.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/utils/app_text_styls.dart';

class NotificationCard extends StatefulWidget {
  final String title;
  final Color backgroundColor;
  const NotificationCard({
    super.key,
    required this.title,
    required this.backgroundColor,
    required String message,
    required String date,
    required isRead,
  });

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: Card(
        color: Colors.white,
        elevation: 2,
        shadowColor: Colors.grey.shade200,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          leading: CircleAvatar(
            backgroundColor: AppColors.secondaryColor.withOpacity(0.15),
            child: const Icon(
              Icons.notifications,
              color: AppColors.secondaryColor,
            ),
          ),
          title: Text(widget.title, style: AppTextStyles.semiBold16),
        ),
      ),
    );
  }
}
