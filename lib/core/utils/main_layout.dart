import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:smart_city/core/utils/page_view.dart';
import 'package:smart_city/core/widgets/bottom_nav_bar.dart';

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

  void _onNavTap(int index) {
    // update page view and notch controller
    _pageController.jumpToPage(index);
    _navController.index = index;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: HomePagesView(
        pageController: _pageController,
        onNavTap: _onNavTap, // pass callback to pages
      ),
      bottomNavigationBar: CustomBottomNavBar(
        controller: _navController,
        onTap: _onNavTap,
      ),
    );
  }
}
