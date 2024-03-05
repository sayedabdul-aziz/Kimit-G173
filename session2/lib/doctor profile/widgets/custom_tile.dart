import 'package:flutter/material.dart';
import 'package:session2/doctor%20profile/colors.dart';

class CustomTileWidget extends StatelessWidget {
  const CustomTileWidget({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.primary,
            child: Icon(
              icon,
              size: 19,
              color: AppColors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
