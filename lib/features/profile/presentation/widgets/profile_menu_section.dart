import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/common/widgets/campus_card.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/routes/app_routes.dart';

/// Settings, Support, About, and Sign Out menu list in profile screen.
class ProfileMenuSection extends StatelessWidget {
  const ProfileMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      {
        'icon': Icons.settings_outlined,
        'title': 'Settings',
        'color': AppColors.textSecondary
      },
      {
        'icon': Icons.help_outline_rounded,
        'title': 'Help & Support',
        'color': AppColors.textSecondary
      },
      {
        'icon': Icons.info_outline_rounded,
        'title': 'About MyCampus',
        'color': AppColors.textSecondary
      },
      {
        'icon': Icons.logout_rounded,
        'title': 'Sign Out',
        'color': AppColors.error
      },
    ];

    return CampusCard(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Column(
        children: menuItems.map((item) {
          final isLast = item == menuItems.last;
          return Column(
            children: [
              InkWell(
                onTap: () {
                  if (isLast) {
                    // Sign out — go back to login
                    context.go(AppRoute.loginScreen);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        item['icon'] as IconData,
                        size: 20.sp,
                        color: item['color'] as Color,
                      ),
                      14.horizontalSpace,
                      Expanded(
                        child: Text(
                          item['title'] as String,
                          style: getTextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: isLast
                                ? AppColors.error
                                : AppColors.textPrimary,
                          ),
                        ),
                      ),
                      if (!isLast)
                        Icon(
                          Icons.chevron_right_rounded,
                          size: 20.sp,
                          color: AppColors.textMuted,
                        ),
                    ],
                  ),
                ),
              ),
              if (!isLast)
                Divider(
                  height: 1,
                  color: AppColors.divider,
                  indent: 52.w,
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
