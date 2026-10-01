import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/common/widgets/campus_app_bar.dart';
import 'package:task/core/common/widgets/campus_empty_state.dart';
import 'package:task/core/common/widgets/campus_primary_button.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/routes/app_routes.dart';

/// Friendly placeholder screen for upcoming campus modules and 404 fallbacks.
class ModulePlaceholderScreen extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final String description;

  const ModulePlaceholderScreen({
    super.key,
    required this.title,
    this.icon = Icons.construction_rounded,
    this.iconColor = AppColors.primary,
    this.description =
        'This module is currently in development and will be available in the upcoming update.',
  });

  @override
  Widget build(BuildContext context) {
    Sizer.init(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CampusAppBar(
        title: title,
        showBackButton: true,
        onBackPressed: () {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go(AppRoute.dashboardScreen);
          }
        },
      ),
      body: CampusEmptyState(
        icon: icon,
        title: title,
        subtitle: description,
        iconColor: iconColor,
        actionButton: SizedBox(
          width: 200.w,
          child: CampusPrimaryButton(
            text: 'Back to Dashboard',
            icon: Icons.home_outlined,
            height: 48.h,
            onPressed: () => context.go(AppRoute.dashboardScreen),
          ),
        ),
      ),
    );
  }
}
