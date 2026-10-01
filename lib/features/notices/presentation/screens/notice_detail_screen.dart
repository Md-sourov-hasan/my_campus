import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/common/widgets/campus_app_bar.dart';
import 'package:task/core/common/widgets/campus_chip.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/notices/presentation/widgets/notice_author_card.dart';

/// Notice detail screen — full content view of a single notice.
class NoticeDetailScreen extends StatelessWidget {
  final Map<String, dynamic> notice;

  const NoticeDetailScreen({super.key, required this.notice});

  @override
  Widget build(BuildContext context) {
    Sizer.init(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CampusAppBar(
        title: 'Notice',
        showBackButton: true,
        onBackPressed: () => context.pop(),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Icon(
              Icons.share_outlined,
              size: 22.sp,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.verticalSpace,

              // ── Category + Date ─────────────────────────────────
              Row(
                children: [
                  CampusChip.fromCategory(notice['category'] as String),
                  const Spacer(),
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 14.sp,
                    color: AppColors.textMuted,
                  ),
                  6.horizontalSpace,
                  Text(
                    notice['date'] as String,
                    style: getTextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              20.verticalSpace,

              // ── Title ───────────────────────────────────────────
              Text(
                notice['title'] as String,
                style: getTextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  lineHeight: 30,
                ),
              ),
              16.verticalSpace,

              // ── Author Info ─────────────────────────────────────
              NoticeAuthorCard(author: notice['author'] as String),
              24.verticalSpace,

              // ── Description ─────────────────────────────────────
              Text(
                notice['description'] as String,
                style: getTextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                  lineHeight: 24,
                ),
              ),
              40.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
