import 'package:bookia_app/core/constants/assets/assets_icons.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AuthOptions extends StatelessWidget {
  const AuthOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(child: Divider()),
            Gap(10),
            Text('Or Login with'),
            Gap(10),
            Expanded(child: Divider()),
          ],
        ),
        const Gap(22),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(AssetsIcons.facebook),
              ),
            ),
            const Gap(10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(AssetsIcons.google),
              ),
            ),
            const Gap(10),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset(AssetsIcons.apple),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
