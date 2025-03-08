import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_strings.dart';

import '../../../core/themes/app_color.dart';
import '../../../core/utils/size_manager.dart';
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
        Text(MyString.startTime, style: theme.displayMedium),
         SizedBox(height: SizeManager.appSizeHeight(context: context, heightApp: 0.015)),
        SizedBox(
          width: SizeManager.appSizeWidth(context: context, widthApp: 0.42),
          child: TextFormField(
            style: theme.displayMedium,

            controller: taskController.startTimeController,
            readOnly: true,
            decoration: InputDecoration(
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
