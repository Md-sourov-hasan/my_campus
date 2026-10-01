import 'package:flutter/material.dart';

/// Centralized color constants for the MyCampus app.
/// Blue & White design theme with royal blue primary.
class AppColors {
  AppColors._();

  // ── Primary Palette ──────────────────────────────────────────────
  static const Color primary = Color(0xFF1A56DB);
  static const Color primaryLight = Color(0xFF3B82F6);
  static const Color primaryDark = Color(0xFF1E40AF);
  static const Color primarySurface = Color(0xFFDBEAFE); // light blue tint

  // ── Accent ────────────────────────────────────────────────────────
  static const Color accent = Color(0xFF60A5FA);
  static const Color accentLight = Color(0xFFBFDBFE);

  // ── Backgrounds ──────────────────────────────────────────────────
  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // ── Text ─────────────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textMuted = Color(0xFF94A3B8);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // ── Borders & Dividers ───────────────────────────────────────────
  static const Color border = Color(0xFFE2E8F0);
  static const Color divider = Color(0xFFF1F5F9);

  // ── Input ────────────────────────────────────────────────────────
  static const Color inputBackground = Color(0xFFF1F5F9);
  static const Color inputBorder = Color(0xFFE2E8F0);

  // ── Status ───────────────────────────────────────────────────────
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // ── Category Tags ────────────────────────────────────────────────
  static const Color tagExam = Color(0xFFEF4444);
  static const Color tagEvent = Color(0xFF8B5CF6);
  static const Color tagAcademic = Color(0xFF3B82F6);
  static const Color tagUrgent = Color(0xFFF59E0B);

  // ── Attendance ───────────────────────────────────────────────────
  static const Color present = Color(0xFF22C55E);
  static const Color absent = Color(0xFFEF4444);
  static const Color late_ = Color(0xFFF59E0B);

  // ── Shadows ──────────────────────────────────────────────────────
  static const Color shadow = Color(0x0A000000);
  static const Color shadowMedium = Color(0x14000000);
}
