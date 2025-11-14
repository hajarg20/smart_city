import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/core/helper/get_it.dart';
import 'package:smart_city/features/Auth/presentation/cubit/cubit/sign_in_cubit.dart';
import 'package:smart_city/features/Auth/presentation/views/domain/repos/auth_repo.dart';
import 'package:smart_city/features/Auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (context) => SignInCubit(authRepository: getIt<AuthRepository>()),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            // مثلا بعد تسجيل الدخول تنقل للصفحة الرئيسية
            Navigator.pushReplacementNamed(context, '/main');
          } else if (state is SignInFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          // لو عايز تضيف loading indicator
          bool isLoading = state is SignInLoading;
          return Stack(
            children: [
              const Scaffold(body: LoginViewBody()),
              if (isLoading)
                const Opacity(
                  opacity: 0.6,
                  child: ModalBarrier(dismissible: false, color: Colors.black),
                ),
              if (isLoading) const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}
