// lib/features/auth/data/models/sign_up_model.dart
import 'user_model.dart';

class SignUpModel {
  final String token;
  final UserModel user;

  SignUpModel({required this.token, required this.user});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'] as Map<String, dynamic>?;

    return SignUpModel(
      token: json['token']?.toString() ?? '',
      user:
          userJson != null
              ? UserModel.fromJson(userJson)
              : UserModel(
                id: 0,
                name: '',
                nationalId: '',
                email: '',
                phone: '',
                address: '',
                role: '',
                createdAt: '',
                isActive: true,
              ),
    );
  }
}
