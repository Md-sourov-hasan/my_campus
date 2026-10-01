import 'package:flutter/material.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';

/// Labeled text field with consistent campus styling.
///
/// Replaces inline TextField + label Column patterns from login_screen,
/// profile_screen, etc. Follows the architecture's CustomTextField spec.
class CampusTextField extends StatelessWidget {
  /// Label displayed above the text field.
  final String label;

  /// Placeholder text inside the field.
  final String hintText;

  /// Text editing controller.
  final TextEditingController? controller;

  /// Whether to obscure text (password fields).
  final bool obscureText;

  /// Keyboard type.
  final TextInputType? keyboardType;

  /// Icon shown before the input text.
  final Widget? prefixIcon;

  /// Icon shown after the input text (e.g., visibility toggle).
  final Widget? suffixIcon;

  /// Maximum lines for multi-line inputs.
  final int maxLines;

  /// Whether the field is enabled.
  final bool enabled;

  /// Optional onChanged callback.
  final ValueChanged<String>? onChanged;

  /// Optional form validator.
  final String? Function(String?)? validator;

  const CampusTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.enabled = true,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: getTextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        8.verticalSpace,
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLines: maxLines,
          enabled: enabled,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: getTextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textMuted,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
