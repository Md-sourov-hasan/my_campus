import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/common/styles/global_text_style.dart';
import 'package:task/core/common/widgets/campus_app_bar.dart';
import 'package:task/core/common/widgets/campus_card.dart';
import 'package:task/core/common/widgets/campus_icon_box.dart';
import 'package:task/core/common/widgets/campus_text_field.dart';
import 'package:task/core/common/widgets/campus_toggle.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/library/controller/library_controller.dart';

/// Digital Library screen with search, category filter, and book cards.
class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    final LibraryController controller = Get.put(LibraryController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CampusAppBar(
        title: 'Digital Library',
        showBackButton: true,
        onBackPressed: () => context.pop(),
      ),
      body: Column(
        children: [
          12.verticalSpace,

          // ── Tab Toggle ────────────────────────────────────────────
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Obx(() => CampusToggle(
                  items: const [
                    CampusToggleItem(
                        label: 'Browse', icon: Icons.search_rounded),
                    CampusToggleItem(
                        label: 'Borrowed', icon: Icons.bookmark_rounded),
                  ],
                  selectedIndex: controller.selectedTab.value,
                  onChanged: controller.switchTab,
                  selectedColor: AppColors.surface,
                  selectedTextColor: AppColors.primary,
                  showSelectedShadow: true,
                )),
          ),
          16.verticalSpace,

          // ── Content ───────────────────────────────────────────────
          Expanded(
            child: Obx(() => controller.selectedTab.value == 0
                ? _buildBrowseView(controller)
                : _buildBorrowedView(controller)),
          ),
        ],
      ),
    );
  }

  Widget _buildBrowseView(LibraryController controller) {
    return Column(
      children: [
        // Search
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CampusTextField(
            label: '',
            hintText: 'Search books or authors...',
            prefixIcon: Icon(Icons.search_rounded,
                size: 20.w, color: AppColors.textMuted),
            onChanged: controller.updateSearch,
          ),
        ),
        12.verticalSpace,

        // Category chips
        SizedBox(
          height: 36.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemCount: controller.categories.length,
            separatorBuilder: (_, _) => 8.horizontalSpace,
            itemBuilder: (context, index) {
              return Obx(() {
                final isSelected =
                    controller.selectedCategory.value == index;
                return GestureDetector(
                  onTap: () => controller.selectCategory(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.surface,
                      borderRadius: BorderRadius.circular(18.r),
                      border: isSelected
                          ? null
                          : Border.all(color: AppColors.border),
                    ),
                    child: Center(
                      child: Text(
                        controller.categories[index],
                        style: getTextStyle(
                          fontSize: 12.sp,
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
        12.verticalSpace,

        // Book list
        Expanded(
          child: Obx(() {
            final books = controller.filteredBooks;
            if (books.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CampusIconBox(
                      icon: Icons.menu_book_outlined,
                      color: AppColors.textMuted,
                      size: 64.w,
                    ),
                    16.verticalSpace,
                    Text(
                      'No Books Found',
                      style: getTextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    6.verticalSpace,
                    Text(
                      'Try a different search or category',
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
              itemCount: books.length,
              separatorBuilder: (_, _) => 0.verticalSpace,
              itemBuilder: (context, index) => _buildBookCard(books[index]),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildBookCard(Map<String, dynamic> book) {
    final color = book['color'] as Color;
    final isAvailable = book['available'] as bool;

    return CampusCard(
      child: Row(
        children: [
          // Book icon
          Container(
            width: 56.w,
            height: 72.h,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              Icons.menu_book_rounded,
              size: 28.sp,
              color: color,
            ),
          ),
          12.horizontalSpace,

          // Book info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book['title'] as String,
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
                  book['author'] as String,
                  style: getTextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
                4.verticalSpace,
                Row(
                  children: [
                    Text(
                      book['edition'] as String,
                      style: getTextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textMuted,
                      ),
                    ),
                    8.horizontalSpace,
                    Container(
                      width: 4.w,
                      height: 4.w,
                      decoration: BoxDecoration(
                        color: AppColors.textMuted,
                        shape: BoxShape.circle,
                      ),
                    ),
                    8.horizontalSpace,
                    Text(
                      '${book['copies']}/${book['totalCopies']} copies',
                      style: getTextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Availability badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: isAvailable
                  ? const Color(0xFF22C55E).withValues(alpha: 0.12)
                  : AppColors.error.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              isAvailable ? 'Available' : 'Unavailable',
              style: getTextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: isAvailable ? const Color(0xFF22C55E) : AppColors.error,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBorrowedView(LibraryController controller) {
    final borrowed = controller.borrowedBooks;

    if (borrowed.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CampusIconBox(
              icon: Icons.bookmark_border_rounded,
              color: AppColors.textMuted,
              size: 64.w,
            ),
            16.verticalSpace,
            Text(
              'No Borrowed Books',
              style: getTextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            6.verticalSpace,
            Text(
              'Books you borrow will appear here',
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
      itemCount: borrowed.length,
      separatorBuilder: (_, _) => 0.verticalSpace,
      itemBuilder: (context, index) =>
          _buildBorrowedCard(borrowed[index]),
    );
  }

  Widget _buildBorrowedCard(Map<String, dynamic> book) {
    final color = book['color'] as Color;
    final isOverdue = book['isOverdue'] as bool;

    return CampusCard(
      border: isOverdue
          ? Border.all(color: AppColors.error.withValues(alpha: 0.3), width: 1)
          : null,
      child: Row(
        children: [
          CampusIconBox(
            icon: Icons.bookmark_rounded,
            color: color,
            size: 44.w,
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book['title'] as String,
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
                  book['author'] as String,
                  style: getTextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
                8.verticalSpace,
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 12.sp,
                      color: isOverdue ? AppColors.error : AppColors.textMuted,
                    ),
                    4.horizontalSpace,
                    Text(
                      'Due: ${book['dueDate']}',
                      style: getTextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color:
                            isOverdue ? AppColors.error : AppColors.textMuted,
                      ),
                    ),
                    if (isOverdue) ...[
                      8.horizontalSpace,
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.error.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          'OVERDUE',
                          style: getTextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.error,
                          ),
                        ),
                      ),
                    ],
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
