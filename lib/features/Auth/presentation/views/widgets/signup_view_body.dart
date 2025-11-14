import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/config/signup_fields_config.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/utils/app_text_styls.dart';
import 'package:smart_city/core/widgets/custom_button.dart';
import 'package:smart_city/core/widgets/custom_textformfield.dart';
import 'package:smart_city/features/Auth/presentation/views/login_view.dart';
import 'package:smart_city/features/Auth/presentation/views/widgets/auth_dialog.dart';
import 'package:smart_city/features/Auth/presentation/cubit/cubit/sign_up_cubit.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    final config = SignupFieldsConfig(
      emailController: cubit.emailController,
      passwordController: cubit.passwordController,
      confirmPasswordController: cubit.confirmPasswordController,
      phoneController: cubit.phoneController,
      nationalIdController: cubit.nationalIdController,
      nameController: cubit.nameController,
      addressController: cubit.addressController,
    );

    return Scaffold(
      backgroundColor: AppColors.lightprimaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.lightprimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Create New Account',
          style: AppTextStyles.bold20.copyWith(color: const Color(0xFF1E1E1E)),
        ),
      ),
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) => const AuthDialog(
                      Title: 'Account Created Successfully!',
                      subTitle: 'You can log in now!',
                    ),
              ),
            );
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
              child: Column(
                children: [
                  ...config.getFields().map(
                    (field) => Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: CustomTextformField(
                        title: field["title"],
                        hintText: field["hint"],
                        controller: field["controller"],
                        icon: field["icon"],
                        isobscure: field["obscure"] ?? false,
                        inputType: field["input"] ?? TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '${field["title"]} is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 28.h),
                  state is SignUpLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                        color: AppColors.primaryColor,
                        text: 'Create Account',
                        onPressed: () => cubit.signUp(),
                      ),
                  SizedBox(height: 18.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account? ",
                          style: AppTextStyles.medium18.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, LoginView.routeName);
                            },
                            child: Text(
                              "Log in",
                              style: AppTextStyles.medium18.copyWith(
                                color: AppColors.primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
