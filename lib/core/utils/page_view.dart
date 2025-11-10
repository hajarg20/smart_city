import 'package:flutter/material.dart';
import 'package:smart_city/features/home/presentation/views/home_view.dart';
import 'package:smart_city/features/notification/presentation/views/notification_view.dart';

class HomePagesView extends StatelessWidget {
  final PageController pageController;
  final void Function(int) onNavTap;

  const HomePagesView({
    super.key,
    required this.pageController,
    required this.onNavTap,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        homeView(),
        const NotificationView(),
        const Center(
          child: Text(
            'Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
