import 'package:smart_city/features/Auth/domain/entities/user_entity.dart';

class UserModel {
  final int id;
  final String name;
  final String nationalId;
  final String email;
  final String phone;
  final String address;
  final String role;
  final String createdAt;
  final bool isActive;

  UserModel({
    required this.id,
    required this.name,
    required this.nationalId,
    required this.email,
    required this.phone,
    required this.address,
    required this.role,
    required this.createdAt,
    required this.isActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: (json['id'] as int?) ?? 0,
      name: (json['name'] as String?) ?? '',
      nationalId: (json['nationalId'] as String?) ?? '',
      email: (json['email'] as String?) ?? '',
      phone: (json['phone'] as String?) ?? '',
      address: (json['address'] as String?) ?? '',
      role: (json['role'] as String?) ?? '',
      createdAt: (json['createdAt'] as String?) ?? '',
      isActive: true,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      nationalId: nationalId,
      email: email,
      phone: phone,
      address: address,
      role: role,
      createdAt: createdAt,
      isActive: isActive,
    );
  }
}
