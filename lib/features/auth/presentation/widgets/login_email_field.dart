import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/common/widgets/campus_text_field.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/auth/controller/login_controller.dart';

/// Email / phone input field for the login screen.
class LoginEmailField extends StatelessWidget {
  const LoginEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find<LoginController>();

    return CampusTextField(
      label: 'Email or Phone',
      hintText: 'Enter your email address',
      controller: controller.emailController,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Icon(
        Icons.email_outlined,
        size: 20.w,
        color: AppColors.textMuted,
      ),
    );
  }
}
