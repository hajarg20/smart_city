import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/features/Auth/presentation/views/domain/entities/user_entity.dart';
import 'package:smart_city/features/Auth/presentation/views/domain/repos/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository authRepository;

  SignInCubit({required this.authRepository}) : super(SignInInitial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // ↓↓↓ التعديل هنا
  UserEntity? user;

  Future<void> signIn() async {
    if (!formKey.currentState!.validate()) return;

    emit(SignInLoading());

    final result = await authRepository.signIn(
      nationalId: nationalIdController.text.trim(),
      password: passwordController.text.trim(),
    );

    result.fold((error) => emit(SignInFailure(errMessage: error)), (
      userEntity,
    ) {
      user = userEntity; // ✔️ الآن النوع متطابق UserEntity → UserEntity?
      emit(SignInSuccess());
    });
  }

  @override
  Future<void> close() {
    nationalIdController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
