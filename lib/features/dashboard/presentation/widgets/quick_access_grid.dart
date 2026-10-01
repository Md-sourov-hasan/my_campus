import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';

/// Quick-access module grid for the dashboard.
class QuickAccessGrid extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const QuickAccessGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 0.85,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _QuickAccessTile(
          title: item['title'] as String,
          icon: item['icon'] as IconData,
          color: item['color'] as Color,
          onTap: () {
            final route = item['route'] as String;
            context.push(route);
          },
        );
      },
    );
  }
}

class _QuickAccessTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _QuickAccessTile({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 52.w,
            height: 52.w,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(icon, size: 24.sp, color: color),
          ),
          6.verticalSpace,
          Text(
            title,
            style: getTextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
