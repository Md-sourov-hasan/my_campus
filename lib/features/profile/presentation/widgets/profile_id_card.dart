import 'package:flutter/material.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/common/widgets/campus_icon_box.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/profile/controller/profile_controller.dart';

/// Digital Student/Teacher ID card displaying academic details.
class ProfileIdCard extends StatelessWidget {
  final ProfileController controller;

  const ProfileIdCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowMedium,
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // ── Card Header ─────────────────────────────────────────
          Row(
            children: [
              CampusIconBox(
                icon: Icons.badge_outlined,
                color: AppColors.primary,
                size: 36.w,
                borderRadius: 10.r,
                backgroundOpacity: 0.15,
              ),
              12.horizontalSpace,
              Text(
                'Student ID Card',
                style: getTextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  'Active',
                  style: getTextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.success,
                  ),
                ),
              ),
            ],
          ),
          16.verticalSpace,
          Divider(color: AppColors.divider),
          16.verticalSpace,

          // ── ID Info Grid ────────────────────────────────────────
          Row(
            children: [
              Expanded(
                child: _buildIdField(
                    'Student ID', controller.user['studentId'] as String),
              ),
              Expanded(
                child: _buildIdField(
                    'Batch', controller.user['batch'] as String),
              ),
            ],
          ),
          16.verticalSpace,
          Row(
            children: [
              Expanded(
                child: _buildIdField(
                    'Semester', controller.user['semester'] as String),
              ),
              Expanded(
                child: _buildIdField(
                    'Section', controller.user['section'] as String),
              ),
            ],
          ),
          16.verticalSpace,
          Row(
            children: [
              Expanded(
                child: _buildIdField(
                    'GPA', controller.user['gpa'].toString()),
              ),
              Expanded(
                child: _buildIdField(
                    'Role', controller.user['role'] as String),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIdField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: getTextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textMuted,
          ),
        ),
        4.verticalSpace,
        Text(
          value,
          style: getTextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
