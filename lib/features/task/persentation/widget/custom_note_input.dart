import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/size_manager.dart';
import '../../../states/cubit/task_cubit.dart';

class CustomNoteInput extends StatelessWidget {
  const CustomNoteInput({super.key, required this.theme});

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    final taskCubit = context.read<TaskCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(MyString.note, style: theme.displayMedium),
        SizedBox(
          height: SizeManager.appSizeHeight(context: context, heightApp: 0.02),
        ),
        TextFormField(
          controller: taskCubit.noteController,
          decoration: InputDecoration(hintText: MyString.hintTextNote),
        ),
      ],
    );
  }
}
