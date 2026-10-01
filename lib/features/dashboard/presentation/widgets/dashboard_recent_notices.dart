import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/common/widgets/campus_card.dart';
import 'package:task/core/common/widgets/campus_chip.dart';
import 'package:task/core/common/widgets/campus_icon_box.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/routes/app_routes.dart';

/// Recent notices list widget on the dashboard.
class DashboardRecentNotices extends StatelessWidget {
  final List<Map<String, dynamic>> notices;

  const DashboardRecentNotices({super.key, required this.notices});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: notices.map((notice) {
        final category = notice['category'] as String;
        return CampusCard(
          onTap: () => context.push(
            AppRoute.noticeDetailScreen,
            extra: notice,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category icon
              CampusIconBox(
                icon: _getCategoryIcon(category),
                color: _getCategoryColor(category),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CampusChip.fromCategory(category),
                        const Spacer(),
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
                      ],
                    ),
                    6.verticalSpace,
                    Text(
                      notice['title'] as String,
                      style: getTextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    4.verticalSpace,
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
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Exam':
        return AppColors.tagExam;
      case 'Event':
        return AppColors.tagEvent;
      case 'Urgent':
        return AppColors.tagUrgent;
      default:
        return AppColors.tagAcademic;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Exam':
        return Icons.school_outlined;
      case 'Event':
        return Icons.celebration_outlined;
      case 'Urgent':
        return Icons.warning_amber_rounded;
      default:
        return Icons.menu_book_outlined;
    }
  }
}
