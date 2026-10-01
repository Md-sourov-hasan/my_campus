import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/attendance/controller/attendance_controller.dart';

/// Top gradient card displaying circular attendance percentage and stats for present, absent, and late.
class AttendanceOverallCard extends StatelessWidget {
  final AttendanceController controller;

  const AttendanceOverallCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, Color(0xFF3B82F6)],
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          CircularPercentIndicator(
            radius: 40.w,
            lineWidth: 8.w,
            percent: controller.overallPercentage / 100,
            center: Text(
              '${controller.overallPercentage.toStringAsFixed(1)}%',
              style: getTextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            progressColor: Colors.white,
            backgroundColor: Colors.white.withValues(alpha: 0.2),
            circularStrokeCap: CircularStrokeCap.round,
            animation: true,
            animationDuration: 1000,
          ),
          20.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Overall Attendance',
                  style: getTextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                8.verticalSpace,
                Row(
                  children: [
                    _buildStatPill(Icons.check_circle_outline,
                        '${controller.totalPresent}', 'Present'),
                    12.horizontalSpace,
                    _buildStatPill(Icons.cancel_outlined,
                        '${controller.totalAbsent}', 'Absent'),
                    12.horizontalSpace,
                    _buildStatPill(Icons.access_time_rounded,
                        '${controller.totalLate}', 'Late'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatPill(IconData icon, String value, String label) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 14.sp, color: Colors.white.withValues(alpha: 0.8)),
            4.horizontalSpace,
            Text(
              value,
              style: getTextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
        2.verticalSpace,
        Text(
          label,
          style: getTextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
