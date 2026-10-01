import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';

/// Circular attendance progress ring for a single subject.
class AttendanceRing extends StatelessWidget {
  final String subject;
  final String code;
  final int totalClasses;
  final int attended;
  final double percentage;
  final Color color;

  const AttendanceRing({
    super.key,
    required this.subject,
    required this.code,
    required this.totalClasses,
    required this.attended,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // ── Circular Progress ────────────────────────────────────
          CircularPercentIndicator(
            radius: 30.w,
            lineWidth: 6.w,
            percent: percentage / 100,
            center: Text(
              '${percentage.toInt()}%',
              style: getTextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
            progressColor: color,
            backgroundColor: color.withValues(alpha: 0.15),
            circularStrokeCap: CircularStrokeCap.round,
            animation: true,
            animationDuration: 800,
          ),
          16.horizontalSpace,

          // ── Subject Info ─────────────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: getTextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                4.verticalSpace,
                Text(
                  code,
                  style: getTextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textMuted,
                  ),
                ),
                6.verticalSpace,
                Text(
                  '$attended / $totalClasses classes attended',
                  style: getTextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // ── Status indicator ─────────────────────────────────────
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: _getStatusColor(percentage).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              _getStatusLabel(percentage),
              style: getTextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: _getStatusColor(percentage),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(double pct) {
    if (pct >= 85) return AppColors.success;
    if (pct >= 75) return AppColors.warning;
    return AppColors.error;
  }

  String _getStatusLabel(double pct) {
    if (pct >= 85) return 'Good';
    if (pct >= 75) return 'Warning';
    return 'Low';
  }
}
