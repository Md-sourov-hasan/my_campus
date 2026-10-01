import 'package:flutter/material.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';

/// Full-width primary action button with built-in loading state.
///
/// Replaces inline ElevatedButton patterns seen across login, profile, etc.
class CampusPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  /// Optional custom height (defaults to 52.h).
  final double? height;

  /// Optional custom border radius (defaults to 14.r).
  final double? borderRadius;

  /// Optional background color override (defaults to AppColors.primary).
  final Color? backgroundColor;

  /// Optional text color override (defaults to AppColors.textOnPrimary).
  final Color? textColor;

  /// Optional leading icon.
  final IconData? icon;

  const CampusPrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.textColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final fgColor = textColor ?? AppColors.textOnPrimary;

    return SizedBox(
      width: double.infinity,
      height: height ?? 52.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: fgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 14.r),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                height: 22.w,
                width: 22.w,
                child: CircularProgressIndicator(
                  color: fgColor,
                  strokeWidth: 2.5,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 20.sp, color: fgColor),
                    8.horizontalSpace,
                  ],
                  Text(
                    text,
                    style: getTextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: fgColor,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
