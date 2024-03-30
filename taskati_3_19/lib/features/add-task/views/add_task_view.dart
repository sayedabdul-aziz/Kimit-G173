import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati_3_19/core/functions/routing.dart';
import 'package:taskati_3_19/core/services/local_storage.dart';
import 'package:taskati_3_19/core/utils/colors.dart';
import 'package:taskati_3_19/core/utils/text_styles.dart';
import 'package:taskati_3_19/features/add-task/model/task_model.dart';
import 'package:taskati_3_19/features/home/home_view.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

// Wrap column with form widget and adding its key
// validator on textFormField
class _AddTaskViewState extends State<AddTaskView> {
  int selectdColor = 0;
  var titleController = TextEditingController();
  var noteController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add Your Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: getTitleStyle(context, fontSize: 16),
              ),
              const Gap(7),
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Enter Title Here',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Title';
                  }
                  return null;
                },
              ),
              const Gap(10),
              Text(
                'Note',
                style: getTitleStyle(context, fontSize: 16),
              ),
              const Gap(7),
              TextFormField(
                controller: noteController,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Enter Note Here',
                ),
              ),
              const Gap(10),

              // -----------------------------date -----------------
              Text(
                'Date',
                style: getTitleStyle(context, fontSize: 16),
              ),
              const Gap(7),
              TextFormField(
                onTap: () {
                  showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          initialDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)))
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        date = DateFormat('dd/MM/yyyy').format(value);
                      });
                    }
                  });
                },
                readOnly: true,
                decoration: InputDecoration(
                    hintText: date,
                    hintStyle: getBodyStyle(
                      context,
                    ),
                    suffixIcon: Icon(
                      Icons.calendar_month,
                      color: AppColors.primary,
                    )),
              ),
              const Gap(10),
              // -----------------------------start and end time -----------------
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Start Time',
                      style: getTitleStyle(context, fontSize: 16),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Text(
                      'End Time',
                      style: getTitleStyle(context, fontSize: 16),
                    ),
                  ),
                ],
              ),
              const Gap(7),
              Row(
                children: [
                  // -----------------------------start -----------------
                  Expanded(
                    child: TextFormField(
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              startTime = value.format(context);
                              endTime = value
                                  .replacing(minute: value.minute + 15)
                                  .format(context);
                            });
                          }
                        });
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: startTime,
                          hintStyle: getBodyStyle(
                            context,
                          ),
                          suffixIcon: Icon(
                            Icons.watch_later_outlined,
                            color: AppColors.primary,
                          )),
                    ),
                  ),
                  const Gap(10),
                  // -----------------------------end -----------------
                  Expanded(
                    child: TextFormField(
                      onTap: () {
                        showTimePicker(
                                context: context,
                                initialEntryMode: TimePickerEntryMode.input,
                                initialTime: TimeOfDay.now())
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              endTime = value.format(context);
                            });
                          }
                        });
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: endTime,
                          hintStyle: getBodyStyle(
                            context,
                          ),
                          suffixIcon: Icon(
                            Icons.watch_later_outlined,
                            color: AppColors.primary,
                          )),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              // color and btnn
              Row(
                children: [
                  // colors

                  Row(
                    children: List.generate(3, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(4),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectdColor = index;
                            });
                          },
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: index == 0
                                ? AppColors.primary
                                : (index == 1)
                                    ? AppColors.orange
                                    : AppColors.red,
                            child: selectdColor == index
                                ? Icon(
                                    Icons.check,
                                    color: AppColors.white,
                                  )
                                : const SizedBox(),
                          ),
                        ),
                      );
                    }),
                  ),
                  const Spacer(),
                  // btn
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        String id = DateTime.now().toIso8601String();
                        AppLocalStorage.cacheTask(
                            id,
                            TaskModel(
                                id: id,
                                title: titleController.text,
                                note: noteController.text,
                                date: date,
                                startTime: startTime,
                                endTime: endTime,
                                color: selectdColor,
                                isCompleted: false));
                        navigateWithReplacment(context, const HomeView());
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        // gradient: const LinearGradient(colors: []),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Create Task',
                        style: getBodyStyle(context, color: AppColors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
