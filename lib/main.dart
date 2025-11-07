import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/helper/on_generate_routes.dart';
import 'package:smart_city/core/services/shared_pref_singleton.dart';
import 'package:smart_city/features/splash/presentation/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const SmartCity());
}

class SmartCity extends StatelessWidget {
  const SmartCity({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: onGenerateRoute,
          initialRoute: SplashView.routeName,
          home: child,
        );
      },
      child: const SplashView(),
    );
  }
}
