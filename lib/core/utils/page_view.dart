import 'package:flutter/material.dart';
import 'package:smart_city/features/home/presentation/views/home_view.dart';

class HomePagesView extends StatelessWidget {
  final PageController pageController;

  const HomePagesView({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        homeView(),
        Center(
          child: Text(
            '⭐ Utils',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            '🔔 Notifications',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            '👤 Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
