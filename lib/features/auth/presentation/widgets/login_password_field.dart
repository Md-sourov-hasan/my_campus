import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/common/widgets/campus_text_field.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/auth/controller/login_controller.dart';

/// Password input field with visibility toggle for the login screen.
class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find<LoginController>();

    return Obx(() => CampusTextField(
          label: 'Password',
          hintText: 'Enter your password',
          controller: controller.passwordController,
          obscureText: controller.isPasswordHidden.value,
          prefixIcon: Icon(
            Icons.lock_outline,
            size: 20.w,
            color: AppColors.textMuted,
          ),
          suffixIcon: GestureDetector(
            onTap: controller.togglePasswordVisibility,
            child: Icon(
              controller.isPasswordHidden.value
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              size: 20.w,
              color: AppColors.textMuted,
            ),
          ),
        ));
  }
}
