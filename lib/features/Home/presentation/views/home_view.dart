import 'package:flutter/material.dart';
import 'package:smart_city/features/Home/presentation/views/widgets/home_view_body.dart';

class homeView extends StatelessWidget {
  const homeView({super.key});
  static const routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    return HomeViewBody();
  }
}
