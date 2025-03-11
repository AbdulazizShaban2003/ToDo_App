import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/themes/app_color.dart';
import 'package:todo_app/core/utils/size_manager.dart';

import '../../../states/cubit/task_cubit.dart';

class StartTime extends StatelessWidget {
  const StartTime({super.key, required this.theme});

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
        final taskCubit = context.read<TaskCubit>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(MyString.startTime, style: theme.displayMedium),
            SizedBox(height: SizeManager.appSizeHeight(context: context, heightApp: 0.015)),
            SizedBox(
              width: SizeManager.appSizeWidth(context: context, widthApp: 0.42),
              child: TextFormField(
                style: theme.displayMedium,
                controller: taskCubit.startTimeController,
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () => taskCubit.selectTime(context, true),
                    child: const Icon(CupertinoIcons.clock_fill, color: AppColor.whiteColor),
                  ),
                ),
              ),
            ),
          ],
    );
  }
}
