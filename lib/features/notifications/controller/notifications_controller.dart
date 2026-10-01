import 'package:get/get.dart';

/// Model representing a single campus notification.
class NotificationItem {
  final String id;
  final String title;
  final String message;
  final String time;
  final String category; // 'academic', 'attendance', 'notice', 'fee', 'system'
  final String dateGroup; // 'Today', 'Yesterday', 'Earlier'
  final RxBool isRead;

  NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.time,
    required this.category,
    required this.dateGroup,
    bool isRead = false,
  }) : isRead = isRead.obs;
}

/// Controller managing notification state and user interactions.
class NotificationsController extends GetxController {
  // ── Selected Filter ───────────────────────────────────────────────
  final RxString selectedFilter = 'All'.obs;

  // ── Notification Items ────────────────────────────────────────────
  final RxList<NotificationItem> notifications = <NotificationItem>[
    NotificationItem(
      id: '1',
      title: 'Mid-Term Exam Routine Published',
      message:
          'Fall 2026 Mid-Term routine is now available. Exams will commence from October 15.',
      time: '15m ago',
      category: 'academic',
      dateGroup: 'Today',
      isRead: false,
    ),
    NotificationItem(
      id: '2',
      title: 'Attendance Shortage Warning',
      message:
          'Your attendance in CSE-311 (Data Structures) is at 72%. Minimum 75% is mandatory to sit for exams.',
      time: '1h ago',
      category: 'attendance',
      dateGroup: 'Today',
      isRead: false,
    ),
    NotificationItem(
      id: '3',
      title: 'Central Library Book Due Notice',
      message:
          'Return "Operating System Concepts" by Oct 02 to avoid late fine penalty.',
      time: '3h ago',
      category: 'notice',
      dateGroup: 'Today',
      isRead: false,
    ),
    NotificationItem(
      id: '4',
      title: 'Semester Tuition Fee Reminder',
      message:
          'Payment deadline for Fall 2026 installment is October 10. Avoid 5% late surcharge.',
      time: 'Yesterday',
      category: 'fee',
      dateGroup: 'Yesterday',
      isRead: true,
    ),
    NotificationItem(
      id: '5',
      title: 'Class Rescheduled: CSE-312 Lab',
      message:
          'CSE-312 Microprocessor Lab has been shifted to Room 402, Academic Building 2.',
      time: 'Yesterday',
      category: 'academic',
      dateGroup: 'Yesterday',
      isRead: true,
    ),
    NotificationItem(
      id: '6',
      title: 'Campus Hackathon 2026 Registration',
      message:
          'Registration is open for the 48-Hour Inter-Departmental Hackathon. Win prizes up to \$2,000.',
      time: '3 days ago',
      category: 'notice',
      dateGroup: 'Earlier',
      isRead: true,
    ),
  ].obs;

  // ── Computed Properties ───────────────────────────────────────────
  int get unreadCount => notifications.where((item) => !item.isRead.value).length;

  List<NotificationItem> get filteredNotifications {
    final filter = selectedFilter.value;
    if (filter == 'All') {
      return notifications;
    } else if (filter == 'Unread') {
      return notifications.where((item) => !item.isRead.value).toList();
    } else if (filter == 'Academic') {
      return notifications.where((item) => item.category == 'academic').toList();
    } else if (filter == 'Attendance') {
      return notifications.where((item) => item.category == 'attendance').toList();
    }
    return notifications;
  }

  // ── Actions ───────────────────────────────────────────────────────
  void setFilter(String filter) {
    selectedFilter.value = filter;
  }

  void markAsRead(String id) {
    final index = notifications.indexWhere((item) => item.id == id);
    if (index != -1) {
      notifications[index].isRead.value = true;
    }
  }

  void markAllAsRead() {
    for (final item in notifications) {
      item.isRead.value = true;
    }
  }

  void removeNotification(String id) {
    notifications.removeWhere((item) => item.id == id);
  }

  void clearAll() {
    notifications.clear();
  }
}
