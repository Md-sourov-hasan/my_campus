import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:task/routes/app_routes.dart';

/// Controls the splash screen animation and auto-navigation.
class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.elasticOut),
      ),
    );

    slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.3, 0.7, curve: Curves.easeOut),
      ),
    );

    animationController.forward();
  }

  /// Navigate to login screen after splash. Called from the screen.
  void navigateToLogin(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2800), () {
      if (context.mounted) {
        context.go(AppRoute.loginScreen);
      }
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
