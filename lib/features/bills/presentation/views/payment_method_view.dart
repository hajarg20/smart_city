// lib/features/payment/presentation/views/payment_method_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/features/bills/presentation/manager/cubit/bills_cubit.dart';

class PaymentMethodView extends StatefulWidget {
  final int billId;
  const PaymentMethodView({super.key, required this.billId});

  static const String routeName = '/payment-method';

  @override
  State<PaymentMethodView> createState() => _PaymentMethodViewState();
}

class _PaymentMethodViewState extends State<PaymentMethodView> {
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () {
                  context.read<BillsCubit>().payBill(widget.billId);

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.check_circle, color: Colors.green, size: 80),
                          const SizedBox(height: 20),
                          const Text("Payment Successful!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 12),
                          const Text("Your bill has been marked as paid."),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                            child: const Text("Done"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: const Text("Confirm Payment", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _option(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Row(
        children: [
          Icon(icon, size: 32, color: AppColors.primaryColor),
          const SizedBox(width: 16),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}