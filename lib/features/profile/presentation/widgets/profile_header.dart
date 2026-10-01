import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/profile/controller/profile_controller.dart';

/// Top header banner with gradient, back button, edit button, avatar, and user information.
class ProfileHeader extends StatelessWidget {
  final ProfileController controller;

  const ProfileHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16.h,
        bottom: 30.h,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1E40AF), AppColors.primary, Color(0xFF3B82F6)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
      ),
      child: Column(
        children: [
          // ── Top Bar ───────────────────────────────────────────
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  'Profile',
                  style: getTextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: controller.toggleEditing,
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.edit_outlined,
                      size: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          20.verticalSpace,

          // ── Avatar ────────────────────────────────────────────
          Container(
            width: 90.w,
            height: 90.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              color: Colors.white.withValues(alpha: 0.2),
            ),
            child: Center(
              child: Text(
                controller.user['name'].toString().substring(0, 1),
                style: getTextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          12.verticalSpace,

          // ── Name & Role ───────────────────────────────────────
          Text(
            controller.user['name'] as String,
            style: getTextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          4.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              controller.user['department'] as String,
              style: getTextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white.withValues(alpha: 0.9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
