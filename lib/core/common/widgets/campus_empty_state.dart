import 'package:flutter/material.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';

/// A friendly empty-state placeholder with icon, title, and subtitle.
///
/// Used when a list or section has no data (e.g., no notifications,
/// no search results, no notices).
class CampusEmptyState extends StatelessWidget {
  /// Large icon displayed in a circular tinted container.
  final IconData icon;

  /// Heading text (e.g., "No Notifications").
  final String title;

  /// Descriptive subtitle text.
  final String subtitle;

  /// Tint color for the icon and its background circle.
  final Color? iconColor;

  /// Optional action button below the subtitle.
  final Widget? actionButton;

  const CampusEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconColor,
    this.actionButton,
  });

  @override
  Widget build(BuildContext context) {
    final color = iconColor ?? AppColors.primary;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 40.sp,
                color: color,
              ),
            ),
            20.verticalSpace,
            Text(
              title,
              style: getTextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            8.verticalSpace,
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: getTextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
                lineHeight: 20,
              ),
            ),
            if (actionButton != null) ...[
              24.verticalSpace,
              actionButton!,
            ],
          ],
        ),
      ),
    );
  }
}
