import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/utils/constants/colors.dart';
import 'package:task/core/utils/sizer.dart';
import 'package:task/features/profile/controller/profile_controller.dart';
import 'package:task/features/profile/presentation/widgets/profile_contact_info.dart';
import 'package:task/features/profile/presentation/widgets/profile_header.dart';
import 'package:task/features/profile/presentation/widgets/profile_id_card.dart';
import 'package:task/features/profile/presentation/widgets/profile_menu_section.dart';

/// Profile screen — ID-card style student/teacher info layout.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(controller: controller),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  20.verticalSpace,
                  ProfileIdCard(controller: controller),
                  20.verticalSpace,
                  ProfileContactInfo(controller: controller),
                  20.verticalSpace,
                  const ProfileMenuSection(),
                  32.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
