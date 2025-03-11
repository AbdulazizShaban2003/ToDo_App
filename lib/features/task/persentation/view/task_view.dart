import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/themes/app_color.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/home/components/build_container.dart';
import 'package:todo_app/features/task/data/database/task_database.dart';
import '../../../../core/utils/size_manager.dart';
import '../../../states/cubit/task_cubit.dart';
import '../components/end_time.dart';
import '../components/start_time.dart';
import '../widget/custom_date_input.dart';
import '../widget/custom_list_color_task.dart' show CustomListOfColorTask;
import '../widget/custom_note_input.dart';
import '../widget/custom_title_input.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TaskDatabase taskDatabase = TaskDatabase();
    TextTheme theme = Theme.of(context).textTheme;
    final taskCubit = context.read<TaskCubit>();

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
          MyString.addTask,
          style: theme.displayMedium!.copyWith(fontSize: 35),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeManager.appSizeWidth(
              context: context,
              widthApp: 0.03,
            ),
            vertical: SizeManager.appSizeHeight(
              context: context,
              heightApp: 0.02,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitleInput(theme: theme),
              SizedBox(
                height: SizeManager.appSizeHeight(
                  context: context,
                  heightApp: 0.03,
                ),
              ),
              CustomNoteInput(theme: theme),
              SizedBox(
                height: SizeManager.appSizeHeight(
                  context: context,
                  heightApp: 0.03,
                ),
              ),
              CustomDateInput(theme: theme),
              SizedBox(
                height: SizeManager.appSizeHeight(
                  context: context,
                  heightApp: 0.04,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [StartTime(theme: theme), EndTime(theme: theme)],
              ),
              SizedBox(
                height: SizeManager.appSizeHeight(
                  context: context,
                  heightApp: 0.04,
                ),
              ),

              CustomListOfColorTask(theme: theme),
              SizedBox(
                height: SizeManager.appSizeHeight(
                  context: context,
                  heightApp: 0.06,
                ),
              ),
              BuildContainer(
                theme: theme,
                action: MyString.createTask,
                onPressed: () {
                  taskDatabase.insertData(
                    title: taskCubit.titleController.text,
                    note: taskCubit.noteController.text,
                    startTime: taskCubit.startTimeController.text,
                    endTime: taskCubit.endTimeController.text,
                    color: 1,
                  );
                },
                color: AppColor.primaryLightColor,
              ),
              SizedBox(
                height: SizeManager.appSizeHeight(
                  context: context,
                  heightApp: 0.02,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
