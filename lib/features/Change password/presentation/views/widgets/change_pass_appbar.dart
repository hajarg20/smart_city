// lib/core/widgets/change_password_appbar.dart
import 'package:flutter/material.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/features/profile/presentation/views/profile_view.dart';

class ChangePasswordAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ChangePasswordAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        color: Colors.white,
        onPressed: () {
          Navigator.pushReplacementNamed(context, ProfileView.routeName);
        },
      ),
      title: const Text(
        'Change Password',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      backgroundColor: AppColors.secondaryColor2,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
