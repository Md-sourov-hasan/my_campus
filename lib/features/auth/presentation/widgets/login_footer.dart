import 'package:flutter/material.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';

/// Footer widget prompting users without accounts to contact the admin.
class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: getTextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
          children: [
            const TextSpan(text: 'Don\'t have an account? '),
            TextSpan(
              text: 'Contact Admin',
              style: getTextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
