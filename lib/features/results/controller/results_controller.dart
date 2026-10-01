import 'package:get/get.dart';
import 'package:task/core/data/mock_data.dart';

/// Controller for the Results & Grades screen.
class ResultsController extends GetxController {
  // ── Data ─────────────────────────────────────────────────────────
  Map<String, dynamic> get overview => MockData.resultsOverview;
  List<Map<String, dynamic>> get semesters => MockData.semesterResults;

  // ── State ────────────────────────────────────────────────────────
  final RxInt expandedSemester = 0.obs;

  void toggleSemester(int index) {
    if (expandedSemester.value == index) {
      expandedSemester.value = -1;
    } else {
      expandedSemester.value = index;
    }
  }
}
