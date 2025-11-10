import 'package:flutter/material.dart';
import 'package:smart_city/features/Home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  final void Function(int) onNavTap;

  const HomeView({super.key, required this.onNavTap}); // ✅ required

  static const routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    return HomeViewBody(onNavTap: onNavTap);
  }
}
