import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/common/widgets/campus_card.dart';
import 'package:task/core/common/widgets/campus_icon_box.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/routes/app_routes.dart';

/// Summary card on the dashboard showing an attendance preview and linking to the attendance screen.
class DashboardAttendanceSnippet extends StatelessWidget {
  const DashboardAttendanceSnippet({super.key});

  @override
  Widget build(BuildContext context) {
    return CampusCard(
      onTap: () => context.push(AppRoute.attendanceScreen),
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          // Attendance icon
          CampusIconBox(
            icon: Icons.fact_check_outlined,
            color: AppColors.success,
            size: 48.w,
            borderRadius: 14.r,
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Overall Attendance',
                  style: getTextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                4.verticalSpace,
                Text(
                  '83.2% across 6 subjects',
                  style: getTextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            size: 22.sp,
            color: AppColors.textMuted,
          ),
        ],
      ),
    );
  }
}
