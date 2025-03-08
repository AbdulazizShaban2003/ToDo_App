import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;
import 'package:todo_app/core/themes/app_color.dart';
import 'package:todo_app/features/home/components/build_container.dart';
import 'package:todo_app/features/home/controller/task_controller.dart';

import 'components/end_time.dart';
import 'components/start_time.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Provider.of<TaskController>(context);

    TextTheme theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColor.blackColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColor.whiteColor,
          ),
        ),
        title: Text(
          "Add Task",
          style: theme.displayMedium!.copyWith(fontSize: 35),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Title", style: theme.displayMedium),
              const SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter title here"),
              ),
              const SizedBox(height: 25),
              Text("Note", style: theme.displayMedium),
              const SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter note here"),
              ),
              const SizedBox(height: 25),
              Text("Date", style: theme.displayMedium),
              const SizedBox(height: 15),
              TextFormField(
                style: theme.displayMedium,
                controller: taskController.dateController,
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () => taskController.selectDate(context),
                    child: Icon(
                      Icons.calendar_month_rounded,
                      color: AppColor.whiteColor,
                      size: 30,
                    ),
                  ),
                  hintText: "Select Date",
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StartTime(theme: theme, taskController: taskController),
                  EndTime(theme: theme, taskController: taskController),
                ],
              ),
              const SizedBox(height: 100),
              BuildContainer(
                theme: theme,
                action: "Create task",
                onPressed: (){},
                color: AppColor.primaryLightColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
