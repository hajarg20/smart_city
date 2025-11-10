import 'package:flutter/material.dart';
import 'package:smart_city/features/citizen%20dashoard/presentation/views/widgets/citizen_dashboard_view_body.dart';

class CitizenDashboardView extends StatelessWidget {
  const CitizenDashboardView({super.key});
  static const routeName = 'citizenDashboardView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CitizenDashboardViewBody());
  }
}
