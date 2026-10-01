import 'package:flutter/material.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';

/// A horizontal divider with centered text (e.g., "or continue with").
///
/// Common in authentication screens between primary and social login sections.
class CampusDividerWithText extends StatelessWidget {
  final String text;
  final Color? lineColor;
  final Color? textColor;

  const CampusDividerWithText({
    super.key,
    required this.text,
    this.lineColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: lineColor ?? AppColors.border)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            text,
            style: getTextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: textColor ?? AppColors.textMuted,
            ),
          ),
        ),
        Expanded(child: Divider(color: lineColor ?? AppColors.border)),
      ],
    );
  }
}
