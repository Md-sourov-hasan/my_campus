import 'package:flutter/material.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';

/// "Forgot Password?" link aligned to the right.
class LoginForgotPassword extends StatelessWidget {
  const LoginForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          // Navigate to forgot password screen
          // context.push(AppRoute.forgotPasswordScreen);
        },
        child: Text(
          'Forgot Password?',
          style: getTextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
