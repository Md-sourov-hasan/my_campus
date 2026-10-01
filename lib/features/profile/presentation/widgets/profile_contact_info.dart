import 'package:flutter/material.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/common/widgets/campus_card.dart';
import 'package:task/core/common/widgets/campus_icon_box.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/profile/controller/profile_controller.dart';

/// Contact information card displaying student/teacher email and phone.
class ProfileContactInfo extends StatelessWidget {
  final ProfileController controller;

  const ProfileContactInfo({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CampusCard(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Information',
            style: getTextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          16.verticalSpace,
          _buildInfoRow(
            icon: Icons.email_outlined,
            label: 'Email',
            value: controller.user['email'] as String,
          ),
          12.verticalSpace,
          _buildInfoRow(
            icon: Icons.phone_outlined,
            label: 'Phone',
            value: controller.user['phone'] as String,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        CampusIconBox(
          icon: icon,
          color: AppColors.textSecondary,
          size: 36.w,
          borderRadius: 10.r,
          backgroundOpacity: 0.0,
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
                  fontWeight: FontWeight.w400,
                  color: AppColors.textMuted,
                ),
              ),
              Text(
                value,
                style: getTextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
