import 'package:flutter/material.dart';
import 'package:se7ety_5_28/core/utils/colors.dart';
import 'package:se7ety_5_28/core/utils/styles.dart';

class SettingsListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;
  final void Function()? onTap;

  const SettingsListItem(
      {super.key,
      required this.icon,
      required this.text,
      this.hasNavigation = true,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 55,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.scaffoldBG,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(text, style: getsmallStyle(fontWeight: FontWeight.w600)),
            const Spacer(),
            if (hasNavigation)
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
              ),
          ],
        ),
      ),
    );
  }
}
