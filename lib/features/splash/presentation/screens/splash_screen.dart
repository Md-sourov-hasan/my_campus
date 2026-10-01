import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/splash/controller/splash_controller.dart';
import 'package:task/features/splash/presentation/widgets/splash_animated_content.dart';

/// Splash screen with animated logo and tagline.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    final SplashController controller = Get.put(SplashController());
    // Trigger navigation after build
    controller.navigateToLogin(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1E40AF),
              AppColors.primary,
              Color(0xFF3B82F6),
            ],
          ),
        ),
        child: SplashAnimatedContent(controller: controller),
      ),
    );
  }
}
