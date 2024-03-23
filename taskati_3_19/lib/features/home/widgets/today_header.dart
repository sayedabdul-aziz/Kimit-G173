import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati_3_19/core/functions/routing.dart';
import 'package:taskati_3_19/core/utils/colors.dart';
import 'package:taskati_3_19/core/utils/text_styles.dart';
import 'package:taskati_3_19/features/add-task/views/add_task_view.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMEd().format(DateTime.now()),
              style: getTitleStyle(),
            ),
            Text(
              'Today',
              style: getTitleStyle(),
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            navigateTo(context, const AddTaskView());
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.primary,
              // gradient: const LinearGradient(colors: []),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '+ Add Task',
              style: getBodyStyle(color: AppColors.white),
            ),
          ),
        )
      ],
    );
  }
}
