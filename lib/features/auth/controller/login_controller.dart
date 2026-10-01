import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/data/mock_data.dart';

/// Controls login screen state — role toggle and UI-only login.
class LoginController extends GetxController {
  // ── Form controllers ────────────────────────────────────────────
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // ── Reactive state ──────────────────────────────────────────────
  // 0 = Student, 1 = Teacher
  final RxInt selectedRole = 0.obs;
  final RxBool isLoading = false.obs;
  final RxBool isPasswordHidden = true.obs;

  bool get isStudent => selectedRole.value == 0;
  String get roleName => isStudent ? 'Student' : 'Teacher';

  Map<String, dynamic> get currentUser =>
      isStudent ? MockData.studentUser : MockData.teacherUser;

  void switchRole(int index) {
    selectedRole.value = index;
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  /// Simulates a login action (UI only).
  Future<bool> login() async {
    isLoading.value = true;
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1200));
    isLoading.value = false;
    return true;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
