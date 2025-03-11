import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/themes/app_color.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/size_manager.dart';
import '../../../states/cubit/task_cubit.dart';

class CustomDateInput extends StatelessWidget {
  const CustomDateInput({
    super.key,
    required this.theme,
  });

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    final taskCubit = context.read<TaskCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(MyString.date, style: theme.displayMedium),
        SizedBox(
          height: SizeManager.appSizeHeight(context: context, heightApp: 0.02),
        ),
        TextFormField(
          style: theme.displayMedium,
          controller:   taskCubit.dateController,
          readOnly: true,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () =>  context.read<TaskCubit>().selectDate(context),
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
