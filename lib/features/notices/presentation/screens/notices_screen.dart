import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/common/widgets/campus_app_bar.dart';
import 'package:task/core/common/widgets/campus_filter_bar.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/notices/controller/notices_controller.dart';
import 'package:task/features/notices/presentation/widgets/notice_card.dart';
import 'package:task/routes/app_routes.dart';

/// Notices list screen with category filter chips.
class NoticesScreen extends StatelessWidget {
  const NoticesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    final NoticesController controller = Get.put(NoticesController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CampusAppBar(
        title: 'Notices',
        showBackButton: true,
        onBackPressed: () => context.pop(),
      ),
      body: Column(
        children: [
          // ── Category Filter Chips ───────────────────────────────
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Obx(() => CampusFilterBar(
                  filters: controller.categories,
                  selectedFilter: controller.selectedCategory.value,
                  onFilterSelected: controller.filterByCategory,
                )),
          ),
          12.verticalSpace,

          // ── Notices List ────────────────────────────────────────
          Expanded(
            child: Obx(() => ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  itemCount: controller.filteredNotices.length,
                  itemBuilder: (context, index) {
                    final notice = controller.filteredNotices[index];
                    return NoticeCard(
                      notice: notice,
                      onTap: () => context.push(
                        AppRoute.noticeDetailScreen,
                        extra: notice,
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
