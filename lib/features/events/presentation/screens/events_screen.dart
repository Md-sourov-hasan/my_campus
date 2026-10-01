import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/common/widgets/campus_app_bar.dart';
import 'package:task/core/common/widgets/campus_card.dart';
import 'package:task/core/common/widgets/campus_icon_box.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/events/controller/events_controller.dart';

/// Campus Events screen with filter tabs and event cards.
class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    final EventsController controller = Get.put(EventsController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CampusAppBar(
        title: 'Campus Events',
        showBackButton: true,
        onBackPressed: () => context.pop(),
      ),
      body: Column(
        children: [
          // ── Filter Tabs ──────────────────────────────────────────
          16.verticalSpace,
          SizedBox(
            height: 40.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: EventsController.filterLabels.length,
              separatorBuilder: (_, _) => 8.horizontalSpace,
              itemBuilder: (context, index) {
                return Obx(() {
                  final isSelected =
                      controller.selectedFilter.value == index;
                  return GestureDetector(
                    onTap: () => controller.selectFilter(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? AppColors.primary : AppColors.surface,
                        borderRadius: BorderRadius.circular(20.r),
                        border: isSelected
                            ? null
                            : Border.all(color: AppColors.border),
                      ),
                      child: Center(
                        child: Text(
                          EventsController.filterLabels[index],
                          style: getTextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? Colors.white
                                : AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                  );
                });
              },
            ),
          ),
          16.verticalSpace,

          // ── Events List ──────────────────────────────────────────
          Expanded(
            child: Obx(() {
              final events = controller.filteredEvents;
              if (events.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CampusIconBox(
                        icon: Icons.event_busy_outlined,
                        color: AppColors.textMuted,
                        size: 64.w,
                      ),
                      16.verticalSpace,
                      Text(
                        'No Events',
                        style: getTextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      6.verticalSpace,
                      Text(
                        'Check back later for upcoming events',
                        style: getTextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: events.length,
                separatorBuilder: (_, _) => 0.verticalSpace,
                itemBuilder: (context, index) =>
                    _buildEventCard(events[index]),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(Map<String, dynamic> event) {
    final color = event['color'] as Color;
    final isRegistered = event['isRegistered'] as bool;

    return CampusCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              CampusIconBox(
                icon: event['icon'] as IconData,
                color: color,
                size: 44.w,
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event['title'] as String,
                      style: getTextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    4.verticalSpace,
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        event['category'] as String,
                        style: getTextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          12.verticalSpace,

          // Description
          Text(
            event['description'] as String,
            style: getTextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          12.verticalSpace,

          // Details row
          Row(
            children: [
              Icon(Icons.calendar_today_outlined,
                  size: 14.sp, color: AppColors.textMuted),
              4.horizontalSpace,
              Text(
                event['date'] as String,
                style: getTextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textMuted,
                ),
              ),
              12.horizontalSpace,
              Icon(Icons.access_time_rounded,
                  size: 14.sp, color: AppColors.textMuted),
              4.horizontalSpace,
              Expanded(
                child: Text(
                  event['time'] as String,
                  style: getTextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textMuted,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          6.verticalSpace,
          Row(
            children: [
              Icon(Icons.location_on_outlined,
                  size: 14.sp, color: AppColors.textMuted),
              4.horizontalSpace,
              Expanded(
                child: Text(
                  event['venue'] as String,
                  style: getTextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textMuted,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          12.verticalSpace,

          // Registration status
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(
              color: isRegistered
                  ? const Color(0xFF22C55E).withValues(alpha: 0.1)
                  : AppColors.primarySurface,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: Text(
                isRegistered ? '✓ Registered' : 'Register Now',
                style: getTextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: isRegistered
                      ? const Color(0xFF22C55E)
                      : AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
