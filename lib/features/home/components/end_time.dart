import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/themes/app_color.dart';

import '../controller/task_controller.dart';

class EndTime extends StatelessWidget {
  const EndTime({
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
        Text("End Time", style: theme.displayMedium),
        const SizedBox(height: 10),
        SizedBox(
          width: 170,
          child: TextFormField(
            style: theme.displayMedium,

            controller: taskController.endTimeController,
            readOnly: true,
            decoration: InputDecoration(
              hintText: "End Time",
              suffixIcon: InkWell(
                onTap: () => taskController.selectTime(
                    context, taskController.endTimeController),
                child:  Icon(CupertinoIcons.clock_fill,color: AppColor.whiteColor,),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
