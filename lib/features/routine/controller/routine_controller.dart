import 'package:get/get.dart';
import 'package:task/core/data/mock_data.dart';

/// Controller for the Class Routine screen.
class RoutineController extends GetxController {
  List<String> get weekDays => MockData.weekDays;
  Map<String, List<Map<String, dynamic>>> get weeklyRoutine =>
      MockData.weeklyRoutine;

  // ── State ────────────────────────────────────────────────────────
  final RxInt selectedDayIndex = 0.obs;

  String get selectedDay => weekDays[selectedDayIndex.value];
  List<Map<String, dynamic>> get todayClasses =>
      weeklyRoutine[selectedDay] ?? [];

  void selectDay(int index) {
    selectedDayIndex.value = index;
  }
}
