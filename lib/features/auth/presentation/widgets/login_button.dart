import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/common/widgets/campus_primary_button.dart';
import 'package:task/features/auth/controller/login_controller.dart';
import 'package:task/routes/app_routes.dart';

/// Login submit button with loading state, wired to [LoginController].
class LoginButton extends StatelessWidget {
  final LoginController controller;

  const LoginButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => CampusPrimaryButton(
          text: 'Log In',
          isLoading: controller.isLoading.value,
          onPressed: () async {
            final success = await controller.login();
            if (success && context.mounted) {
              context.go(AppRoute.dashboardScreen);
            }
          },
        ));
  }
}

