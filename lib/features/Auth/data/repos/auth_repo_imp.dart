import 'package:dartz/dartz.dart';
import 'package:smart_city/core/database/api/api_consumer.dart';
import 'package:smart_city/core/database/api/end_ponits.dart';
import 'package:smart_city/core/database/cache/cache_helper.dart';
import 'package:smart_city/core/errors/expentions.dart';
import 'package:smart_city/features/Auth/data/models/sign_in_model.dart';

import 'package:smart_city/features/Auth/data/models/sign_up_model.dart';
import 'package:smart_city/features/Auth/data/models/user_model.dart';
import 'package:smart_city/features/Auth/presentation/views/domain/entities/user_entity.dart';
import 'package:smart_city/features/Auth/presentation/views/domain/repos/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiConsumer api;

  AuthRepositoryImpl({required this.api});

  @override
  Future<Either<String, UserEntity>> signUp({
    required String name,
    required String nationalId,
    required String email,
    required String phone,
    required String password,
    required String address,
  }) async {
    try {
      final response = await api.post(
        EndPoints.register,
        data: {
          "name": name,
          "nationalId": nationalId,
          "email": email,
          "phone": phone,
          "password": password,
          "address": address,
        },
        requireAuth: false,
      );

      // ──────── 1. فحص الـ status أول شيء ────────
      final status = (response['status'] as String?)?.toLowerCase();

      if (status == 'error' || status == 'fail') {
        final message =
            response['message']?.toString() ??
            response['error']?.toString() ??
            response['detail']?.toString() ??
            'An error occurred';
        return Left(message);
      }

      // ─ــــــــ 2. تأكد من وجود token و user ─ــــــــ
      final token = response['token'] as String?;
      final userJson = response['user'] as Map<String, dynamic>?;

      if (token == null || token.isEmpty || userJson == null) {
        return const Left('فشل في إنشاء الحساب. البيانات غير كاملة.');
      }

      // ─ــــــــ 3. إنشاء الـ model يدويًا (لا fromJson) ─ــــــــ
      final signUpData = SignUpModel(
        token: token,
        user: UserModel.fromJson(userJson),
      );

      await CacheHelper.saveToken(signUpData.token);

      return Right(signUpData.user.toEntity());
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    } catch (e) {
      return Left('فشل في الاتصال بالخادم. تحقق من الإنترنت.');
    }
  }

  // ────────────────────── SIGN-IN ──────────────────────
  @override
  Future<Either<String, UserEntity>> signIn({
    required String nationalId,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoints.login,
        data: {"nationalId": nationalId, "password": password},
        requireAuth: false,
      );

      final status = (response['status'] as String?)?.toLowerCase();
      if (status == 'error' || status == 'fail') {
        final message =
            response['message']?.toString() ??
            response['error']?.toString() ??
            'An error occurred';
        return Left(message);
      }

      final token = response['token'] as String?;
      final userJson = response['user'] as Map<String, dynamic>?;

      if (token == null || token.isEmpty || userJson == null) {
        return const Left('فشل تسجيل الدخول. البيانات غير صحيحة.');
      }

      final signInData = SignInModel(
        token: token,
        user: UserModel.fromJson(userJson),
      );

      await CacheHelper.saveToken(signInData.token);

      return Right(signInData.user.toEntity());
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    } catch (e) {
      return Left('فشل في الاتصال بالخادم. تحقق من الإنترنت.');
    }
  }
}
