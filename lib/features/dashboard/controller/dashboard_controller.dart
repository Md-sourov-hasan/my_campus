import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:task/core/data/mock_data.dart';

/// Dashboard controller — manages user info and "today at a glance" state.
class DashboardController extends GetxController {
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  // Use student user by default (set from login)
  Map<String, dynamic> get user => MockData.studentUser;
  Map<String, dynamic> get todayGlance => MockData.todayGlance;
  List<Map<String, dynamic>> get quickAccess => MockData.quickAccessItems;
  List<Map<String, dynamic>> get recentNotices =>
      MockData.notices.take(3).toList();

  String get greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  @override
  void onInit() {
    super.onInit();
    debugPrint('DashboardController initialized');
  }
}
