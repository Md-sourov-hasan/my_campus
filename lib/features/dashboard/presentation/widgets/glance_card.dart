import 'package:flutter/material.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/common/widgets/campus_card.dart';
import 'package:task/core/utils/sizer.dart';

/// "Today at a Glance" gradient card showing next class, pending assignment, latest notice.
class GlanceCard extends StatelessWidget {
  final Map<String, dynamic> glanceData;

  const GlanceCard({super.key, required this.glanceData});

  @override
  Widget build(BuildContext context) {
    final nextClass = glanceData['nextClass'] as Map<String, dynamic>;
    final assignment = glanceData['pendingAssignment'] as Map<String, dynamic>;

    return CampusGradientCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ──────────────────────────────────────────────
          Row(
            children: [
              Icon(Icons.wb_sunny_rounded,
                  size: 18.sp, color: Colors.amber.shade300),
              8.horizontalSpace,
              Text(
                'Today at a Glance',
                style: getTextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          16.verticalSpace,

          // ── Next Class ──────────────────────────────────────────
          _buildGlanceRow(
            icon: Icons.class_outlined,
            label: 'Next Class',
            value: '${nextClass['subject']}',
            subtitle: '${nextClass['time']} • ${nextClass['room']}',
          ),
          12.verticalSpace,

          // Divider
          Container(
            height: 1,
            color: Colors.white.withValues(alpha: 0.15),
          ),
          12.verticalSpace,

          // ── Pending Assignment ──────────────────────────────────
          _buildGlanceRow(
            icon: Icons.assignment_outlined,
            label: 'Due Soon',
            value: '${assignment['title']}',
            subtitle:
                '${assignment['subject']} • ${assignment['daysLeft']} days left',
          ),
        ],
      ),
    );
  }

  Widget _buildGlanceRow({
    required IconData icon,
    required String label,
    required String value,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(icon, size: 18.sp, color: Colors.white),
        ),
        12.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: getTextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ),
              2.verticalSpace,
              Text(
                value,
                style: getTextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              2.verticalSpace,
              Text(
                subtitle,
                style: getTextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
