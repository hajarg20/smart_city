import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });
  final String title;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title), leading: Icon(Icons.home_work));
  }
}
