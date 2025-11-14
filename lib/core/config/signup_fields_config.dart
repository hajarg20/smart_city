// lib/core/config/signup_fields_config.dart
import 'package:flutter/material.dart';

class SignupFieldsConfig {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;
  final TextEditingController nationalIdController;
  final TextEditingController nameController;
  final TextEditingController addressController;

  SignupFieldsConfig({
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneController,
    required this.nationalIdController,
    required this.nameController,
    required this.addressController,
  });

  List<Map<String, dynamic>> getFields() {
    return [
      {
        "title": "Email",
        "hint": "Enter your email",
        "icon": Icons.email,
        "input": TextInputType.emailAddress,
        "obscure": false,
        "controller": emailController,
      },
      {
        "title": "Password",
        "hint": "Enter your password",
        "icon": Icons.lock,
        "obscure": true,
        "controller": passwordController,
      },
      {
        "title": "Confirm Password",
        "hint": "Re-enter your password",
        "icon": Icons.lock,
        "obscure": true,
        "controller": confirmPasswordController,
      },
      {
        "title": "Phone Number",
        "hint": "Enter your phone number",
        "icon": Icons.phone,
        "input": TextInputType.phone,
        "obscure": false,
        "controller": phoneController,
      },
      {
        "title": "National ID",
        "hint": "Enter your national ID",
        "icon": Icons.perm_identity,
        "input": TextInputType.number,
        "obscure": false,
        "controller": nationalIdController,
      },
      {
        "title": "Full Name",
        "hint": "Enter your full name",
        "icon": Icons.person,
        "obscure": false,
        "controller": nameController,
      },
      {
        "title": "Address",
        "hint": "Enter your address",
        "icon": Icons.home,
        "obscure": false,
        "controller": addressController,
      },
    ];
  }
}
