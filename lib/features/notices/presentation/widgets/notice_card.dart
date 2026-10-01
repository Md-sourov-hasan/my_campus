import 'package:flutter/material.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/common/widgets/campus_card.dart';
import 'package:task/core/common/widgets/campus_chip.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';

/// A single notice card for the notices list.
class NoticeCard extends StatelessWidget {
  final Map<String, dynamic> notice;
  final VoidCallback? onTap;

  const NoticeCard({
    super.key,
    required this.notice,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CampusCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Top Row: Category + New Badge + Date ─────────────────
          Row(
            children: [
              _buildCategoryChip(notice['category'] as String),
              8.horizontalSpace,
              if (notice['isNew'] == true)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.w,
                    vertical: 2.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    'NEW',
                    style: getTextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              const Spacer(),
              Text(
                notice['date'] as String,
                style: getTextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
          12.verticalSpace,

          // ── Title ───────────────────────────────────────────────
          Text(
            notice['title'] as String,
            style: getTextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          8.verticalSpace,

          // ── Author ──────────────────────────────────────────────
          Row(
            children: [
              Icon(
                Icons.person_outline_rounded,
                size: 14.sp,
                color: AppColors.textMuted,
              ),
              4.horizontalSpace,
              Text(
                notice['author'] as String,
                style: getTextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
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
}
