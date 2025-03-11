import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/size_manager.dart';
import '../../../states/cubit/task_cubit.dart';

class CustomTitleInput extends StatelessWidget {
  const CustomTitleInput({super.key, required this.theme});

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    final taskCubit = context.read<TaskCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(MyString.title, style: theme.displayMedium),
        SizedBox(
          height: SizeManager.appSizeHeight(context: context, heightApp: 0.02),
        ),
        TextFormField(
          controller: taskCubit.titleController,
          decoration: InputDecoration(hintText: MyString.hintTextTitle),
        ),
      ],
    );
  }
}
