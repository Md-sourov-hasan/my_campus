import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/common/widgets/section_header.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/dashboard/controller/dashboard_controller.dart';
import 'package:task/features/dashboard/presentation/widgets/dashboard_attendance_snippet.dart';
import 'package:task/features/dashboard/presentation/widgets/dashboard_greeting_header.dart';
import 'package:task/features/dashboard/presentation/widgets/dashboard_recent_notices.dart';
import 'package:task/features/dashboard/presentation/widgets/glance_card.dart';
import 'package:task/features/dashboard/presentation/widgets/quick_access_grid.dart';
import 'package:task/routes/app_routes.dart';

/// Main dashboard screen — the home hub of MyCampus.
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    final DashboardController controller = Get.put(DashboardController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.verticalSpace,
                DashboardGreetingHeader(controller: controller),
                24.verticalSpace,
                GlanceCard(glanceData: controller.todayGlance),
                24.verticalSpace,
                const SectionHeader(title: 'Quick Access'),
                QuickAccessGrid(items: controller.quickAccess),
                24.verticalSpace,
                SectionHeader(
                  title: 'Recent Notices',
                  actionText: 'See All',
                  onActionTap: () => context.push(AppRoute.noticesScreen),
                ),
                DashboardRecentNotices(notices: controller.recentNotices),
                24.verticalSpace,
                const DashboardAttendanceSnippet(),
                32.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
