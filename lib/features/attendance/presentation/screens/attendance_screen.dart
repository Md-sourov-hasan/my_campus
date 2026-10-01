import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/common/widgets/campus_app_bar.dart';
import 'package:task/core/common/widgets/campus_toggle.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/attendance/controller/attendance_controller.dart';
import 'package:task/features/attendance/presentation/widgets/attendance_calendar.dart';
import 'package:task/features/attendance/presentation/widgets/attendance_overall_card.dart';
import 'package:task/features/attendance/presentation/widgets/attendance_ring.dart';

/// Attendance screen with tab toggle for Subjects vs Calendar views.
class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    final AttendanceController controller = Get.put(AttendanceController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CampusAppBar(
        title: 'Attendance',
        showBackButton: true,
        onBackPressed: () => context.pop(),
      ),
      body: Column(
        children: [
          // ── Overall Summary Card ────────────────────────────────
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: AttendanceOverallCard(controller: controller),
          ),
          20.verticalSpace,

          // ── Tab Toggle ──────────────────────────────────────────
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Obx(() => CampusToggle(
                  items: const [
                    CampusToggleItem(label: 'Subjects'),
                    CampusToggleItem(label: 'Calendar'),
                  ],
                  selectedIndex: controller.selectedTabIndex.value,
                  onChanged: controller.switchTab,
                  selectedColor: AppColors.surface,
                  selectedTextColor: AppColors.primary,
                  showSelectedShadow: true,
                )),
          ),
          16.verticalSpace,

          // ── Content ─────────────────────────────────────────────
          Expanded(
            child: Obx(() => controller.selectedTabIndex.value == 0
                ? _buildSubjectsView(controller)
                : _buildCalendarView(controller)),
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectsView(AttendanceController controller) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: controller.subjectAttendance.length,
      separatorBuilder: (_, _) => 12.verticalSpace,
      itemBuilder: (context, index) {
        final subject = controller.subjectAttendance[index];
        return AttendanceRing(
          subject: subject['subject'] as String,
          code: subject['code'] as String,
          totalClasses: subject['totalClasses'] as int,
          attended: subject['attended'] as int,
          percentage: subject['percentage'] as double,
          color: subject['color'] as Color,
        );
      },
    );
  }

  Widget _buildCalendarView(AttendanceController controller) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: AttendanceCalendar(calendarData: controller.calendarData),
    );
  }
}
