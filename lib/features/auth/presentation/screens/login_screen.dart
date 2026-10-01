import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/auth/controller/login_controller.dart';
import 'package:task/features/auth/presentation/widgets/login_button.dart';
import 'package:task/features/auth/presentation/widgets/login_email_field.dart';
import 'package:task/features/auth/presentation/widgets/login_footer.dart';
import 'package:task/features/auth/presentation/widgets/login_forgot_password.dart';
import 'package:task/features/auth/presentation/widgets/login_header.dart';
import 'package:task/features/auth/presentation/widgets/login_password_field.dart';
import 'package:task/features/auth/presentation/widgets/login_role_toggle.dart';
import 'package:task/features/auth/presentation/widgets/login_social_section.dart';

/// Login screen with Student/Teacher toggle — UI-only auth.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                48.verticalSpace,
                const LoginHeader(),
                36.verticalSpace,
                LoginRoleToggle(controller: controller),
                32.verticalSpace,
                const LoginEmailField(),
                16.verticalSpace,
                const LoginPasswordField(),
                12.verticalSpace,
                const LoginForgotPassword(),
                32.verticalSpace,
                LoginButton(controller: controller),
                24.verticalSpace,
                const LoginSocialSection(),
                40.verticalSpace,
                const LoginFooter(),
                24.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
