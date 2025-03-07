import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/features/home/components/no_task.dart';
import 'package:todo_app/features/home/widget/custom_fab.dart';
import '../../core/themes/app_color.dart';
import 'components/build_container.dart';
import 'components/task.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColor.blackColor,
      floatingActionButton: const FAB(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              DateFormat.yMMMMd().format(_selectedDate),
              style: theme.headlineLarge!.copyWith(color: AppColor.whiteColor),
            ),
            const SizedBox(height: 20),
            Text(
              "Today",
              style: theme.headlineLarge!.copyWith(color: AppColor.whiteColor),
            ),
            const SizedBox(height: 20),

            SizedBox(
              height: 100,
              width: double.infinity,
              child: DatePicker(
                width: 70,
                DateTime.now(),
                dayTextStyle: theme.displayMedium!,
                initialSelectedDate: _selectedDate,
                selectionColor: AppColor.primaryColor,
                selectedTextColor: AppColor.whiteColor,
                dateTextStyle: theme.displayMedium!,
                monthTextStyle: theme.displayMedium!,

                onDateChange: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
            ),
            SizedBox(height: 70),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return Container(
                      color: AppColor.deepGreyColor,
                      width: double.infinity,
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BuildContainer(
                              theme: theme,
                              action: 'Task Completed',
                              onPressed: () {},
                              color: AppColor.primaryLightColor,
                            ),
                            BuildContainer(
                              theme: theme,
                              action: 'DELETE TASK',
                              onPressed: () {},
                              color: AppColor.redColor,
                            ),
                            BuildContainer(
                              theme: theme,
                              action: 'CANCEL',
                              onPressed: () {},
                              color: AppColor.primaryLightColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: CustomTask(theme: theme),
            ),

            // CustomNotask(theme: theme),
          ],
        ),
      ),
    );
  }
}
