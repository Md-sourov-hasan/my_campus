import 'package:flutter/material.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';

/// A reusable segmented toggle bar with animated selection indicator.
///
/// Used for two- or multi-tab switching (e.g. Student/Teacher role toggle,
/// Subjects/Calendar attendance tabs).
class CampusToggle extends StatelessWidget {
  /// List of tab data — each item needs a [label] at minimum.
  final List<CampusToggleItem> items;

  /// Index of the currently selected tab.
  final int selectedIndex;

  /// Called when the user taps a tab.
  final ValueChanged<int> onChanged;

  /// Background color of the toggle container.
  final Color? backgroundColor;

  /// Color of the selected tab.
  final Color? selectedColor;

  /// Text color for the selected tab. Defaults to [AppColors.textOnPrimary].
  final Color? selectedTextColor;

  /// Whether the selected tab gets an elevation shadow.
  final bool showSelectedShadow;

  const CampusToggle({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onChanged,
    this.backgroundColor,
    this.selectedColor,
    this.selectedTextColor,
    this.showSelectedShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.inputBackground,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = selectedIndex == index;
          final activeColor = selectedColor ?? AppColors.primary;
          final activeTextColor =
              selectedTextColor ?? AppColors.textOnPrimary;

          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: isSelected ? activeColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: isSelected && showSelectedShadow
                      ? [
                          BoxShadow(
                            color: activeColor.withValues(alpha: 0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (item.icon != null) ...[
                      Icon(
                        item.icon,
                        size: 18.sp,
                        color: isSelected
                            ? activeTextColor
                            : AppColors.textSecondary,
                      ),
                      8.horizontalSpace,
                    ],
                    Text(
                      item.label,
                      textAlign: TextAlign.center,
                      style: getTextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? activeTextColor
                            : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

/// Data model for a single toggle tab.
class CampusToggleItem {
  final String label;
  final IconData? icon;

  const CampusToggleItem({required this.label, this.icon});
}
