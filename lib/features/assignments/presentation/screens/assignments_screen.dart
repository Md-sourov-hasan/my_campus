import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/common/widgets/campus_app_bar.dart';
import 'package:task/core/common/widgets/campus_card.dart';
import 'package:task/core/common/widgets/campus_icon_box.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/assignments/controller/assignments_controller.dart';

/// Assignments screen with filter chips and assignment cards.
class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    final AssignmentsController controller = Get.put(AssignmentsController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CampusAppBar(
        title: 'Assignments',
        showBackButton: true,
        onBackPressed: () => context.pop(),
      ),
      body: Column(
        children: [
          // ── Summary Bar ──────────────────────────────────────────
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            child: Row(
              children: [
                _buildSummaryChip(
                  'Pending',
                  controller.pendingCount,
                  const Color(0xFFF59E0B),
                ),
                8.horizontalSpace,
                _buildSummaryChip(
                  'Submitted',
                  controller.submittedCount,
                  AppColors.primary,
                ),
                8.horizontalSpace,
                _buildSummaryChip(
                  'Graded',
                  controller.gradedCount,
                  const Color(0xFF22C55E),
                ),
              ],
            ),
          ),

          // ── Filter Tabs ──────────────────────────────────────────
          SizedBox(
            height: 40.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: AssignmentsController.filterLabels.length,
              separatorBuilder: (_, _) => 8.horizontalSpace,
              itemBuilder: (context, index) {
                return Obx(() {
                  final isSelected =
                      controller.selectedFilter.value == index;
                  return GestureDetector(
                    onTap: () => controller.selectFilter(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? AppColors.primary : AppColors.surface,
                        borderRadius: BorderRadius.circular(20.r),
                        border: isSelected
                            ? null
                            : Border.all(color: AppColors.border),
                      ),
                      child: Center(
                        child: Text(
                          AssignmentsController.filterLabels[index],
                          style: getTextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
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
          16.verticalSpace,

          // ── Assignment List ──────────────────────────────────────
          Expanded(
            child: Obx(() {
              final assignments = controller.filteredAssignments;
              if (assignments.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CampusIconBox(
                        icon: Icons.assignment_turned_in_outlined,
                        color: AppColors.textMuted,
                        size: 64.w,
                      ),
                      16.verticalSpace,
                      Text(
                        'No Assignments',
                        style: getTextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      6.verticalSpace,
                      Text(
                        'Nothing here for this filter',
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
                itemCount: assignments.length,
                separatorBuilder: (_, _) => 0.verticalSpace,
                itemBuilder: (context, index) =>
                    _buildAssignmentCard(assignments[index]),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryChip(String label, int count, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Text(
              '$count',
              style: getTextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
            2.verticalSpace,
            Text(
              label,
              style: getTextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssignmentCard(Map<String, dynamic> assignment) {
    final color = assignment['color'] as Color;
    final status = assignment['status'] as String;

    return CampusCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CampusIconBox(
                icon: Icons.assignment_outlined,
                color: color,
                size: 40.w,
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      assignment['title'] as String,
                      style: getTextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    4.verticalSpace,
                    Text(
                      '${assignment['subject']} • ${assignment['code']}',
                      style: getTextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              _buildStatusBadge(status),
            ],
          ),
          12.verticalSpace,
          Text(
            assignment['description'] as String,
            style: getTextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          12.verticalSpace,
          Row(
            children: [
              Icon(Icons.calendar_today_outlined,
                  size: 14.sp, color: AppColors.textMuted),
              4.horizontalSpace,
              Text(
                'Due: ${assignment['dueDate']}',
                style: getTextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textMuted,
                ),
              ),
              const Spacer(),
              Icon(Icons.grade_outlined,
                  size: 14.sp, color: AppColors.textMuted),
              4.horizontalSpace,
              Text(
                status == 'graded' || status == 'submitted'
                    ? '${assignment['obtainedMarks'] ?? '—'}/${assignment['marks']}'
                    : 'Marks: ${assignment['marks']}',
                style: getTextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    String label;
    IconData icon;

    switch (status) {
      case 'pending':
        color = const Color(0xFFF59E0B);
        label = 'Pending';
        icon = Icons.schedule_rounded;
        break;
      case 'submitted':
        color = AppColors.primary;
        label = 'Submitted';
        icon = Icons.check_circle_outline_rounded;
        break;
      case 'graded':
        color = const Color(0xFF22C55E);
        label = 'Graded';
        icon = Icons.verified_outlined;
        break;
      default:
        color = AppColors.textMuted;
        label = status;
        icon = Icons.info_outline_rounded;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12.sp, color: color),
          4.horizontalSpace,
          Text(
            label,
            style: getTextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
