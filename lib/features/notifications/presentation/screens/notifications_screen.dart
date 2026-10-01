import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/common/widgets/campus_app_bar.dart';
import 'package:task/core/common/widgets/campus_empty_state.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/notifications/controller/notifications_controller.dart';
import 'package:task/features/notifications/presentation/widgets/notification_filter_bar.dart';
import 'package:task/features/notifications/presentation/widgets/notification_tile.dart';

/// Notifications screen displaying campus announcements and alerts.
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    final NotificationsController controller =
        Get.put(NotificationsController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CampusAppBar(
        title: 'Notifications',
        showBackButton: true,
        onBackPressed: () => context.pop(),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert_rounded,
              size: 22.sp,
              color: AppColors.textPrimary,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.r),
            ),
            elevation: 4,
            onSelected: (value) {
              if (value == 'mark_all_read') {
                controller.markAllAsRead();
              } else if (value == 'clear_all') {
                controller.clearAll();
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'mark_all_read',
                child: Row(
                  children: [
                    Icon(
                      Icons.done_all_rounded,
                      size: 18.sp,
                      color: AppColors.primary,
                    ),
                    8.horizontalSpace,
                    Text(
                      'Mark all as read',
                      style: getTextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'clear_all',
                child: Row(
                  children: [
                    Icon(
                      Icons.delete_sweep_outlined,
                      size: 18.sp,
                      color: AppColors.error,
                    ),
                    8.horizontalSpace,
                    Text(
                      'Clear all',
                      style: getTextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.error,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          8.horizontalSpace,
        ],
      ),
      body: Column(
        children: [
          // ── Filter Chips ─────────────────────────────────────────
          NotificationFilterBar(controller: controller),
          12.verticalSpace,

          // ── Notifications List ───────────────────────────────────
          Expanded(
            child: Obx(() {
              final list = controller.filteredNotifications;

              if (list.isEmpty) {
                return const CampusEmptyState(
                  icon: Icons.notifications_off_outlined,
                  title: 'No Notifications',
                  subtitle:
                      "You're all caught up! Check back later for campus alerts and announcements.",
                );
              }

              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final item = list[index];
                  return NotificationTile(
                    item: item,
                    onTap: () => controller.markAsRead(item.id),
                    onDismissed: () => controller.removeNotification(item.id),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
