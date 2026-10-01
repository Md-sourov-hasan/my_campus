import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/common/widgets/campus_filter_bar.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/notifications/controller/notifications_controller.dart';

/// Category filter bar for notifications with unread badge counter.
class NotificationFilterBar extends StatelessWidget {
  final NotificationsController controller;

  const NotificationFilterBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final filters = ['All', 'Unread', 'Academic', 'Attendance'];

    return Obx(() => CampusFilterBar(
          filters: filters,
          selectedFilter: controller.selectedFilter.value,
          onFilterSelected: controller.setFilter,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          badgeCount: (filter) {
            if (filter == 'Unread') return controller.unreadCount;
            return 0;
          },
        ));
  }
}
