import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/features/Change%20password/presentation/views/widgets/chage_pass_header.dart';
import 'package:smart_city/features/Change%20password/presentation/views/widgets/confirm_changes_button.dart';
import 'package:smart_city/features/Change%20password/presentation/views/widgets/password_field.dart';

class ChangePassViewBody extends StatelessWidget {
  const ChangePassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          constraints: BoxConstraints(minHeight: 560.h),
          width: 0.9.sw,
          padding: EdgeInsets.all(28.w),
          decoration: _cardDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              HeaderSection(),
              SizedBox(height: 32),
              PasswordFields(),
              SizedBox(height: 32),
              ConfirmButton(),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(28.r),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.08),
        blurRadius: 25.r,
        offset: Offset(0, 10.h),
      ),
      BoxShadow(
        color: AppColors.primaryColor.withOpacity(0.06),
        blurRadius: 40.r,
        offset: Offset(0, 20.h),
      ),
    ],
  );
}
