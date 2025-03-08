import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;
import 'package:todo_app/core/themes/app_color.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/home/components/build_container.dart';
import 'package:todo_app/features/home/controller/task_controller.dart';
import '../../../core/utils/size_manager.dart';
import '../components/end_time.dart';
import '../components/start_time.dart';
import '../widgets/custom_date_input.dart';
import '../widgets/custom_list_color_task.dart' show CustomListOfColorTask;
import '../widgets/custom_note_input.dart';
import '../widgets/custom_title_input.dart';

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
              CustomDateInput(theme: theme, taskController: taskController),
              SizedBox(
                height: SizeManager.appSizeHeight(
                  context: context,
                  heightApp: 0.04,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StartTime(theme: theme, taskController: taskController),
                  EndTime(theme: theme, taskController: taskController),
                ],
              ),
              SizedBox(
                height: SizeManager.appSizeHeight(
                  context: context,
                  heightApp: 0.04,
                ),
              ),

              CustomListOfColorTask(theme: theme,),
              SizedBox(
                height: SizeManager.appSizeHeight(
                  context: context,
                  heightApp: 0.06,
                ),
              ),
              BuildContainer(
                theme: theme,
                action: MyString.createTask,
                onPressed: () {},
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



