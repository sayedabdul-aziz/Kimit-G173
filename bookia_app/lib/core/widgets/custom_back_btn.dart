import 'package:bookia_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(top: 10, left: 10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}
