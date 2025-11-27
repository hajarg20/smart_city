import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_text_styls.dart';

class PasswordStrengthHint extends StatelessWidget {
  const PasswordStrengthHint({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: Text(
          '• At least 6 characters, include numbers & symbols',
          style: AppTextStyles.regular13.copyWith(
            color: Colors.grey[600],
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
