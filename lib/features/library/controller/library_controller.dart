import 'package:get/get.dart';
import 'package:task/core/data/mock_data.dart';

/// Controller for the Digital Library screen.
class LibraryController extends GetxController {
  List<String> get categories => MockData.libraryCategories;
  List<Map<String, dynamic>> get allBooks => MockData.libraryBooks;
  List<Map<String, dynamic>> get borrowedBooks => MockData.borrowedBooks;

  // ── State ────────────────────────────────────────────────────────
  final RxInt selectedCategory = 0.obs;
  final RxInt selectedTab = 0.obs; // 0=Browse, 1=Borrowed
  final RxString searchQuery = ''.obs;

  void selectCategory(int index) {
    selectedCategory.value = index;
  }

  void switchTab(int index) {
    selectedTab.value = index;
  }

  void updateSearch(String query) {
    searchQuery.value = query;
  }

  List<Map<String, dynamic>> get filteredBooks {
    var books = allBooks;

    // Category filter
    if (selectedCategory.value > 0) {
      final category = categories[selectedCategory.value];
      books = books.where((b) => b['category'] == category).toList();
    }

    // Search filter
    if (searchQuery.value.isNotEmpty) {
      final query = searchQuery.value.toLowerCase();
      books = books
          .where((b) =>
              (b['title'] as String).toLowerCase().contains(query) ||
              (b['author'] as String).toLowerCase().contains(query))
          .toList();
    }

    return books;
  }
}
