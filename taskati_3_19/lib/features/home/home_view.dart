import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_3_19/core/constants/assets_images.dart';
import 'package:taskati_3_19/core/utils/colors.dart';
import 'package:taskati_3_19/core/utils/text_styles.dart';
import 'package:taskati_3_19/features/add-task/model/task_model.dart';
import 'package:taskati_3_19/features/home/widgets/home_header.dart';
import 'package:taskati_3_19/features/home/widgets/task_item.dart';
import 'package:taskati_3_19/features/home/widgets/today_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const HomeHeader(),
            const Gap(15),
            const TodayHeader(),
            const Gap(15),
            DatePicker(
              DateTime.now(),
              height: 100,
              width: 70,
              initialSelectedDate: DateTime.now(),
              selectionColor: AppColors.primary,
              selectedTextColor: Colors.white,
              dateTextStyle: getBodyStyle(context, fontSize: 18),
              dayTextStyle: getBodyStyle(context, fontSize: 12),
              monthTextStyle: getBodyStyle(context, fontSize: 12),
              onDateChange: (date) {
                // New date selected
                setState(() {
                  selectedDate = DateFormat('dd/MM/yyyy').format(date);
                });
              },
            ),
            const Gap(15),
            Expanded(
              child: ValueListenableBuilder<Box<TaskModel>>(
                valueListenable: Hive.box<TaskModel>('task').listenable(),
                builder:
                    (BuildContext context, Box<TaskModel> box, Widget? child) {
                  List<TaskModel> tasks = box.values
                      .where((task) => task.date == selectedDate)
                      .toList();
                  return tasks.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(AssetsImages.noTask, width: 250),
                              const Gap(40),
                              Text(
                                'No Tasks Found!',
                                style: getBodyStyle(
                                  context,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Dismissible(
                                key: UniqueKey(),
                                background: Container(
                                  color: AppColors.green,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                        const Gap(10),
                                        Text(
                                          'Completed',
                                          style: getBodyStyle(context,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                secondaryBackground: Container(
                                  color: AppColors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                        const Gap(10),
                                        Text(
                                          'Delete Task',
                                          style: getBodyStyle(context,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onDismissed: (direction) {
                                  if (direction ==
                                      DismissDirection.startToEnd) {
                                    box.put(
                                        tasks[index].id,
                                        TaskModel(
                                            id: tasks[index].id,
                                            title: tasks[index].title,
                                            note: tasks[index].note,
                                            date: tasks[index].date,
                                            startTime: tasks[index].startTime,
                                            endTime: tasks[index].endTime,
                                            color: 3,
                                            isCompleted: true));
                                  } else {
                                    box.delete(tasks[index].id);
                                  }
                                },
                                child: InkWell(
                                  onTap: () {},
                                  child: TaskItem(
                                    model: tasks[index],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
