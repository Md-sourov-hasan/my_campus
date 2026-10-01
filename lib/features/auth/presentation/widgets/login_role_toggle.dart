import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/common/widgets/campus_toggle.dart';
import 'package:task/features/auth/controller/login_controller.dart';

/// Role toggle switch between Student and Teacher.
class LoginRoleToggle extends StatelessWidget {
  final LoginController controller;

  const LoginRoleToggle({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => CampusToggle(
          items: const [
            CampusToggleItem(label: 'Student', icon: Icons.school_outlined),
            CampusToggleItem(label: 'Teacher', icon: Icons.person_outlined),
          ],
          selectedIndex: controller.selectedRole.value,
          onChanged: controller.switchRole,
        ));
  }
}
