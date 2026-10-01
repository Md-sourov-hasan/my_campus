import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/common/widgets/campus_app_bar.dart';
import 'package:task/core/common/widgets/campus_card.dart';
import 'package:task/core/common/widgets/campus_icon_box.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/routine/controller/routine_controller.dart';

/// Class Routine screen with day tabs and class cards.
class RoutineScreen extends StatelessWidget {
  const RoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    final RoutineController controller = Get.put(RoutineController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CampusAppBar(
        title: 'Class Routine',
        showBackButton: true,
        onBackPressed: () => context.pop(),
      ),
      body: Column(
        children: [
          // ── Day Tabs ──────────────────────────────────────────────
          16.verticalSpace,
          SizedBox(
            height: 48.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: controller.weekDays.length,
              separatorBuilder: (_, _) => 8.horizontalSpace,
              itemBuilder: (context, index) {
                return Obx(() {
                  final isSelected =
                      controller.selectedDayIndex.value == index;
                  return GestureDetector(
                    onTap: () => controller.selectDay(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 60.w,
                      decoration: BoxDecoration(
                        color:
                            isSelected ? AppColors.primary : AppColors.surface,
                        borderRadius: BorderRadius.circular(14.r),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color:
                                      AppColors.primary.withValues(alpha: 0.3),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ]
                            : [
                                BoxShadow(
                                  color: AppColors.shadow,
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                      ),
                      child: Center(
                        child: Text(
                          controller.weekDays[index],
                          style: getTextStyle(
                            fontSize: 14.sp,
                            fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.w500,
                            color: isSelected
                                ? Colors.white
                                : AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                  );
                });
              },
            ),
          ),
          20.verticalSpace,

          // ── Class List ────────────────────────────────────────────
          Expanded(
            child: Obx(() {
              final classes = controller.todayClasses;
              if (classes.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CampusIconBox(
                        icon: Icons.weekend_outlined,
                        color: AppColors.textMuted,
                        size: 64.w,
                      ),
                      16.verticalSpace,
                      Text(
                        'No Classes',
                        style: getTextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      6.verticalSpace,
                      Text(
                        'Enjoy your free day! 🎉',
                        style: getTextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: classes.length,
                separatorBuilder: (_, _) => 12.verticalSpace,
                itemBuilder: (context, index) =>
                    _buildClassCard(classes[index], index),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildClassCard(Map<String, dynamic> classData, int index) {
    final color = classData['color'] as Color;
    final isLab = classData['type'] == 'Lab';

    return CampusCard(
      margin: EdgeInsets.zero,
      child: Row(
        children: [
          // Color accent bar
          Container(
            width: 4.w,
            height: 72.h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          12.horizontalSpace,

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        classData['subject'] as String,
                        style: getTextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (isLab)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Text(
                          'LAB',
                          style: getTextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                            color: color,
                          ),
                        ),
                      ),
                  ],
                ),
                4.verticalSpace,
                Text(
                  classData['code'] as String,
                  style: getTextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textMuted,
                  ),
                ),
                8.verticalSpace,
                Row(
                  children: [
                    Icon(Icons.access_time_rounded,
                        size: 14.sp, color: AppColors.textSecondary),
                    4.horizontalSpace,
                    Text(
                      classData['time'] as String,
                      style: getTextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    16.horizontalSpace,
                    Icon(Icons.room_outlined,
                        size: 14.sp, color: AppColors.textSecondary),
                    4.horizontalSpace,
                    Expanded(
                      child: Text(
                        classData['room'] as String,
                        style: getTextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                6.verticalSpace,
                Row(
                  children: [
                    Icon(Icons.person_outline_rounded,
                        size: 14.sp, color: AppColors.textSecondary),
                    4.horizontalSpace,
                    Text(
                      classData['teacher'] as String,
                      style: getTextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
