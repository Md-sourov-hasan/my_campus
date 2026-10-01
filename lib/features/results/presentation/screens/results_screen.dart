import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/common/widgets/campus_app_bar.dart';
import 'package:task/core/common/widgets/campus_card.dart';
import 'package:task/core/common/widgets/campus_icon_box.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/results/controller/results_controller.dart';

/// Results & Grades screen with CGPA overview and expandable semester cards.
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    final ResultsController controller = Get.put(ResultsController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CampusAppBar(
        title: 'Results & Grades',
        showBackButton: true,
        onBackPressed: () => context.pop(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.verticalSpace,
              _buildCGPACard(controller),
              24.verticalSpace,
              _buildStatsRow(controller),
              24.verticalSpace,
              Text(
                'Semester Results',
                style: getTextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              16.verticalSpace,
              ...List.generate(
                controller.semesters.length,
                (index) => _buildSemesterCard(controller, index),
              ),
              32.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  /// CGPA gradient hero card.
  Widget _buildCGPACard(ResultsController controller) {
    final overview = controller.overview;

    return CampusGradientCard(
      child: Column(
        children: [
          Text(
            'Cumulative GPA',
            style: getTextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
          ),
          8.verticalSpace,
          Text(
            '${overview['cgpa']}',
            style: getTextStyle(
              fontSize: 48.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          4.verticalSpace,
          Text(
            'out of 4.00',
            style: getTextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white60,
            ),
          ),
          16.verticalSpace,
          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: LinearProgressIndicator(
              value: (overview['cgpa'] as num) / 4.0,
              minHeight: 8.h,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  /// Quick stats row.
  Widget _buildStatsRow(ResultsController controller) {
    final overview = controller.overview;

    return Row(
      children: [
        _buildStatItem(
          icon: Icons.school_outlined,
          label: 'Credits',
          value: '${overview['totalCredits']}',
          color: AppColors.primary,
        ),
        12.horizontalSpace,
        _buildStatItem(
          icon: Icons.timeline_outlined,
          label: 'Semesters',
          value: '${overview['completedSemesters']}',
          color: const Color(0xFF22C55E),
        ),
        12.horizontalSpace,
        _buildStatItem(
          icon: Icons.emoji_events_outlined,
          label: 'Rank',
          value: '${overview['rank']}/${overview['totalStudents']}',
          color: const Color(0xFFF59E0B),
        ),
      ],
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Expanded(
      child: CampusCard(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
        child: Column(
          children: [
            CampusIconBox(icon: icon, color: color, size: 36.w),
            8.verticalSpace,
            Text(
              value,
              style: getTextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            2.verticalSpace,
            Text(
              label,
              style: getTextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Expandable semester card with course grades.
  Widget _buildSemesterCard(ResultsController controller, int index) {
    final semester = controller.semesters[index];
    final courses = semester['courses'] as List;

    return Obx(() {
      final isExpanded = controller.expandedSemester.value == index;

      return CampusCard(
        onTap: () => controller.toggleSemester(index),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      semester['semester'] as String,
                      style: getTextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      semester['session'] as String,
                      style: getTextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primarySurface,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        'GPA ${semester['gpa']}',
                        style: getTextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    8.horizontalSpace,
                    AnimatedRotation(
                      turns: isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 24.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Expanded course list
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Column(
                children: [
                  16.verticalSpace,
                  Divider(color: AppColors.divider, height: 1),
                  12.verticalSpace,
                  // Table header
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            'Course',
                            style: getTextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Cr',
                              style: getTextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textMuted,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Grade',
                              style: getTextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textMuted,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Point',
                              style: getTextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textMuted,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ...courses.map((course) => Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    course['name'] as String,
                                    style: getTextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textPrimary,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    course['code'] as String,
                                    style: getTextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textMuted,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  '${course['credits']}',
                                  style: getTextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 2.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _gradeColor(course['grade'] as String)
                                        .withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Text(
                                    course['grade'] as String,
                                    style: getTextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          _gradeColor(course['grade'] as String),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  '${course['point']}',
                                  style: getTextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 250),
            ),
          ],
        ),
      );
    });
  }

  Color _gradeColor(String grade) {
    switch (grade) {
      case 'A':
      case 'A+':
        return const Color(0xFF22C55E);
      case 'A-':
        return const Color(0xFF3B82F6);
      case 'B+':
        return const Color(0xFFF59E0B);
      case 'B':
        return const Color(0xFFEF4444);
      default:
        return AppColors.textSecondary;
    }
  }
}
