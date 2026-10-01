import 'package:get/get.dart';
import 'package:task/core/data/mock_data.dart';

/// Controller for the Campus Events screen.
class EventsController extends GetxController {
  List<Map<String, dynamic>> get allEvents => MockData.events;

  // ── Filter state ────────────────────────────────────────────────
  final RxInt selectedFilter = 0.obs;

  static const List<String> filterLabels = [
    'All',
    'Registered',
    'Upcoming',
  ];

  void selectFilter(int index) {
    selectedFilter.value = index;
  }

  List<Map<String, dynamic>> get filteredEvents {
    switch (selectedFilter.value) {
      case 1:
        return allEvents.where((e) => e['isRegistered'] == true).toList();
      case 2:
        return allEvents.where((e) => e['isRegistered'] == false).toList();
      default:
        return allEvents;
    }
  }

  void toggleRegistration(int index) {
    final event = allEvents[index];
    event['isRegistered'] = !(event['isRegistered'] as bool);
    // Force UI refresh
    selectedFilter.refresh();
  }
}
