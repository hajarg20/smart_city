// features/Home/presentation/views/widgets/home_view_body.dart
import 'package:flutter/material.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/widgets/custom_appbar.dart';
import 'package:smart_city/features/Home/presentation/views/widgets/home_gridView.dart';

class HomeViewBody extends StatelessWidget {
  final void Function(int) onNavTap;

  const HomeViewBody({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightprimaryColor,
      child: Column(
        children: [
          CustomAppbar(
            backgroundColor: AppColors.secondaryColor2,
            title: 'Smart City',
            icon: Icons.home_filled,
            color: Colors.white,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  HomeGridview(onNavTap: onNavTap),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
