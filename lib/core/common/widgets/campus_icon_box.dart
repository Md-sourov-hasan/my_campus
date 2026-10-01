import 'package:flutter/material.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';

/// A small square container with a tinted background and centered icon.
///
/// Seen repeatedly in dashboard (category icon, attendance icon),
/// profile (info row icon, badge icon), notice detail (author icon), etc.
class CampusIconBox extends StatelessWidget {
  /// The icon to display.
  final IconData icon;

  /// Icon/tint color. Defaults to [AppColors.primary].
  final Color? color;

  /// Size of the box (width & height). Defaults to 40.w.
  final double? size;

  /// Border radius. Defaults to 12.r.
  final double? borderRadius;

  /// Background opacity for the tint. Defaults to 0.1.
  final double backgroundOpacity;

  const CampusIconBox({
    super.key,
    required this.icon,
    this.color,
    this.size,
    this.borderRadius,
    this.backgroundOpacity = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? AppColors.primary;
    final boxSize = size ?? 40.w;

    return Container(
      width: boxSize,
      height: boxSize,
      decoration: BoxDecoration(
        color: iconColor.withValues(alpha: backgroundOpacity),
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
      ),
      child: Icon(
        icon,
        size: boxSize * 0.45,
        color: iconColor,
      ),
    );
  }
}
