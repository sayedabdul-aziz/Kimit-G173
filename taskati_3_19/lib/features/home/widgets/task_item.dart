import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_3_19/core/utils/colors.dart';
import 'package:taskati_3_19/core/utils/text_styles.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.primary),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'fLUTER',
                  style: getTitleStyle(color: AppColors.white),
                ),
                const Gap(6),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: AppColors.white,
                    ),
                    const Gap(5),
                    Text(
                      '12:00 PM : 12:10 PM',
                      style: getSmallStyle(color: AppColors.white),
                    )
                  ],
                ),
                const Gap(6),
                Text(
                  'NOTE',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getSmallStyle(color: AppColors.white),
                ),
              ],
            ),
          ),
          const Gap(15),
          Container(
            width: .5,
            height: 60,
            color: AppColors.white,
          ),
          const Gap(5),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              'TODO',
              style: getTitleStyle(fontSize: 14, color: AppColors.white),
            ),
          )
        ],
      ),
    );
  }
}
