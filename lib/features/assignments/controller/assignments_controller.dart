import 'package:get/get.dart';
import 'package:task/core/data/mock_data.dart';

/// Controller for the Assignments screen.
class AssignmentsController extends GetxController {
  List<Map<String, dynamic>> get allAssignments => MockData.assignments;

  // ── Filter state ────────────────────────────────────────────────
  final RxInt selectedFilter = 0.obs; // 0=All, 1=Pending, 2=Submitted, 3=Graded

  static const List<String> filterLabels = [
    'All',
    'Pending',
    'Submitted',
    'Graded',
  ];

  void selectFilter(int index) {
    selectedFilter.value = index;
  }

  List<Map<String, dynamic>> get filteredAssignments {
    if (selectedFilter.value == 0) return allAssignments;
    final status = filterLabels[selectedFilter.value].toLowerCase();
    return allAssignments
        .where((a) => a['status'] == status)
        .toList();
  }

  int get pendingCount =>
      allAssignments.where((a) => a['status'] == 'pending').length;
  int get submittedCount =>
      allAssignments.where((a) => a['status'] == 'submitted').length;
  int get gradedCount =>
      allAssignments.where((a) => a['status'] == 'graded').length;
}
