import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized text style factory for the MyCampus app.
/// Uses Google Fonts Poppins as the primary typeface.
TextStyle getTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
  double? lineHeight,
  double? letterSpacing,
}) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    height: lineHeight != null ? lineHeight / fontSize : null,
    letterSpacing: letterSpacing,
  );
}
