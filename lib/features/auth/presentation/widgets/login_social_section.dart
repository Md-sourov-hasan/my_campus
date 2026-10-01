import 'package:flutter/material.dart';
import 'package:task/core/common/widgets/campus_divider_with_text.dart';
import 'package:task/core/common/widgets/campus_social_button.dart';
import 'package:task/core/utils/sizer.dart';

/// Social login section with divider and Google / Apple authentication buttons.
class LoginSocialSection extends StatelessWidget {
  const LoginSocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CampusDividerWithText(text: 'or continue with'),
        24.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CampusSocialButton(
              icon: Icons.g_mobiledata_rounded,
              label: 'Google',
              onTap: () {},
            ),
            16.horizontalSpace,
            CampusSocialButton(
              icon: Icons.apple_rounded,
              label: 'Apple',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
