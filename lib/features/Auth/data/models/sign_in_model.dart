// lib/features/auth/data/models/sign_in_model.dart

import 'user_model.dart';

class SignInModel {
  final String token;
  final UserModel user;

  SignInModel({required this.token, required this.user});

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      token: (json['token'] as String?) ?? '',
      user: UserModel.fromJson((json['user'] as Map<String, dynamic>?) ?? {}),
    );
  }
}
