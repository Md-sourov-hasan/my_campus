import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/common/widgets/campus_card.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/notifications/controller/notifications_controller.dart';

/// Interactive tile displaying a single notification.
class NotificationTile extends StatelessWidget {
  final NotificationItem item;
  final VoidCallback? onTap;
  final VoidCallback? onDismissed;

  const NotificationTile({
    super.key,
    required this.item,
    this.onTap,
    this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDismissed?.call(),
      background: Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.only(right: 20.w),
        decoration: BoxDecoration(
          color: AppColors.error,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Icon(
          Icons.delete_outline_rounded,
          color: Colors.white,
          size: 24.sp,
        ),
      ),
      child: Obx(
        () {
          final isRead = item.isRead.value;
          return CampusCard(
            onTap: onTap,
            border: isRead
                ? Border.all(color: AppColors.border.withValues(alpha: 0.5))
                : Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
            backgroundColor: isRead
                ? AppColors.cardBackground
                : AppColors.primarySurface.withValues(alpha: 0.25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Category Icon Badge ──────────────────────────────
                _buildCategoryBadge(item.category),
                12.horizontalSpace,

                // ── Notification Details ─────────────────────────────
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              item.title,
                              style: getTextStyle(
                                fontSize: 14.sp,
                                fontWeight: isRead ? FontWeight.w600 : FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                          if (!isRead) ...[
                            6.horizontalSpace,
                            Container(
                              width: 8.w,
                              height: 8.w,
                              margin: EdgeInsets.only(top: 4.h),
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ],
                      ),
                      6.verticalSpace,
                      Text(
                        item.message,
                        style: getTextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                          lineHeight: 18,
                        ),
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            size: 12.sp,
                            color: AppColors.textMuted,
                          ),
                          4.horizontalSpace,
                          Text(
                            item.time,
                            style: getTextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoryBadge(String category) {
    IconData icon;
    Color iconColor;
    Color bgColor;

    switch (category) {
      case 'academic':
        icon = Icons.school_outlined;
        iconColor = AppColors.primary;
        bgColor = AppColors.primarySurface;
        break;
      case 'attendance':
        icon = Icons.fact_check_outlined;
        iconColor = AppColors.warning;
        bgColor = const Color(0xFFFEF3C7);
        break;
      case 'notice':
        icon = Icons.campaign_outlined;
        iconColor = AppColors.tagEvent;
        bgColor = const Color(0xFFEDE9FE);
        break;
      case 'fee':
        icon = Icons.account_balance_wallet_outlined;
        iconColor = AppColors.success;
        bgColor = const Color(0xFFDCFCE7);
        break;
      default:
        icon = Icons.notifications_outlined;
        iconColor = AppColors.info;
        bgColor = const Color(0xFFE0F2FE);
    }

    return Container(
      width: 42.w,
      height: 42.w,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(
        icon,
        size: 20.sp,
        color: iconColor,
      ),
    );
  }
}
