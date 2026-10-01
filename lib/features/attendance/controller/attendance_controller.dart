import 'package:get/get.dart';
import 'package:task/core/data/mock_data.dart';

/// Attendance controller — manages subject attendance and calendar state.
class AttendanceController extends GetxController {
  final RxInt selectedTabIndex = 0.obs; // 0 = Subjects, 1 = Calendar

  List<Map<String, dynamic>> get subjectAttendance => MockData.attendance;
  Map<int, String> get calendarData => MockData.attendanceCalendar;

  /// Overall attendance percentage across all subjects.
  double get overallPercentage {
    if (subjectAttendance.isEmpty) return 0;
    final total =
        subjectAttendance.fold<double>(0, (sum, s) => sum + (s['percentage'] as double));
    return total / subjectAttendance.length;
  }

  int get totalPresent =>
      calendarData.values.where((v) => v == 'present').length;
  int get totalAbsent =>
      calendarData.values.where((v) => v == 'absent').length;
  int get totalLate =>
      calendarData.values.where((v) => v == 'late').length;

  void switchTab(int index) {
    selectedTabIndex.value = index;
  }
}
