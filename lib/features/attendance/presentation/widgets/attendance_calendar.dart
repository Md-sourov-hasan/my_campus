import 'package:flutter/material.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';

/// Calendar grid showing present/absent/late days for the current month.
class AttendanceCalendar extends StatelessWidget {
  final Map<int, String> calendarData;

  const AttendanceCalendar({super.key, required this.calendarData});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Month Header ────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'September 2026',
                style: getTextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              Row(
                children: [
                  _buildNavButton(Icons.chevron_left_rounded),
                  8.horizontalSpace,
                  _buildNavButton(Icons.chevron_right_rounded),
                ],
              ),
            ],
          ),
          16.verticalSpace,

          // ── Day Headers ─────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                .map((day) => SizedBox(
                      width: 36.w,
                      child: Text(
                        day,
                        textAlign: TextAlign.center,
                        style: getTextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ))
                .toList(),
          ),
          12.verticalSpace,

          // ── Calendar Grid ───────────────────────────────────────
          // Sep 2026 starts on Tuesday (offset = 1)
          _buildCalendarGrid(),
          16.verticalSpace,

          // ── Legend ───────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendItem(AppColors.present, 'Present'),
              16.horizontalSpace,
              _buildLegendItem(AppColors.absent, 'Absent'),
              16.horizontalSpace,
              _buildLegendItem(AppColors.late_, 'Late'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    // Sep 2026 starts on Tuesday → offset = 1
    const int startOffset = 1;
    const int daysInMonth = 30;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 6.h,
        crossAxisSpacing: 6.w,
      ),
      itemCount: startOffset + daysInMonth,
      itemBuilder: (context, index) {
        if (index < startOffset) {
          return const SizedBox(); // Empty cell for offset
        }
        final day = index - startOffset + 1;
        final status = calendarData[day];
        return _buildDayCell(day, status);
      },
    );
  }

  Widget _buildDayCell(int day, String? status) {
    Color bgColor;
    Color textColor;

    switch (status) {
      case 'present':
        bgColor = AppColors.present.withValues(alpha: 0.15);
        textColor = AppColors.present;
        break;
      case 'absent':
        bgColor = AppColors.absent.withValues(alpha: 0.15);
        textColor = AppColors.absent;
        break;
      case 'late':
        bgColor = AppColors.late_.withValues(alpha: 0.15);
        textColor = AppColors.late_;
        break;
      case 'weekend':
        bgColor = Colors.transparent;
        textColor = AppColors.textMuted;
        break;
      default:
        bgColor = Colors.transparent;
        textColor = AppColors.textSecondary;
        break;
    }

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: Text(
          '$day',
          style: getTextStyle(
            fontSize: 12.sp,
            fontWeight: status == 'weekend' ? FontWeight.w400 : FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton(IconData icon) {
    return Container(
      width: 30.w,
      height: 30.w,
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Icon(icon, size: 18.sp, color: AppColors.textSecondary),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3.r),
          ),
        ),
        6.horizontalSpace,
        Text(
          label,
          style: getTextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
