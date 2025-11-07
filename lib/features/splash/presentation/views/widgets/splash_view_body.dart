import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/services/shared_pref_singleton.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/utils/app_images.dart';
import 'package:smart_city/features/Auth/presentation/views/signup_view.dart';
import 'package:smart_city/features/onboarding/presentation/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    executeNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightprimaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.imagesAppLogo,
                width: 300.w,
                height: 300.h,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void executeNavigation() {
    bool isOnboardingSeen = Prefs.getBool('isonBoardingSeen');
    Future.delayed(const Duration(seconds: 2), () {
      if (isOnboardingSeen) {
        Navigator.pushReplacementNamed(context, SignupView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnboardingView.routeName);
      }
    });
  }
}
