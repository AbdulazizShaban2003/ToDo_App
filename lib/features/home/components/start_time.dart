import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/themes/app_color.dart';
import '../controller/task_controller.dart';

class StartTime extends StatelessWidget {
  const StartTime({
    super.key,
    required this.theme,
    required this.taskController,
  });

  final TextTheme theme;
  final TaskController taskController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Start Time", style: theme.displayMedium),
        const SizedBox(height: 10),
        SizedBox(
          width: 170,
          child: TextFormField(
            style: theme.displayMedium,

            controller: taskController.startTimeController,
            readOnly: true,
            decoration: InputDecoration(
              hintText: "Start Time",
              suffixIcon: InkWell(
                onTap: () => taskController.selectTime(
                    context, taskController.startTimeController),
                child: const Icon(CupertinoIcons.clock_fill,color: AppColor.whiteColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
