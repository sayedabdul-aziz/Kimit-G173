import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_3_19/core/utils/colors.dart';
import 'package:taskati_3_19/core/utils/text_styles.dart';
import 'package:taskati_3_19/features/add-task/model/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.model,
  });

  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: model.color == 0
              ? AppColors.primary
              : model.color == 1
                  ? AppColors.orange
                  : model.color == 2
                      ? AppColors.red
                      : AppColors.green),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: getTitleStyle(context, color: AppColors.white),
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
                      '${model.startTime} : ${model.endTime}',
                      style: getSmallStyle(color: AppColors.white),
                    )
                  ],
                ),
                const Gap(6),
                Text(
                  model.note,
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
              model.isCompleted ? 'COMPLETED' : 'TODO',
              style:
                  getTitleStyle(context, fontSize: 14, color: AppColors.white),
            ),
          )
        ],
      ),
    );
  }
}
