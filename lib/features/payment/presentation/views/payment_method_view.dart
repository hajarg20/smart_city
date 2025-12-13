// lib/features/bills/presentation/views/payment_method_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/utils/app_text_styls.dart';
import 'package:smart_city/core/widgets/custom_button.dart';
import 'package:smart_city/features/bills/presentation/manager/cubit/bills_cubit.dart';

class PaymentMethodView extends StatelessWidget {
  final int billId;
  const PaymentMethodView({super.key, required this.billId});

  static const routeName = 'payment-method';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Payment Method"),
        backgroundColor: AppColors.secondaryColor2,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _option("Credit/Debit Card", Icons.credit_card),
            const SizedBox(height: 16),
            _option("Mobile Wallet", Icons.phone_iphone),
            const SizedBox(height: 16),
            _option("Bank Transfer", Icons.account_balance),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                color: AppColors.primaryColor,
                text: 'Confirm Payment',
                onPressed: () {
                  context.read<BillsCubit>().payBill(billId);

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => const PaymentSuccessDialog(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _option(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, size: 32, color: AppColors.primaryColor),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 96.w,
              height: 96.h,
              decoration: ShapeDecoration(
                color: AppColors.lightprimaryColor,
                shape: const CircleBorder(),
              ),
              child: Center(
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 42.sp,
                ),
              ),
            ),
            SizedBox(height: 18.h),
            Text(
              'Payment Successful!',
              textAlign: TextAlign.center,
              style: AppTextStyles.bold28.copyWith(
                color: AppColors.secondaryColor2,
                height: 1.25,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Your bill has been marked as paid.',
              textAlign: TextAlign.center,
              style: AppTextStyles.regular16.copyWith(
                color: const Color(0xFF1E1E1E),
              ),
            ),
            SizedBox(height: 22.h),
            CustomButton(
              color: AppColors.primaryColor,
              text: 'Done',
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
