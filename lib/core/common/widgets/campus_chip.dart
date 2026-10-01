import 'package:flutter/material.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';

/// Colored chip for category tags (Exam, Event, Academic, Urgent).
class CampusChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final IconData? icon;

  const CampusChip({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.icon,
  });

  /// Factory constructors for common tag types.
  factory CampusChip.exam() => const CampusChip(
        label: 'Exam',
        backgroundColor: Color(0xFFFEE2E2),
        textColor: AppColors.tagExam,
        icon: Icons.school_outlined,
      );

  factory CampusChip.event() => const CampusChip(
        label: 'Event',
        backgroundColor: Color(0xFFEDE9FE),
        textColor: AppColors.tagEvent,
        icon: Icons.celebration_outlined,
      );

  factory CampusChip.academic() => const CampusChip(
        label: 'Academic',
        backgroundColor: Color(0xFFDBEAFE),
        textColor: AppColors.tagAcademic,
        icon: Icons.menu_book_outlined,
      );

  factory CampusChip.urgent() => const CampusChip(
        label: 'Urgent',
        backgroundColor: Color(0xFFFEF3C7),
        textColor: AppColors.tagUrgent,
        icon: Icons.warning_amber_rounded,
      );

  /// Resolves a category string to the matching chip factory.
  /// Eliminates duplicated switch-case helpers across screens.
  static CampusChip fromCategory(String category) {
    switch (category) {
      case 'Exam':
        return CampusChip.exam();
      case 'Event':
        return CampusChip.event();
      case 'Urgent':
        return CampusChip.urgent();
      default:
        return CampusChip.academic();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12.sp, color: textColor),
            4.horizontalSpace,
          ],
          Text(
            label,
            style: getTextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
