import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/themes/app_color.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/size_manager.dart';
import '../controller/task_controller.dart';

class CustomDateInput extends StatelessWidget {
  const CustomDateInput({
    super.key,
    required this.theme,
    required this.taskController,
  });

  final TextTheme theme;
  final TaskController taskController;

  @override
  Widget build(BuildContext context) {
    final taskController = Provider.of<TaskController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(MyString.date, style: theme.displayMedium),
        SizedBox(
          height: SizeManager.appSizeHeight(context: context, heightApp: 0.02),
        ),
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
            hintText: MyString.hintTextDate,
          ),
        ),
      ],
    );
  }
}
