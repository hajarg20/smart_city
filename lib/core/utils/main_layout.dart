import 'package:flutter/material.dart';
import 'package:smart_city/core/utils/page_view.dart';
import 'package:smart_city/core/widgets/bottom_nav_bar.dart';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final PageController _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _navController = NotchBottomBarController(
    index: 0,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavTap(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: HomePagesView(pageController: _pageController),
      bottomNavigationBar: CustomBottomNavBar(
        controller: _navController,
        onTap: _onNavTap,
      ),
    );
  }
}
