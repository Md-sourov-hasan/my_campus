import 'package:get/get.dart';
import 'package:task/core/data/mock_data.dart';

/// Notices controller — manages list filtering by category.
class NoticesController extends GetxController {
  final RxString selectedCategory = 'All'.obs;
  final RxList<Map<String, dynamic>> filteredNotices =
      <Map<String, dynamic>>[].obs;

  final List<String> categories = [
    'All',
    'Exam',
    'Event',
    'Academic',
    'Urgent',
  ];

  @override
  void onInit() {
    super.onInit();
    filteredNotices.assignAll(MockData.notices);
  }

  void filterByCategory(String category) {
    selectedCategory.value = category;
    if (category == 'All') {
      filteredNotices.assignAll(MockData.notices);
    } else {
      filteredNotices.assignAll(
        MockData.notices
            .where((n) => n['category'] == category)
            .toList(),
      );
    }
  }
}
