import 'package:flutter/material.dart';
import 'package:smart_city/core/widgets/custom_appbar.dart';
import 'package:smart_city/features/citizen%20dashoard/presentation/views/electricty_dashboard_view.dart';
import 'package:smart_city/features/citizen%20dashoard/presentation/views/water_dashboard_view.dart';
import 'package:smart_city/features/citizen%20dashoard/presentation/views/widgets/dashboard_card.dart';
import 'package:smart_city/features/citizen%20dashoard/presentation/views/widgets/dashboard_item.dart';

class CitizenDashboardViewBody extends StatelessWidget {
  const CitizenDashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f8f4),
      appBar: const CustomAppbar(
        title: 'Your Dashboards',
        icon: Icons.dashboard,
        color: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DashboardItem(
              title: 'Electricity Dashboard',
              icon: Icons.electrical_services,
              color: Colors.amber[700]!,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ElectricityDashboardView.routeName,
                );
              },
            ),
            const SizedBox(height: 16),
            DashboardItem(
              title: 'Water Dashboard',
              icon: Icons.water_drop,
              color: Colors.teal,
              onTap: () {
                Navigator.pushNamed(context, WaterDashboardView.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
